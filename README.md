"# Plano Arquitectonico" 

Elaborado con Delphi 7 con paqueteria standar

Version: 1.0.2

Para usar: Ejecutar ScrollBox_.exe

Instrucciones para su uso:
El Plano arquitectonico muestra una cuadricula en la cual para poder empezar con el graficado se tiene que hacer click en una intersección para ubicar el primer punto de referencia.

	-Botones Muebles : Mueble, estufa, lavabo, tasa y cama solo necesitan un punto de referencia para su ubicacion y los grados de rotación de la figura (0 y multiplos de 45)

	-Botones de estructura de la construcción : Muro y Ventana necesitan dos puntos de referencia, el primer punto es obtenido al presionar el mouse (MosueDown) y el segundo al desplazarte y dejar de ejecerce presión en el mouse(MouseUp)
	Nota: Para borrar este tipo de elementos se tiene que hacer de forma que lo estuvieras pintando de nuevo pero esta vez seleccionas el botón Borrar

	-Botón Elementos Pintados: Abre una ventana en la cual se muestan los tipos elementos pintados y permite seleccionar el tipo de elemento que se quiere tener infomacion listando los objetos  de este elemento y sus coordenadas, esto sirve para poder seleccionar la coordenada del elemento que se quiere borrar. 
	Nota: en el cuadro de texto para seleccionar el tipo de elemento se tiene que poner la misma cadena de texto.

	-Botón Anexar Diseño : Si se tiene un diseño que reconozca el Plano Arquitectonico se mostrara en el plano (leyendo los puntos del archivo) sin borrar los elementos que ya estan pintados.

	-Botón Abrir Diseño : Si se tiene un diseño que reconozca el Plano Arquitectonico se mostrara en el plano (leyendo los puntos del archivo) pero este si BORRARA el diseño creado hasta el momento.

	-Botón Salvar Diseño : Guarda el diseño elaborado hasta el momento en un archivo de texto (solo salvando los puntos) sin borrar el diseño actual.

	-Botón Borrar : Borrara el elemento que se ubique en la ultima coordena que se tiene en memoria si es que hay un elemento en esa posición.

	-Botón Limpiar : Borra todos los elementos de la cuadricula.

	-Botón Repintar : Abre una ventana en la cual se muestan los tipos elementos pintados y permite seleccionar el tipo de elemento que se quiere tener repintar listando los objetos de este tipo de elemento y sus coordenadas, esto sirve para poder seleccionar elemento deseado.

	-Botón Autor : Solo muestra el nombre de quien desarrollo este programa.

	-Botón Cerrar : Termina con la ejecución del Plano Arquitectonico.

	-Botón Borrar Cache : Este botón eliminara el historico de elementos borrados, una vez borrado ya no se podra recuperar.


ANOTACIONES:
Este programa fue desarrollado para una materia de Graficación, fue hecho con Delphi 7, el objetivo del proyecto en la clase era conocer los elementos del IDE y poder hacer un graficado simple en esta caso un plano arquitectonico de muestra, por lo que todavia tiene aspectos que corregir y/o validar.