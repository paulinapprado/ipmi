//pestaña con animaciones de la pantalla 6
void iniciarAnimacionPantalla7() {
  estadoPantalla7 = 1;
  tiempoInicioPantalla7 = millis();
  gkt2X = -300;              // imagen desde izquierda
  gkt3X = width + 100;       // imagen desde derecha
}

void actualizarAnimacionPantalla7() {
  int duracionEntrada = 2000;
  int duracionVisible = 10000;
  int duracionSalida  = 2000;

  float transcurrido = millis() - tiempoInicioPantalla7;
  float progreso;

  if (estadoPantalla7 == 1) {      // Entrando
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    gkt2X = -300 + progreso * (50 - (-300));                                    // -300 a 50
    gkt3X = (width + 100) + progreso * (350 - (width + 100));                  // derecha a 350

    if (progreso >= 1) {
      estadoPantalla7 = 2;
      tiempoInicioPantalla7 = millis();
      gkt2X = 50;
      gkt3X = 350;
    }
  } else if (estadoPantalla7 == 2) {  // Pausa
    if (transcurrido > duracionVisible) {
      estadoPantalla7 = 3;
      tiempoInicioPantalla7 = millis();
    }
  } else if (estadoPantalla7 == 3) {  // Saliendo
    progreso =transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    gkt2X = 50 + progreso * (-300 - 50);                                       // 50 → -300
    gkt3X = 350 + progreso * ((width + 100) - 350);                            // 350 → derecha

    if (progreso >= 1) {
      estadoPantalla7 = 0;
      gkt2X = -300;
      gkt3X = width + 100;
    }
  }
}

void iniciarInfoPantalla7() {
  estadoInfo7 = 1;
  tiempoInicioInfo7 = millis();
  info7Y = height + 200;           // arranca abajo
}

void actualizarInfoPantalla7() {
  int duracionEntrada = 2000;
  int duracionVisible = 10000;
  int duracionSalida  = 2000;

  float transcurrido = millis() - tiempoInicioInfo7;
  float progreso;

  if (estadoInfo7 == 1) {          // Subiendo
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    info7Y = (height + 200) + progreso * (345 - (height + 200));
    if (progreso >= 1) {
      estadoInfo7 = 2;
      tiempoInicioInfo7 = millis();
      info7Y = 345;
    }
  } else if (estadoInfo7 == 2) {     // Visible
    if (transcurrido > duracionVisible) {
      estadoInfo7 = 3;
      tiempoInicioInfo7 = millis();
    }
  } else if (estadoInfo7 == 3) {     // Bajando
    progreso = transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    info7Y = 345 + progreso * ((height + 200) - 345);
    if (progreso >= 1) {
      estadoInfo7 = 0;
      info7Y = height + 200;
    }
  }
}
