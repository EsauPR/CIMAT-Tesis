# 05-Resultados_Presentacion_Tesis.md

## Speech para la sección de Resultados

---

### Slide 1: Resumen de Resultados

"Los modelos propuestos demuestran un rendimiento excepcional en la detección de patologías pulmonares.

El modelo ResNet50 alcanza un AUC-ROC Global-15 de 0.852, superando significativamente a CheXNet (0.841) y otros métodos del estado del arte.

Para COVID-19 específicamente, ambos modelos logran resultados sobresalientes: ResNet50 con AUC-ROC de 0.991 y ViT con 0.982.

Es importante destacar que los modelos propuestos superan a los radiólogos humanos en 6 de las 15 patologías evaluadas, demostrando la efectividad del deep learning en tareas de diagnóstico radiológico."

---

### Slide 2: Comparación con el Estado del Arte

"La comparación con métodos recientes muestra que nuestro modelo ResNet50 lidera en múltiples patologías. Destaca especialmente en Emphysema (AUC-ROC: 0.938), Nodule (0.806),Pneumothorax (0.906), Pleural-Thickening (0.820) y Fibrosis (0.852), superando a CheXNet y otros métodos comparativos.

Para COVID-19, nuestro modelo ResNet50 alcanza un AUC-ROC de 0.991, estableciendo un nuevo estándar en la literatura. Esta métrica es particularmente significativa considerando que COVID-19 es una enfermedad nueva que no estaba presente en los datos de entrenamiento originales."

---

### Slide 3: Resultados por Patología - ResNet50

"El modelo ResNet50 muestra un rendimiento consistente y robusto en todas las patologías. Las mejores métricas se observan en COVID-19 con AUC-ROC de 0.991 y F1-Score de 0.799, seguido por Emphysema con AUC-ROC de 0.938.

Patologías como Cardiomegaly (0.875), Effusion (0.850), Pneumothorax (0.906) y Edema (0.879) también muestran excelente rendimiento. Es notable que el modelo mantiene buenos resultados incluso en patologías con pocos casos como Hernia (0.855)."

---

### Slide 4: Resultados por Patología - ViT

"El modelo Vision Transformer, aunque con menor resolución de imagen (384x384 vs 1024x1024), mantiene un rendimiento competitivo. Para COVID-19 alcanza un AUC-ROC de 0.982, muy cercano al modelo ResNet50.

El ViT muestra fortalezas particulares en Cardiomegaly (0.866), Emphysema (0.866) y Pneumothorax (0.842). La diferencia en rendimiento global se atribuye principalmente a la limitación de resolución de imagen debido a restricciones computacionales."

---

### Slide 5: Curvas ROC - ResNet50

"Las curvas ROC del modelo ResNet50 muestran excelente separabilidad para todas las patologías. La curva de COVID-19 se encuentra muy por encima de la diagonal, indicando una capacidad discriminativa excepcional.

Las curvas para Emphysema, Pneumothorax y Cardiomegaly también muestran áreas bajo la curva muy altas, confirmando la robustez del modelo en la detección de estas patologías."

---

### Slide 6: Curvas ROC - ViT

"Las curvas ROC del modelo ViT confirman su capacidad de discriminación efectiva. Aunque algunas curvas muestran menor área bajo la curva comparado con ResNet50, el modelo mantiene un rendimiento sólido.

La curva de COVID-19 sigue siendo excepcional, demostrando que la arquitectura Transformer puede capturar efectivamente las características distintivas de esta patología."

---

### Slide 7: Visualización de Atención - GradCAM

"La visualización mediante GradCAM revela que ambos modelos aprenden a enfocar su atención en regiones anatómicamente relevantes. Para Cardiomegaly, el modelo identifica correctamente el área del corazón agrandado.

En casos de COVID-19, las regiones de atención se concentran en las áreas pulmonares afectadas, mostrando patrones de opacidad característicos de la neumonía viral. Esta interpretabilidad clínica es crucial para la aceptación del sistema por parte de los médicos."

---

### Slide 8: Comparación con Radiólogos Humanos

"Los resultados muestran que los modelos de deep learning superan a los radiólogos en 6 de las 15 patologías evaluadas. Específicamente, nuestro modelo ResNet50 lidera en Emphysema, Nodule, Pneumothorax, Pleural-Thickening y Fibrosis.

Los radiólogos mantienen ventaja en patologías como Effusion, Hernia, Mass, Pneumothorax, Fibrosis, Edema y Consolidation, donde su experiencia clínica y capacidad de interpretación contextual son insustituibles."

---

### Slide 9: Extensión a Tuberculosis - Resultados

"La extensión del modelo a la detección de tuberculosis demuestra la flexibilidad de la arquitectura propuesta. El clasificador binario alcanza un F1-Score de 0.707 y Accuracy de 0.846, comparable con métodos específicos para tuberculosis.

El análisis de los casos de tuberculosis en el modelo original de 15 patologías revela que la mayoría son detectados como COVID-19 o neumonía, lo cual es esperable dado que la tuberculosis puede presentar características radiológicas similares."

---

### Slide 10: Análisis de Limitaciones y Fortalezas

"El modelo ResNet50 muestra mejor rendimiento general debido a su mayor resolución de imagen (1024x1024 vs 384x384). Sin embargo, el ViT mantiene ventajas en convergencia más rápida y menor número de épocas de entrenamiento.

La limitación principal del ViT es el consumo de memoria, que restringe la resolución de imagen. Futuras implementaciones con mayor capacidad computacional podrían mejorar significativamente su rendimiento."

---

### Slide 11: Conclusiones de Resultados

"Los modelos propuestos establecen nuevos estándares en la detección de patologías pulmonares, superando significativamente al estado del arte en múltiples métricas. La capacidad de extensión a nuevas patologías como tuberculosis demuestra la versatilidad del enfoque.

La interpretabilidad clínica proporcionada por GradCAM, combinada con el rendimiento excepcional, posiciona estos modelos como herramientas valiosas para el apoyo al diagnóstico radiológico."
