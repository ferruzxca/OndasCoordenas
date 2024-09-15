# Intersección de Dos Funciones Trigonométricas en MATLAB

Este script en MATLAB permite al usuario ingresar dos funciones trigonométricas de `x`, como `sin(x)` y `sin(2*x)`, y luego calcula y grafica las intersecciones entre ellas. El código también muestra las coordenadas de los puntos de intersección en términos de `π` en la consola y en la gráfica.

## Funcionamiento

1. **Ingreso de Funciones**: El usuario ingresa dos funciones de `x`, como `sin(x)` y `sin(2*x)`. Estas funciones se convierten en funciones anónimas en MATLAB para ser evaluadas posteriormente.

2. **Cálculo de Frecuencia**: El script busca el coeficiente de `x` en cada función, lo que permite determinar la frecuencia de cada una. La frecuencia se usa para calcular el período de la función.

3. **Determinación del Rango**: El código selecciona la función con la menor frecuencia para definir el rango de `x` de tal forma que se muestren exactamente tres ciclos completos de esta función.

4. **Cálculo de Intersecciones**: El código compara los valores de `y` de ambas funciones en los mismos puntos de `x`, y utiliza un método de búsqueda precisa para determinar los puntos exactos donde las dos funciones se intersectan.

5. **Visualización**: Se genera una gráfica que muestra ambas funciones, resaltando los puntos de intersección con marcadores. La gráfica se ajusta para mostrar los valores de `x` en términos de fracciones de `π`, y se etiqueta cada punto de intersección.

6. **Salida en Consola**: Los puntos de intersección se imprimen en la consola en términos de `x` (como múltiplos de `π`) y sus valores correspondientes de `y`.

## Instrucciones de Uso

1. **Clonar el repositorio**: Clona este repositorio en tu máquina local:

   ```bash
   git clone https://github.com/tu-repositorio/nombre-del-repositorio.git
   cd nombre-del-repositorio
   ```

2. **Abrir MATLAB**: Abre el entorno de MATLAB en tu máquina.

3. **Ejecutar el script**: Ejecuta el script en MATLAB con el siguiente comando:

   ```matlab
   run('nombre-del-archivo.m')
   ```

4. **Ingresar las funciones**: El programa solicitará que ingreses dos funciones trigonométricas de `x`. Puedes probar con ejemplos como:

   ```text
   sin(x)
   sin(2*x)
   cos(3*x)
   ```

5. **Ver la gráfica**: Se generará una gráfica con ambas funciones y los puntos de intersección resaltados. Los valores de `x` se mostrarán en términos de fracciones de `π` para mayor claridad.

6. **Consultar los puntos de intersección**: Los puntos de intersección calculados se mostrarán tanto en la gráfica como en la consola en términos de `π`.

## Ejemplo

Si ingresas las funciones `sin(x)` y `sin(2*x)`, el script calculará las intersecciones de estas funciones y generará la siguiente salida en la consola:

```text
Puntos de intersección (x, y) en términos de pi:
   0.0000   0.0000
   1.0000   0.0000
   2.0000   0.0000
```

## Requisitos

- MATLAB instalado en tu equipo.
- El script debe estar ubicado en un directorio accesible desde MATLAB.

## Notas

- El código está diseñado para trabajar con funciones trigonométricas `sin(x)` o `cos(x)` con coeficientes multiplicadores de `x`.
- Asegúrate de ingresar funciones válidas en términos de `x` en la entrada de usuario.

## Función Auxiliar

El código utiliza una función auxiliar llamada `obtener_frecuencia` para calcular la frecuencia de las funciones trigonométricas ingresadas. Esta función busca el coeficiente de `x` en las funciones `sin()` o `cos()` y devuelve la frecuencia correspondiente.
