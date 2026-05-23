//pestaña con animaciones dela pantalla 4
void iniciarAnimacionPantalla4() {
  estadoPantalla4 = 1;
  tiempoInicioPantalla4 = millis();
  gk1X = -300;                    // arranca fuera de pantalla por la izquierda
  gktera2X = width + 100;         // arranca fuera de pantalla por la derecha
}

void actualizarAnimacionPantalla4() {
  int duracionEntrada = 2000;     // 2 segundos para entrar
  int duracionVisible = 10000;     //10 segundos quietos
  int duracionSalida  = 2000;     // 2 segundos para salir

  float transcurrido = millis() - tiempoInicioPantalla4;
  float progreso;

  if (estadoPantalla4 == 1) {      // Entrando
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    gk1X = -300 + progreso * (35 - (-300));              // -300 a 35
    gktera2X = (width + 100) + progreso * (315 - (width + 100));  // width+100 a 315

    if (progreso >= 1) {
      estadoPantalla4 = 2;         // pasa a visible
      tiempoInicioPantalla4 = millis();
      gk1X = 35;
      gktera2X = 315;
    }
  } 
  else if (estadoPantalla4 == 2) {  // Pausa visible
    if (transcurrido > duracionVisible) {
      estadoPantalla4 = 3;          // empieza a salir
      tiempoInicioPantalla4 = millis();
    }
  } 
  else if (estadoPantalla4 == 3) {  // Saliendo
    progreso =transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    gk1X = 35 + progreso * (-300 - 35);               // 35 a -300 (izquierda)
    gktera2X = 315 + progreso * ((width + 100) - 315); // 315 a derecha

    if (progreso >= 1) {
      estadoPantalla4 = 0;         // animación terminada
      gk1X = -300;
      gktera2X = width + 100;
    }
  }
}
void iniciarInfoPantalla4() {
  estadoInfo4 = 1;
  tiempoInicioInfo4 = millis();
  info4Y = height + 200;        // arranca abajo, fuera de pantalla
}

void actualizarInfoPantalla4() {
  int duracionEntrada = 2000;   // 2 segundos para subir
  int duracionVisible = 10000;   // 10 segundos quieto
  int duracionSalida  = 2000;   // 2 segundos para bajar

  float transcurrido = millis() - tiempoInicioInfo4;
  float progreso;

  if (estadoInfo4 == 1) {                     // Subiendo
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    info4Y = (height + 200) + progreso * (345 - (height + 200));
    if (progreso >= 1) {
      estadoInfo4 = 2;                       // pasa a visible
      tiempoInicioInfo4 = millis();
      info4Y = 345;
    }
  } 
  else if (estadoInfo4 == 2) {                // Visible
    if (transcurrido > duracionVisible) {
      estadoInfo4 = 3;                       // empieza a bajar
      tiempoInicioInfo4 = millis();
    }
  } 
  else if (estadoInfo4 == 3) {                // Bajando
    progreso = transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    info4Y = 345 + progreso * ((height + 200) - 345);
    if (progreso >= 1) {
      estadoInfo4 = 0;                       // terminó
      info4Y = height + 200;
    }
  }
}
