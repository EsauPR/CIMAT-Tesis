# 05-Metodologia_Presentacion_Tesis.md

## Speech para la sección de Metodología

---

### Slide 1: Flujo General de la Metodología

"La metodología de este trabajo se centra en el desarrollo de modelos de aprendizaje profundo para la detección de 15 patologías pulmonares en rayos X. Se emplean dos enfoques principales: uno basado en ResNet50, una red convolucional, y otro en Vision Transformer. El proceso está estructurado en etapas de preprocesamiento, entrenamiento, evaluación y extensión a nuevas patologías."

---

### Slide 2: Bases de Datos y Composición

"Utilizamos el dataset ChestX-ray14, que contiene más de 112 mil imágenes de 30 mil pacientes y 14 patologías. Este conjunto se extendió con imágenes de COVID-19 y casos saludables. Además, se aplicó un proceso de re-etiquetado automático para mejorar la calidad de las etiquetas, usando modelos de redes neuronales."

---

### Slide 3: Preprocesamiento de Imágenes

"El preprocesamiento incluye el redimensionamiento de las imágenes a 1024x1024 y 384x384 píxeles, normalización y estandarización de intensidades. Se aplican técnicas de data augmentation como rotaciones, traslaciones, escalados y flips para aumentar la robustez del modelo."

---

### Slide 4: Entrenamiento: Transfer Learning y Fine-Tuning

"Ambos modelos, ResNet50 y ViT, se inicializan con pesos preentrenados en ImageNet. El entrenamiento se realiza en tres etapas: primero, transfer learning cambiando la capa de salida; segundo, fine-tuning de las últimas capas; y finalmente, full-tuning de toda la red. Esto permite adaptar modelos generales a tareas médicas específicas con menos datos."

---

### Slide 5: Arquitectura de los Modelos

"ResNet50 es una red convolucional profunda con conexiones residuales, ideal para extraer características espaciales. El Vision Transformer divide la imagen en parches y los procesa como una secuencia, utilizando mecanismos de atención para capturar relaciones globales. En pantalla se muestra un esquema del codificador Transformer."

---

### Slide 6: Evaluación y Métricas

"Los datos se dividen en conjuntos de entrenamiento, validación y prueba. Se emplean métricas como AUC, precisión, recall, F1-score y matriz de confusión. Además, se visualizan los resultados mediante mapas de calor y curvas ROC, como se observa en la figura de atención del modelo Transformer."

---

### Slide 7: Extensión y Generalización

"El modelo puede ser extendido fácilmente a nuevas patologías, como tuberculosis, gracias al proceso de re-etiquetado y entrenamiento. Esto permite adaptar el sistema a diferentes escenarios clínicos, logrando resultados competitivos frente al estado del arte en todas las patologías evaluadas."
