//pestaña con animaciones de la pantalla 9
void iniciarAnimacionPantalla9() {
  estadoPantalla9 = 1;
  tiempoInicioPantalla9 = millis();
  baraY = -200;              // imagen del álbum desde arriba
  kh1X = -250;               // imagen de Klaha desde izquierda
  textosBaraY = -300;        // textos de canciones desde arriba
}

void actualizarAnimacionPantalla9() {
  int duracionEntrada = 2000;
  int duracionVisible = 10000;
  int duracionSalida  = 2000;

  float transcurrido = millis() - tiempoInicioPantalla9;
  float progreso;

  if (estadoPantalla9 == 1) {      // Entrando
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    baraY = -200 + progreso * (5 - (-200));                                    // -200 a 5
    kh1X = -250 + progreso * (15 - (-250));                                    // -250 a 15
    textosBaraY = -300 + progreso * (190 - (-300));                            // -300 a 190

    if (progreso >= 1) {
      estadoPantalla9 = 2;
      tiempoInicioPantalla9 = millis();
      baraY = 5;
      kh1X = 15;
      textosBaraY = 190;
    }
  } 
  else if (estadoPantalla9 == 2) {  // Pausa
    if (transcurrido > duracionVisible) {
      estadoPantalla9 = 3;
      tiempoInicioPantalla9 = millis();
    }
  } 
  else if (estadoPantalla9 == 3) {  // Saliendo
    progreso = transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    baraY = 5 + progreso * (-200 - 5);                                        // 5 a -200
    kh1X = 15 + progreso * (-250 - 15);                                       // 15 a -250
    textosBaraY = 190 + progreso * (-300 - 190);                              // 190a -300

    if (progreso >= 1) {
      estadoPantalla9 = 0;
      baraY = -200;
      kh1X = -250;
      textosBaraY = -300;
    }
  }
}

void iniciarInfoPantalla9() {
  estadoInfo9 = 1;
  tiempoInicioInfo9 = millis();
  info9Y = height + 200;           // arranca abajo
}

//pestaña con animaciones de la pantalla 8
void actualizarInfoPantalla9() {
  int duracionEntrada = 2000;
  int duracionVisible =10000;
  int duracionSalida  = 2000;

  float transcurrido = millis() - tiempoInicioInfo9;
  float progreso;

  if (estadoInfo9 == 1) {          // Subiendo
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    info9Y = (height + 200) + progreso * (345 - (height + 200));
    if (progreso >= 1) {
      estadoInfo9 = 2;
      tiempoInicioInfo9 = millis();
      info9Y = 345;
    }
  } 
  else if (estadoInfo9 == 2) {     // Visible
    if (transcurrido > duracionVisible) {
      estadoInfo9 = 3;
      tiempoInicioInfo9 = millis();
    }
  } 
  else if (estadoInfo9 == 3) {     // Bajando
    progreso = transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    info9Y = 345 + progreso * ((height + 200) - 345);
    if (progreso >= 1) {
      estadoInfo9 = 0;
      info9Y = height + 200;
    }
  }
}
