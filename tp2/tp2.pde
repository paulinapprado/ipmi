// Paulina Prado, Comisión 3, LEGAJO: 125664/7 terminado: 22/5/2026

// TODAS LAS VARIABLES
//Todas las imagenes usadas
PImage fondo0, fondo1, fondo2, fondo3, fondo4, fondo5, fondofin, fondo7, fondo8, fondo9, fondo10
  , fondo11, cortinaIzq, cortinaDer, mmz1, mmz2, mmz3, mn1, kz1, txt1, txt2, txt3,
  ts1, gz1, km1, yk1, memoire, gk1, gktera2, gktera1, voyage, merveilles, gkt2, gkt3,
  km2, km3, bara, kh1, mn3, kz3, yk3, ts2, kh2, gracias;
PFont fuente;

int pantalla;
boolean presentacionActiva;
int tiempoInicio;           // guarda millis() al entrar a una pantalla
int duracionPantallas;

//Las use para que al pasar el mouse sobre el botónm cambie de color
//Quería intentar que también se agrandara ligeramente, pero decidí enfocarme en otras cosas
//Y no pude hacerlo
int tamañoBotonX;
int tamañoBotonY;
color colorBoton;

float tituloTamaño = 90;
boolean tituloAgrandando = false;

String info; //definida en pestaña "mis funciones 2"
//String boton; //definida en pestaña "mis funciones 2"
//String titulo; ///definida en pestaña "mis funciones 2"
// Elimine esas dos variables (y un par mas pero me sirve para ejemplificar) despues de ver los videos
//donde se explica como añadirle parametros a las funciones que creemos nosotros

// Variables de la animación de cortina
int estadoCortina ;          // 0: inactivo, 1: cerrando, 2: esperando, 3: abriendo
int tiempoInicioCortina;        // momento en que empezó la fase actual
float cortinaIzqX;
float cortinaDerX; // posición horizontal de cada mitad
int duracionCierre ;
int duracionEspera;
int duracionApertura;
int pantallaSiguiente;          // a qué pantalla saltaremos al terminar la transición

// Animaciones de la pantalla 1
int estadoPantalla1 = 0;           // 0:inactivo, 1:entrando imágenes, 2:entrando textos, 3:visible, 4:saliendo
int tiempoInicioPantalla1;
float mmz1X, mmz2X, mmz3X;         // posición x actual de cada imagen
float txtTetsuX, txtGacktX, txtKlahaX; // posición x de los textos
int estadoInfo1;            // 0:inactivo, 1:entrando, 2:visible, 3:saliendo
int tiempoInicioInfo1;
float info1Y;                   // posición Y actual del texto
float info1YDestino;   // valor original
float info1YFuera;        // fuera de pantalla

// Animaciones de la pantalla 2
int estadoPantalla2;           // 0=inactivo, 1=deslizando imágenes, 2=mostrando textos
int tiempoInicioPantalla2;
float mn1X, kz1X;                  // posición en x de las fotos
float opacidadTxt2;            // transparencia de txt2
float opacidadTextos;        // para el fade out de los tres textos
int estadoInfo2;         // 0:inactivo, 1:agrandando, 2:pausa, 3:achicando
int tiempoInicioInfo2;
float tamañoInfo2;
// Animaciones de la pantalla 22 (en realidad es una pantalla entre la 2 y la 3, toda la info de aca antes estaba en la pantalla 2
//                                pero quedaba muy largo asi que tuve que improvisar una nueva. es como una pantalla 2.5)
int estadoPantalla22;
int tiempoInicioPantalla22;
float ts1Y, gz1Y, km1Y, yk1Y;                // posiciones Y de las imágenes
float txtTetsu22Y ;    // posiciones Y de los textos
float txtGaz22Y ;    // posiciones Y de los textos
float txtKami22Y; // posiciones Y de los textos
float txtYuki22Y;
int estadoInfo22;              // 0:inactivo, 1:entrando, 2:visible, 3:saliendo
int tiempoInicioInfo22;
float opacidadInfo22;                   // para fade in/out de la información

// Animaciones de la pantalla 3
int estadoPantalla3;           // 0:inactivo, 1:entrando, 2:visible, 3:saliendo
int tiempoInicioPantalla3;
float memoireX;                    // posición X de la imagen del álbum
float cancionesX;                  // posición X del bloque de textos
int estadoInfo3 = 0;            // 0:inactivo, 1:entrando, 2:visible, 3:saliendo
int tiempoInicioInfo3;
float info3X;                   // posición X del bloque de información

// Animaciones de la pantalla 4
int estadoPantalla4;           // 0:inactivo, 1:entrando, 2:visible, 3:saliendo
int tiempoInicioPantalla4;
float gk1X, gktera2X;              // posiciones X de las imágenes
int estadoInfo4 = 0;           // 0:inactivo, 1:entrando, 2:visible, 3:saliendo
int tiempoInicioInfo4;
float info4Y;                  // posición Y del  del texto
// Animaciones de la pantalla 5
int estadoPantalla5 = 0;           // 0:inactivo, 1:entrando, 2:visible, 3:saliendo
int tiempoInicioPantalla5;
float gktera1Y;                    // posición Y de la imagen
int estadoInfo5 = 0;               // 0:inactivo, 1:entrando, 2:visible, 3:saliendo
int tiempoInicioInfo5;
float info5Y;

// Animaciones de la pantalla 6
int estadoPantalla6;
int tiempoInicioPantalla6;
float voyageX;
float merveillesX;
float textosVoyageX;
float textosMerveillesX;

int estadoInfo6 ;
int tiempoInicioInfo6;
float info6Y;

// Animaciones de la pantalla 7
int estadoPantalla7 ;
int tiempoInicioPantalla7;
float gkt2X;
float gkt3X;
int estadoInfo7 ;
int tiempoInicioInfo7;
float info7Y;

// Animaciones de la pantalla 8
int estadoPantalla8 ;           // 0:inactivo, 1:aparecidno, 2:visible, 3:desapareciendo
int tiempoInicioPantalla8;
float opacidadPantalla8;

// Animaciones de la pantalla 9
int estadoPantalla9;
int tiempoInicioPantalla9;
float baraY;                    // posición Y de la imagen del álbum
float kh1X;                     // posición X de la imagen de Klaha
float textosBaraY;              // posición Y de los textos de canciones

int estadoInfo9;
int tiempoInicioInfo9;
float info9Y;
// Animaciones de la pantalla 10
int estadoPantalla10;           // 0:inactivo, 1:mn3, 2:kz3, 3:yk3, 4:pausa, 5:saliendo yk3, 6:saliendo kz3, 7:saliendo mn3
int tiempoInicioPantalla10;
float mn3Y, kz3Y, yk3Y;            // posiciones Y de las imágenes
float txtMn3Y, txtKz3Y, txtYk3Y;   // posiciones Y de los textos

 // Animaciones de la pantalla 11
  int estadoPantalla11;
  int tiempoInicioPantalla11;
  float ts2Y;
  float gkt4Y;
  float kh2Y;
  float txtTs2Y;
  float txtGkt4Y;
  float txtKh2Y;
  
void setup() {
  size(640, 480);


  // Carga de todas las imágenes 
  fondo0 = loadImage("data/fondo1.jpg");
  fondo1 = loadImage("data/fondo2.jpg");
  fondo2 = loadImage("data/fondo3.jpg");
  fondo3 = loadImage("data/fondo4.jpg");
  fondo4 = loadImage("data/fondo5.jpg");
  fondo5 = loadImage("data/fondo7.jpg");
  fondofin = loadImage("data/fondofin.jpg");
  fondo7 = loadImage("data/fondo8.jpg");
  fondo8 = loadImage("data/fondo9.jpg");
  fondo9 = loadImage("data/fondo10.jpg");
  fondo10=loadImage ("data/fondo11.jpg");
  fondo11=loadImage("data/fondo12.jpg");
  cortinaIzq = loadImage("data/cortinaizq.jpg");
  cortinaDer = loadImage("data/cortinader.jpg");
  mmz1 = loadImage("data/mmz1.jpg");
  mmz2 = loadImage("data/mmz2.jpg");
  mmz3 = loadImage("data/mmz3.jpg");
  mn1 =loadImage("data/mn2.png");
  kz1 =loadImage("data/kz3.png");
  txt1 =loadImage("data/hmhub.png");
  txt2 =loadImage("data/p.png");
  txt3 =loadImage("data/e.png");
  ts1= loadImage("data/ts1.png");
  gz1= loadImage("data/gz1.jpg");
  km1= loadImage("data/km1.png");
  yk1= loadImage("data/yk1.png");
  memoire= loadImage ("data/memoire.jpg");
  gk1=loadImage ("data/gk1.png");
  gktera1=loadImage ("data/gktera4.jpg");
  gktera2=loadImage ("data/gktera2.jpg");
  voyage= loadImage("data/voyage.jpg");
  merveilles =loadImage("data/merveilles.jpg");
  gkt2 =loadImage("data/gk2.png");
  gkt3=loadImage("data/gkt3.png");
  km2=loadImage("data/km2.png");
  km3=loadImage("data/km3.png");
  bara=loadImage("data/brn.jpg");
  kh1= loadImage("data/kl1.png");
  mn3= loadImage("data/mn3.png");
  kz3= loadImage("data/kz2.png");
  yk3=  loadImage("data/yk2.png");
  ts2=  loadImage("data/ts3.png");
  kh2=  loadImage("data/kl2.png");
  gracias= loadImage("data/si.jpg");
  tamañoBotonX = 120;
  tamañoBotonY = 40;
  fuente = loadFont("Microsoft_Himalaya-60.vlw");
  // cortina
  estadoCortina = 0;
  duracionCierre   = 1000; // 1 segundo para cerrar
  duracionEspera   =2000; // 2 segundos queda cerrada
  duracionApertura = 1000; // 1 segundo para abrir
  pantalla = 0;
  pantallaSiguiente = 0;
  presentacionActiva = false;
  duracionPantallas = 15000; //15 segundos en milisegundos
  textFont(fuente);
  colorBoton = color(0);
  tiempoInicio = millis();  // inicializamos con el tiempo actual
  //PT1
  estadoInfo1 = 0;
  info1YDestino = height/1.2 + 15;
  info1YFuera = height + 200;
  //PT2
  estadoPantalla2=0;
  opacidadTxt2 = 0;
  opacidadTextos = 255;
  estadoInfo2 = 0;
  tamañoInfo2= 0;
  //PT 22
  estadoPantalla22 = 0;
  estadoInfo22 = 0;
  //PT 3
  estadoPantalla3 = 0;
  estadoInfo3 = 0;
  info3X = 0;
  //PT 4
  estadoPantalla4 = 0;
  estadoInfo4 = 0;
  info4Y = 345;
  //PT5
  estadoPantalla5 = 0;
  estadoInfo5 = 0;
  info5Y = 345;
  //PT6
  estadoPantalla6 = 0;
  estadoInfo6 = 0;
  info6Y = 345;
  //PT 7
  estadoPantalla7 = 0;
  estadoInfo7 = 0;
  info7Y = 345;
  //PT8
  estadoPantalla8 = 0;
  opacidadPantalla8 = 0;
  //PT9
  estadoPantalla9 = 0;
  estadoInfo9 = 0;
  info9Y = 345;
  //PT10
  estadoPantalla10 = 0;
  //PT 11
  estadoPantalla11 = 0;
}

void draw() {
  // Máquina de estados principal
  if (debeAvanzarPantalla()) {
    avanzarPantalla();
  }

  // Selección de qué dibujar según pantalla
  if (pantalla == 0) {
    dibujarPantallaInicio();
  } else if (pantalla == 1) {
    dibujarPantalla1();
    if (estadoPantalla1 != 0) {
      actualizarAnimacionPantalla1();
    }
    if (estadoInfo1 != 0) {
      actualizarAnimacionInfo1();
    }
  } else if (pantalla == 2) {
    dibujarPantalla2();
    if (estadoPantalla2 != 0) {
      actualizarAnimacionesPantalla2();
    }
    if (estadoInfo2 != 0) {
      actualizarAnimacionInfo2();
    }
  } else if (pantalla == 3) {
    dibujarPantalla22();
    if (estadoPantalla22 != 0) {
      actualizarAnimacionPantalla22();
    }
    if (estadoInfo22 != 0) {
      actualizarInfoPantalla22();
    }
  } else if (pantalla == 4) {
    dibujarPantalla3();
    if (estadoPantalla3 != 0) {
      actualizarAnimacionPantalla3();
    }
    if (estadoInfo3 != 0) {
      actualizarInfoPantalla3();
    }
  } else if (pantalla == 5) {
    dibujarPantalla4();
    if (estadoPantalla4 != 0) {
      actualizarAnimacionPantalla4();
    }
    if (estadoInfo4 != 0) {
      actualizarInfoPantalla4();
    }
  } else if (pantalla == 6) {
    dibujarPantalla5();
    if (estadoPantalla5 != 0) {
      actualizarAnimacionPantalla5();
    }
    if (estadoInfo5 != 0) {
      actualizarInfoPantalla5();
    }
  } else if (pantalla == 7) {
    dibujarPantalla6();
    if (estadoPantalla6 != 0) {
      actualizarAnimacionPantalla6();
    }
    if (estadoInfo6 != 0) {
      actualizarInfoPantalla6();
    }
  } else if (pantalla == 8) {
    dibujarPantalla7();
    if (estadoPantalla7 != 0) {
      actualizarAnimacionPantalla7();
    }
    if (estadoInfo7 != 0) {
      actualizarInfoPantalla7();
    }
  } else if (pantalla == 9) {
    dibujarPantalla8();
    if (estadoPantalla8 != 0) {
      actualizarAnimacionPantalla8();
    }
  } else if (pantalla == 10) {
    dibujarPantalla9();
    if (estadoPantalla9 != 0) {
      actualizarAnimacionPantalla9();
    }
    if (estadoInfo9 != 0) {
      actualizarInfoPantalla9();
    }
  } else if (pantalla == 11) {
    dibujarPantalla10();
    if (estadoPantalla10 != 0) {
      actualizarAnimacionPantalla10();
    }
  } else if (pantalla == 12) {
    dibujarPantalla11();
    if (estadoPantalla11 != 0) {
      actualizarAnimacionPantalla11();
    }
  } else if (pantalla == 13) {
    dibujarPantallaFinal();
  }


  // Dibujar el telón siempre encima de todo
  if ( estadoCortina!= 0) {
    actualizarCortina();
    dibujarCortina();
  }
  //dibujarPantalla11();
  //esa línea de codigo la usaba para ir revisando cada pantalla sin necesidad de reproducir toda la presentación
  //y para ir viendo donde querian que sean las posiciones finales de los elementos
}




//  EVENTOS
void mousePressed() {
  // Botón INICIAR
  if (pantalla == 0 && mouseSobreBotonIniciar() && estadoCortina == 0) {
    pantallaSiguiente = 1;
    iniciarCortina();
  }
  // Botón REINICIAR
  if (pantalla == 13 && mouseSobreBotonReiniciar()) {
    pantalla = 0;
    presentacionActiva = false;
    tiempoInicio = millis();
  }
  //println(mouseX, mouseY);
}
