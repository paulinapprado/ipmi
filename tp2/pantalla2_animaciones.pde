//pestaña con animaciones dela pantalla 2
void iniciarAnimacionesPantalla2() {
  estadoPantalla2 = 1;
  tiempoInicioPantalla2 = millis();
  mn1X = -200;
  kz1X = width + 100;
  opacidadTxt2 = 0;
}

void actualizarAnimacionesPantalla2() {
  int duracionSlide = 1000;
  int duracionFade = 900;
  int duracionPausaTextos = 1500;
  int duracionVisibleTextos = 9000;
  int duracionFadeOut = 1000;
  int duracionSlideOut = 1000;
  float transcurrido = millis() - tiempoInicioPantalla2;
  float progreso;

  // 1. Deslizar imágenes hacia adentro
  if (estadoPantalla2 == 1) {
    progreso = transcurrido / duracionSlide;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    mn1X = -200 + progreso * ((-40) - (-200));
    kz1X = (width + 100) + progreso * (430 - (width + 100));

    if (progreso >= 1) {
      estadoPantalla2 = 2;                     // pasar a la pausa antes de txt1
      tiempoInicioPantalla2 = millis();
      mn1X = -40;
      kz1X = 430;
      opacidadTextos = 255;                   // txt1 aparecerá completamente visible
    }
  }
  // 2. Pausa breve (txt1 ya visible)
  else if (estadoPantalla2 == 2) {
    if (transcurrido > duracionPausaTextos) {
      estadoPantalla2 = 3;                     // iniciar fadein de txt2
      tiempoInicioPantalla2 = millis();
      opacidadTxt2 = 0;
    }
  }
  // 3. Fade in de txt2
  else if (estadoPantalla2 == 3) {
    progreso = transcurrido / duracionFade;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    opacidadTxt2 = 0 + progreso * 255;        // 0 a 255

    if (progreso >= 1) {
      estadoPantalla2 = 4;                     // txt3 aparece de golpe
      tiempoInicioPantalla2 = millis();
      opacidadTxt2 = 255;
      opacidadTextos = 255;                   // todos los textos visibles
    }
  }
  // 4. txt3 visible, iniciar temporizador antes del fade out
  else if (estadoPantalla2 == 4) {
    if (transcurrido > duracionVisibleTextos) {
      estadoPantalla2 = 5;                     // comenzar fadeout de los textos
      tiempoInicioPantalla2 = millis();
      opacidadTextos = 255;                   // empieza totalmente opaco
    }
  }
  // 5. Fade out de todos los textos
  else if (estadoPantalla2 == 5) {
    progreso = transcurrido / duracionFadeOut;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    opacidadTextos = 255 - progreso * 255;    // 255 a 0

    if (progreso >= 1) {
      estadoPantalla2 = 6;                     // empezar a sacar las imágenes
      tiempoInicioPantalla2 = millis();
      opacidadTextos = 0;
    }
  }
  // 6. Deslizar imágenes hacia afuera
  else if (estadoPantalla2 == 6) {
    progreso = transcurrido / duracionSlideOut;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    mn1X = -40 + progreso * ((-300) - (-40));           // -40 a -300
    kz1X = 430 + progreso * ((width + 100) - 430);      // 430 a width+100

    if (progreso >= 1) {
      estadoPantalla2 = 0;                     // animación terminada
    }
  }
}
void actualizarAnimacionInfo2() {
  int tiempoDesdeEntrada = millis() - tiempoInicio;   // tiempo desde que comenzó la pantalla 2
  float progreso;

  if (estadoInfo2 == 1) {  // Agrandando: 0 a 30 en 2 segundos
    progreso = tiempoDesdeEntrada / 1000.0;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    tamañoInfo2 = 1 + progreso * 29;   // va de 1 a 30

    if (progreso >= 1) {
      estadoInfo2 = 2;                 // pasar a mantener
      tamañoInfo2 = 30;
    }
  } else if (estadoInfo2 == 2) {  // Mantener hasta que falten 2 segundos para el final
    if (tiempoDesdeEntrada > duracionPantallas - 2000) {
      estadoInfo2 = 3;                 // empezar a achicar
    }
  } else if (estadoInfo2 == 3) {  // Achicando: 30 a 0
    int tiempoRestante = duracionPantallas - tiempoDesdeEntrada;
    if (tiempoRestante < 0) tiempoRestante = 0;
    progreso = 1 - (tiempoRestante / 1000.0);
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    tamañoInfo2 = 30 - progreso * 29;  // va de 30 a 1

    if (progreso >= 1) {
      estadoInfo2 = 0;                 // animación terminada
      tamañoInfo2 = 1;
    }
  }
}
