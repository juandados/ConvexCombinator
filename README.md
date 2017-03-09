# ConvexCombinator
Este repositorio contiene los archivos de simulación de un sistema tipo FIS-BKR con combinador convexo como controlador para el nivel de líquido de un tanque cilíndrico. (para más detalles revise el archivo Articulo).
------------------------------------
-----------ARCHIVOS-----------------
------------------------------------
1) Analsis.m
2) datosFinales.mat
3) Diseño de controlador.xlsx
4) formulas.m
5) GraficadorArticulo.m
6) Leeme.txt
7) modelo.mdl
8) U.m
9) Y.m

------------------------------------
-----------ARCHIVOS-----------------
------------------------------------
1) Analsis.m:
	- Realiza la variación de los parámetros a sintonizar en una rejilla y simula el archivo "modelo.mdl"
	- Calcula los índices de desempeño ITSE e ISE para cada simulación.
	- Realiza la gráfica de las superficies para estos índices.
	- Encuentra los mínimos de los índices de desempeño.
	- Realiza a las grafica de las respuestas temporales para los puntos óptimos y las esquinas del dominio de optimización.
2) datosFinales.mat:
	- Contiene los datos de simulación capturados para una rejilla de 16x16 puntos.
3) Diseño de controlador.xlsx
	- Archivo en el que se definen las reglas booleanas a las cuales se les va a obtener las extensiones Kleeneanas extremas. 
4) formulas.m
	- Obtiene las extensiones Kleeneanas extremas para las formulas dadas en "Diseño de controlador.xlsx"
5) GraficadorArticulo.m
	- Grafica los conjuntos difusos de los conceptos, y la superficie control.
6) Leeme.txt
	-Este Archivo!
7) modelo.mdl
	-Archivo Simulink con modelos de la planta y el controlador en realimentación negativa unitaria.
8) U.m
	-Función que calcula el máximo de un numero arbitrario de argumentos.
9) Y.m
	-Función que calcula el mínimo de un número arbitrario de argumentos.
