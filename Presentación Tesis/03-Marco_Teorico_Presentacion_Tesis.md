# 04-Marco_Teorico_Presentacion_Tesis.md

## Speech para la sección de Marco Teórico

---

### Slide 1: Redes Neuronales Convolucionales (CNN)

"Las redes neuronales convolucionales, o tambien comocidas como CNN por sus siglas en inglés, son la base de muchos modelos usados para el análisis de imágenes médicas. Permiten extraer características espaciales relevantes y se utilizan ampliamente en tareas de clasificación, segmentación y detección. En pantalla pueden ver un esquema referencial de una red neuronal."

"Una CNN aprende características jerárquicas mediante convoluciones, pooling y capas densas"

---

### Slide 1.1 Estructura de una red convolucional

Una CNN típica consta de las siguientes capas principales
1. Capa de Convolución: Extrae características locales (como bordes, texturas, patrones) mediante filtros (kernels).
2. Capa de Activación (ReLU, LeakyReLU, etc.): para introducir no linealidad y eliminar valores negativos.
3. Capa de Pooling: Reducir la dimensionalidad (y el costo computacional) conservando la información más relevante.
4. Capas Fully Connected (Dense): Al final de la red, se aplanan los feature maps y se conectan a neuronas tradicionales para clasificación/regresión

---

### Slide 1.2 Aplicaciones de una red convolucional

- Clasificación de imágenes (ResNet, VGG).
- Detección de objetos (YOLO, Faster R-CNN).
- Segmentación semántica (U-Net).
- Procesamiento de lenguaje natural (CNNs para texto).

---

### Slide 2: ResNet50: Arquitectura Residual

"ResNet50 es una arquitectura profunda con 50 capas y conexiones residuales. Estas conexiones facilitan el entrenamiento de redes muy profundas, evitando el problema del desvanecimiento del gradiente. En esta tesis, ResNet50 se emplea como backbone para la extracción de características en imágenes de rayos X."

---

### Slide 2.1: ¿Por qué ResNet50 para esta tesis?

"La elección de ResNet50 para esta tesis se basa en varios factores clave. En primer lugar, ha demostrado excelente rendimiento en tareas de clasificación de imágenes médicas, siendo una arquitectura ampliamente validada en la comunidad científica. Ofrece un balance óptimo entre profundidad y eficiencia computacional, lo que es crucial para el procesamiento de imágenes médicas. Además, permite un transfer learning muy efectivo desde ImageNet hacia imágenes médicas, aprovechando el conocimiento pre-entrenado. Finalmente, su capacidad para capturar características complejas en imágenes de rayos X la hace ideal para la detección de patologías pulmonares."

---

### Slide 3: Redes Neuronales Recurrentes (RNN)

"Las redes neuronales recurrentes, o RNN, procesan secuencias de datos y mantienen información temporal, lo que es útil para tareas donde el contexto previo es importante. Existen variantes como LSTM y GRU que mejoran la capacidad de memoria de estas redes, agregando la capacidad de discriminar y preservar parte de la información temporal a corto o largo plazo."

---

### Slide 4: Mecanismos de Atención y Transformers

Los transformes son una alternativa a modelos como las RNN's dónde el contexto e información temporal son importantes. Estos modelos se basan en utilizar mecanismos de atención para capturar las relaciones relevantes bajo un contexto dado.

"Los mecanismos de atención permiten a los modelos enfocarse en partes relevantes de la entrada. Los Transformers revolucionaron el procesamiento de secuencias al permitir el procesamiento paralelo y el uso de atención múltiple, conocido como Multi-Head Attention. En el 2020 surgió Vision Transformer, o ViT, un modelo que aplica estos conceptos al análisis de imágenes."

---

### Slide 5: Resumen del Marco Teórico

"En resumen, se combinan arquitecturas convolucionales como ResNet50 y modelos basados en atención como los Transformers para la detección de patologías pulmonares. El uso de Transfer Learning y Fine-Tuning permite adaptar modelos preentrenados a imágenes médicas, mejorando la precisión y la interpretabilidad en el diagnóstico asistido por inteligencia artificial."

### Slide 5: Resumen del Marco Teórico

"A diferencia de las redes convolucionales, los transformers en lugar de aplicar convoluciones divide la imagen en pequeños segmentos.

El mecanismo de atención se aplica sobre todos los parches simultaneamentem Esto permite que cada parche vea a todos los demás, capturando relaciones espaciales globales desde el principio.

Como los transformers no tienen una noción inherente del orden o la estructura espacial, se agregan codificaciones posicionales para que el modelo sepa dónde está cada parche en la imagen.
"
