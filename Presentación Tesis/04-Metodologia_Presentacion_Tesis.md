# 05-Metodologia_Presentacion_Tesis.md

## Speech para la sección de Metodología

---

### Slide 1: Flujo General de la Metodología

"La metodología de este trabajo se centra en el desarrollo de modelos de aprendizaje profundo para la detección de 15 patologías pulmonares en rayos X. Se emplean dos enfoques principales: uno basado en ResNet50, una red convolucional, y otro en Vision Transformer. El proceso está estructurado en etapas de preprocesamiento, entrenamiento, evaluación y extensión a nuevas patologías."

---

### Slide 2: Bases de Datos y Composición

"Utilizamos el dataset ChestX-ray14, que contiene más de 112 mil imágenes de 30 mil pacientes y 14 patologías. Este conjunto se extendió con imágenes de COVID-19 y casos saludables.

Las imágenes de rayos X correspondientes a COVID-19 fueron obtenidas de dos bases de datos

**bimcv-covid19**
El conjunto de datos BIMCV-COVID19 fue creado Banco de Imágenes Médicas de la Comunidad Valenciana (BIMCV) en colaboración con el Centro de Investigación Príncipe Felipe (CIPF) en España


**COVID-19 image data collection**
También encontrado como covid-chestxray-dataset promovidas por la Universidad de Montreal contando en total con más de 2800 imáges etiquetadas con el padecimiento de COVID-19
"

---

### Slide 2.1: Tabla con número de radiografías

En la tabla podemos observar la distribución de las candidades de muestras identificadas con cada patología de cada fuente; 1 son los datos pertenecientes a ChestX-ray y 2 al dataset de BIMCV.
Es importante resaltar que para el dataset de COVID19 las imáges etiquetadas como saludables solo demuestran la ausencia de COVID19 o neumonía, pero no asegura la misma ausencia para otra patología.

### Slide 3: Preprocesamiento de Imágenes

"El preprocesamiento incluye el redimensionamiento de las imágenes a 1024x1024 píxeles para el modelo de RestNet y 384x384 píxeles para el modelo de ViT através del método de interpolación basado en área.

Esté método es útil para evitar artefactos y conservar la calidad de la imagen cuando se reduce su tamaño.

Posteriormente se realiza un proceso de ecualización por histograma a cada imagen sobre el canal de luminancia en el espacio de color YUV. Este proceso se realiza con la intensión de mejorar el contraste de cada imágen.

Finalmente se realiza una normalización a las imágenes usando la media y desviación estandar del conjunto de datos de ImageNet. Básicamente los valores de los pixeles se ajustan para que tengan una distribución más uniforme y carácterísticas similares a las imágenes usadas en el modelo pre-entrenado.

Se aplicó una técnica de data augmentation que consiste en voltear la imagen en sentido horizontal."


Notas:
La estrucutra del contraste es conservada por la normalización porque la ecualización es una transformación no lineal y la normalización si.

La relación de los pixeles con la ecualización cambia no linealmente porque usando el histograma hace que las diferencias entre los pixeles más obscuros y claros sean más pronunciados.

En cambio la normalización resta la media y divide por la desviación estandar para cada canal RGB, desplazando y escalando los valores, más no su orden relativo.

---

### Slide 4: Arquitectura de los Modelos

El modelo desarrollado se construye tomando CheXNet como referencia,  el cual clasifica entre 14 enfermedades usando el conjunto de datos ChestX-Ray14. Este modelo utiliza una red convolucional pre-entrenado como backbone, el DenseNet121 entrenado con la DB de ImageNet.

La transferencia de conocimiento se hace removiendo la etapa de clasificación del modelo original formado por capas densas, dejando las capas convolucionales intactas, para ser usadas como un extractor de características.

La misma idea se aplica para la propuesta, ahora basado en el modelo de RestNet50, una opción más eficiente computacionalmente, relativa sencillez en el entrenamiento y rendimiento ligeramente mayor que la DenseNet.

Se agrega una etapa clasificadora a la salida del modelo ResNet50 con salida con probabilidades de 15 clases para cada una de las patologías.

---


### Slide 4.1: Arquitectura de los Modelos

La etapa clasificador es un modelo que consta de capas densas.
Al inicio una operación Flatten para reducir a una dimensión lineal compatible con la etapa clasificadora.

Después pasa por una capa densa con dimensiones de entrada 2048 y salida 256 seguido de una función ReLU y un drop out con probabilidad de 0.25, seguido de otra capa densa con la salida respectiva de dimensión 15 aplicandose la función sigmoide con resultado la probabilida de presencia de cada patología.

---

### Slide 4.2: Arquitectura de Modelos

"El segundo enfoque utiliza Vision Transformers, una arquitectura revolucionaria que aplica los principios de atención de los Transformers al procesamiento de imágenes. A diferencia de las redes convolucionales, el modelo ViT descompone la imagen en parches de 32x32 píxeles, que son tratados como tokens secuenciales.

La arquitectura ViT-Base implementada cuenta con 12 capas codificadoras del Transformer, cada una con 12 cabezas de atención y un tamaño de embedding de 768 dimensiones. El modelo procesa imágenes de 384x384 píxeles y genera un vector de características de 768 dimensiones.

Para la clasificación, se agrega una etapa de MLP similar a la del modelo CNN: una capa densa que reduce de 768 a 256 dimensiones, seguida de ReLU y Dropout con probabilidad 0.25, y finalmente una capa de salida con 15 neuronas y función sigmoide para obtener las probabilidades de cada patología.

El mecanismo de atención permite al modelo capturar relaciones globales entre diferentes regiones de la imagen, lo que es especialmente útil para detectar patrones distribuidos en las radiografías pulmonares."

---

### Slide 4.3: Función de Coste

"Para abordar el desbalanceamiento de clases en el dataset, se utiliza una función de pérdida basada en Binary Cross-Entropy ponderada. Esta función asigna pesos diferentes a los casos positivos y negativos de cada patología, compensando la desigualdad en la distribución de datos.

La función de pérdida se define como la suma de 15 términos de Binary Cross-Entropy, uno para cada patología, donde cada término tiene pesos específicos para casos positivos y negativos. Los pesos se calculan de manera que sean inversamente proporcionales al número de casos en cada clase, dando mayor importancia a las clases minoritarias.

Esta estrategia de ponderación permite que el modelo aprenda de manera más equilibrada, evitando que se sesgue hacia las clases más representadas en el dataset. Como resultado, el modelo puede detectar patologías raras con mayor precisión, lo cual es crucial en aplicaciones médicas donde la detección temprana de enfermedades poco comunes puede salvar vidas."

---

### Slide 5: Entrenamiento: Transfer Learning y Fine-Tuning

"El entrenamiento de ambos modelos sigue una estrategia de tres etapas progresivas que permite adaptar modelos pre-entrenados en ImageNet a la tarea específica de detección de patologías pulmonares.

**Etapa 1 - Entrenamiento Inicial**: Se congelan los pesos del backbone pre-entrenado y solo se entrena el clasificador MLP. Para ResNet50 se entrenan 35 épocas, mientras que para ViT se requieren 25 épocas debido a su convergencia más rápida.

**Etapa 2 - Fine-tuning**: Se descongelan las últimas capas del backbone para especializar la extracción de características. En ResNet50 se descongela el último bloque convolucional, mientras que en ViT se descongelan los dos últimos bloques del Transformer. Se entrenan 20 épocas adicionales para ResNet50 y 12 para ViT.

**Etapa 3 - Full-tuning**: Se entrena toda la red para optimizar completamente el modelo. Se realizan 10 épocas para ResNet50 y 8 para ViT, evitando overfitting mediante early stopping basado en el accuracy de validación.

Se utiliza el optimizador Adam con learning rates de 1e-4 para ResNet50 y 1e-5 para ViT, con parámetros de inercia β₁=0.9 y β₂=0.999. Se implementa un decaimiento del learning rate de 0.1 si después de 10 iteraciones no se detecta una reducción en la función de pérdida mayor a 1e-4 (plateau escape), lo que actúa como un mecanismo de early stopping adicional."

---

### Slide 6: Evaluación y Métricas

"La evaluación de los modelos se realiza utilizando un conjunto de prueba independiente, manteniendo la estructura original de división de datos del dataset ChestX-ray14. Se emplea un umbral de clasificación de 0.5 para todas las patologías.

**Métricas principales utilizadas:**
- **AUC-ROC**: Área bajo la curva ROC, métrica principal para evaluar la capacidad discriminativa
- **AUC-PR**: Área bajo la curva Precision-Recall, especialmente importante para clases desbalanceadas
- **F1-Score**: Media geométrica entre precisión y recall, balance entre falsos positivos y negativos
- **Accuracy**: Proporción de predicciones correctas sobre el total

**Visualización de resultados:**
- **Curvas ROC**: Gráficas de TPR vs FPR para cada patología
- **Mapas de calor GradCAM**: Visualización de las regiones de atención del modelo
- **Matrices de confusión**: Análisis detallado de TP, TN, FP, FN por patología

La evaluación incluye tanto métricas globales (Global-14 para patologías originales, Global-15 incluyendo COVID-19) como métricas individuales por patología, permitiendo un análisis completo del rendimiento del sistema."

---

### Slide 7.1: Extensión a Tuberculosis - Dataset

"Para demostrar la capacidad de extensión del modelo, se implementa un clasificador binario para la detección de tuberculosis pulmonar, una enfermedad bacteriana común en países en desarrollo y frecuente en pacientes con VIH/SIDA.

El dataset de tuberculosis incluye 888 casos positivos y 6,000 casos negativos para entrenamiento, con 488 casos positivos y 1,600 negativos para prueba. Los datos provienen de múltiples fuentes: TBX11K dataset, India (DA and DB) dataset, Montgomery County dataset y Shenzhen Hospital dataset.

Es importante notar que los casos 'no tuberculosis' incluyen tanto pacientes saludables como pacientes con otras afecciones pulmonares, lo que refleja la realidad clínica donde la tuberculosis debe diferenciarse de múltiples condiciones respiratorias."

---

### Slide 7.2: Extensión a Tuberculosis - Arquitectura

"La extensión del modelo se realiza mediante una estrategia de transfer learning eficiente. Se utiliza el backbone ResNet50 pre-entrenado para las 15 patologías originales como extractor de características, manteniendo sus pesos congelados.

Se agrega una rama adicional de clasificación específica para tuberculosis que incluye:
- Una capa densa que reduce de 256 a 128 dimensiones
- Función de activación ReLU
- Dropout con probabilidad 0.20
- Capa de salida con 1 neurona y función sigmoide

Esta arquitectura permite que el modelo mantenga su capacidad de detectar las 15 patologías originales mientras agrega la detección de tuberculosis como una salida binaria adicional. Solo se entrenan las nuevas capas densas, conservando todo el conocimiento previamente adquirido."

---

### Slide 7.3: Extensión a Tuberculosis - Entrenamiento y Resultados

"El entrenamiento de la rama de tuberculosis sigue la estrategia de entrenamiento inicial: solo se entrenan las nuevas capas densas con el backbone congelado, utilizando la misma función de pérdida ponderada y optimizador Adam.

Los resultados muestran un F1-score de 0.707 y accuracy de 0.846, comparable con métodos específicos para detección de tuberculosis reportados en la literatura. El modelo alcanza 388 verdaderos positivos de 488 casos de tuberculosis en el conjunto de prueba.

Además, se evalúa el modelo original de 15 patologías en los casos de tuberculosis, observando que la mayoría son detectados como COVID-19 o neumonía, lo cual es esperable dado que la tuberculosis puede presentar características radiológicas similares a estas patologías. Esto confirma posiblidad de un entrenamiento específico para nuevas enfermedades basado en un proceso de extensión del modelo."
