//pestaña con animaciones dela pantalla 3
void iniciarAnimacionPantalla3() {
  estadoPantalla3 = 1;
  tiempoInicioPantalla3 = millis();
  memoireX = -300;              // imagen por izquierda
  cancionesX = width + 100;     // textos por derecha
}

void actualizarAnimacionPantalla3() {
  int duracionEntrada = 2000;
  int duracionVisible = 10000;
  int duracionSalida  = 2000;

  int transcurrido = millis() - tiempoInicioPantalla3;
  float progreso;

  if (estadoPantalla3 == 1) {      // Entrando
    progreso = (float)transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    memoireX = -300 + progreso * (25 - (-300));
    cancionesX = (width + 100) + progreso * (360 - (width + 100));

    if (progreso >= 1) {
      estadoPantalla3 = 2;
      tiempoInicioPantalla3 = millis();
      memoireX = 25;
      cancionesX = 360;
    }
  } 
  else if (estadoPantalla3 == 2) {  // Visible
    if (transcurrido > duracionVisible) {
      estadoPantalla3 = 3;
      tiempoInicioPantalla3 = millis();
    }
  } 
  else if (estadoPantalla3 == 3) {  // Saliendo
    progreso = (float)transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    memoireX = 25 + progreso * (-300 - 25);
    cancionesX = 360 + progreso * ((width + 100) - 360);

    if (progreso >= 1) {
      estadoPantalla3 = 0;
      memoireX = -300;
      cancionesX = width + 100;
    }
  }
}

void iniciarInfoPantalla3() {
  estadoInfo3 = 1;
  tiempoInicioInfo3 = millis();
  info3X = -300;                // arranca por izquierda
}

void actualizarInfoPantalla3() {
  int duracionEntrada = 2000;
  int duracionVisible = 10000;
  int duracionSalida  = 2000;

  float transcurrido = millis() - tiempoInicioInfo3;
  float progreso;

  if (estadoInfo3 == 1) {         // Entrando desde la izquierda
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    info3X = -300 + progreso * (width/2 - (-300));
    if (progreso >= 1) {
      estadoInfo3 = 2;
      tiempoInicioInfo3 = millis();
      info3X = width/2;
    }
  } 
  else if (estadoInfo3 == 2) {    // Visible
    if (transcurrido > duracionVisible) {
      estadoInfo3 = 3;
      tiempoInicioInfo3 = millis();
    }
  } 
  else if (estadoInfo3 == 3) {    // Saliendo hacia la derecha
    progreso = transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    info3X = width/2 + progreso * ((width + 350) - width/2);
    if (progreso >= 1) {
      estadoInfo3 = 0;
      info3X = width + 350;
    }
  }
}
