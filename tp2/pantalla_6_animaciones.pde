//pestaña con animaciones de la pantalla 6
void iniciarAnimacionPantalla6() {
  estadoPantalla6 = 1;
  tiempoInicioPantalla6 = millis();
  voyageX = -200;                      // imagen voyage desde izquierda
  merveillesX = width + 100;           // imagen merveilles desde derecha
  textosVoyageX = -300;                // textos voyage desde izquierda
  textosMerveillesX = width + 200;     // textos merveilles desde derecha
}

void actualizarAnimacionPantalla6() {
  int duracionEntrada = 2000;
  int duracionVisible = 10000;
  int duracionSalida  = 2000;

  float transcurrido = millis() - tiempoInicioPantalla6;
  float progreso;

  if (estadoPantalla6 == 1) {      // Entrando
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    voyageX = -200 + progreso * (70 - (-200));                               // -200 a 70
    merveillesX = (width + 100) + progreso * (400 - (width + 100));          // derecha a 400
    textosVoyageX = -300 + progreso * (10 - (-300));                         // -300 a 10
    textosMerveillesX = (width + 200) + progreso * (300 - (width + 200));    // derecha a 300

    if (progreso >= 1) {
      estadoPantalla6 = 2;
      tiempoInicioPantalla6 = millis();
      voyageX = 70;
      merveillesX = 400;
      textosVoyageX = 10;
      textosMerveillesX = 300;
    }
  } 
  else if (estadoPantalla6 == 2) {  // Pausa
    if (transcurrido > duracionVisible) {
      estadoPantalla6 = 3;
      tiempoInicioPantalla6 = millis();
    }
  } 
  else if (estadoPantalla6 == 3) {  // Saliendo
    progreso =transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    voyageX = 70 + progreso * (-200 - 70);                                   // 70 a -200
    merveillesX = 400 + progreso * ((width + 100) - 400);                    // 400 a 100
    textosVoyageX = 10 + progreso * (-300 - 10);                             // 10 a 10
    textosMerveillesX = 300 + progreso * ((width + 200) - 300);              // 300 a derecha

    if (progreso >= 1) {
      estadoPantalla6 = 0;
      voyageX = -200;
      merveillesX = width + 100;
      textosVoyageX = -300;
      textosMerveillesX = width + 200;
    }
  }
}

void iniciarInfoPantalla6() {
  estadoInfo6 = 1;
  tiempoInicioInfo6 = millis();
  info6Y = height + 200;
}

void actualizarInfoPantalla6() {
  int duracionEntrada = 2000;
  int duracionVisible = 10000;
  int duracionSalida  = 2000;

  float transcurrido = millis() - tiempoInicioInfo6;
  float progreso;

  if (estadoInfo6 == 1) {          // Subiendo
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    info6Y = (height + 200) + progreso * (345 - (height + 200));
    if (progreso >= 1) {
      estadoInfo6 = 2;
      tiempoInicioInfo6 = millis();
      info6Y = 345;
    }
  } 
  else if (estadoInfo6 == 2) {     // Visible
    if (transcurrido > duracionVisible) {
      estadoInfo6 = 3;
      tiempoInicioInfo6 = millis();
    }
  } 
  else if (estadoInfo6 == 3) {     // Bajando
    progreso = transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    info6Y = 345 + progreso * ((height + 200) - 345);
    if (progreso >= 1) {
      estadoInfo6 = 0;
      info6Y = height + 200;
    }
  }
}
