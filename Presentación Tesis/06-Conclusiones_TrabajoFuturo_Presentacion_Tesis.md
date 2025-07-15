# 06-Conclusiones_TrabajoFuturo_Presentacion_Tesis.md

## Speech para la sección de Conclusiones y Trabajo Futuro

---

### Slide 1: Logros Principales

"Este trabajo ha desarrollado exitosamente dos modelos de aprendizaje profundo para el diagnóstico de 15 patologías pulmonares a partir de imágenes de rayos X, incluyendo COVID-19. Los modelos propuestos, basados en ResNet50 y Vision Transformer, han demostrado un rendimiento excepcional, superando significativamente al estado del arte en múltiples métricas.

El modelo ResNet50 alcanza un AUC-ROC Global-15 de 0.852, estableciendo un nuevo estándar en la literatura. Para COVID-19 específicamente, ambos modelos logran resultados sobresalientes: ResNet50 con AUC-ROC de 0.991 y ViT con 0.982, demostrando la efectividad del enfoque propuesto."

---

### Slide 2: Contribuciones Científicas

"Las principales contribuciones de este trabajo incluyen la introducción de Vision Transformers como arquitectura alternativa a las redes convolucionales para análisis de imágenes médicas. Se ha demostrado que los Transformers pueden competir efectivamente con las CNNs tradicionales, aunque requieren mayor ajuste y tiempo de entrenamiento. Con el incremento de datos y calidad en un futuro pueden llegar a competir a la par con los modelos convolucionales

La estrategia de Transfer Learning implementada, con sus tres etapas progresivas (entrenamiento inicial, fine-tuning y full-tuning), ha permitido desarrollar modelos robustos que preservan el rendimiento en las patologías originales mientras incorporan exitosamente la detección de COVID-19."

---

### Slide 3: Capacidad de Extensión Demostrada

"Se ha demostrado exitosamente la capacidad de extensión de los modelos a nuevas patologías mediante la implementación de un clasificador binario para tuberculosis. El modelo extendido alcanza un F1-Score de 0.707 y Accuracy de 0.846, comparable con métodos específicos para tuberculosis reportados en la literatura.

Esta extensión confirma que la arquitectura propuesta puede servir como base para implementar detectores de otras patologías pulmonares, proporcionando una plataforma versátil para futuras aplicaciones médicas."

---

### Slide 4: Limitaciones Identificadas

"El trabajo reconoce importantes limitaciones que deben ser consideradas. La calidad y representatividad de los datos utilizados pueden afectar la generalización y robustez de los modelos. La falta de validación clínica para aplicación real en entornos médicos es una limitación significativa.

Los recursos computacionales limitados restringieron la resolución de imagen del modelo ViT (384x384 vs 1024x1024), afectando su rendimiento potencial. Además, la diversidad de fuentes y configuraciones de dispositivos para adquisición de radiografías puede limitar la generalización."

---

### Slide 5: Líneas de Trabajo Futuro - Arquitecturas

"Este trabajo también habre a la exploración de otras lineas de trabajo. Como incluir otras arquitecturas y técnicas de aprendizaje profundo que puedan mejorar el rendimiento y eficiencia. Por ejemplo probar con otros modelos más recientes como EfficientNet, DenseNet avanzados, y variantes mejoradas de Vision Transformers con otras técnicas de atención."


"Es fundamental mejorar la calidad y diversificación de las bases de datos de imágenes de rayos X para cubrir más patologías y variaciones. Esto incluye la incorporación de datos de diferentes regiones geográficas, grupos demográficos y condiciones clínicas.

La validación clínica rigurosa es esencial para el uso real de estos modelos a través de estudios multicéntricos, validación en entornos hospitalarios reales, comparación con estándares clínicos.

Se requiere desarrollar protocolos de evaluación clínica, estudios prospectivos y validación en entornos hospitalarios reales. Así como cumplir con regulaciones y certificaciones de estos sistemas para uso médico."

---

### Slide 8: Líneas de Trabajo Futuro - Multimodalidad

"La incorporación de otras modalidades de imagen, como tomografía computarizada (CT) y resonancia magnética (MRI), puede ofrecer información complementaria y mejorar la precisión diagnóstica. El desarrollo de modelos multimodales que integren diferentes tipos de imágenes médicas representa una línea prometedora.

También se sugiere explorar la integración de datos clínicos adicionales, como historiales médicos, síntomas del paciente y resultados de laboratorio, para crear sistemas de diagnóstico más completos y precisos."

---

### Slide 9: Líneas de Trabajo Futuro - Herramientas Visuales

"El desarrollo y mejora de herramientas visuales y mapas de calor es crucial para la aceptación clínica. Se requiere avanzar en técnicas de interpretabilidad como GradCAM, SHAP y otros métodos de explicabilidad para proporcionar justificaciones claras de las predicciones.

La creación de interfaces de usuario intuitivas que faciliten la interpretación de resultados por parte de radiólogos es esencial. Esto incluye el desarrollo de dashboards clínicos y sistemas de reporte automatizado."

---

<!-- ### Slide 10: Impacto Clínico y Social

"Los modelos desarrollados tienen el potencial de impactar significativamente la práctica clínica, especialmente en regiones con recursos limitados donde el acceso a radiólogos especializados es escaso. Pueden servir como herramientas de triaje y apoyo diagnóstico, reduciendo tiempos de espera y mejorando la eficiencia del sistema de salud.

La capacidad de extensión a nuevas patologías permite adaptar estos sistemas a diferentes contextos epidemiológicos y necesidades locales, haciendo que la tecnología sea accesible y relevante para diversas poblaciones."

--- -->

### Slide 11: Conclusiones Finales

"Este trabajo ha establecido nuevos estándares en la detección de patologías pulmonares mediante aprendizaje profundo, demostrando la viabilidad de usar Vision Transformers en análisis de imágenes médicas. Los resultados bastante competitivos en COVID-19 y la capacidad de extensión a tuberculosis confirman la versatilidad del enfoque.

La combinación de rendimiento superior al estado del arte, interpretabilidad clínica y capacidad de extensión posiciona estos modelos como herramientas valiosas para el futuro del diagnóstico radiológico asistido por computadora."
