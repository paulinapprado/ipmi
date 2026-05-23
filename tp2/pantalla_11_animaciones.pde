void iniciarAnimacionPantalla11() {
  estadoPantalla11 = 1;
  tiempoInicioPantalla11 = millis();
  ts2Y = -300;              // Tetsu desde arriba
  gkt4Y = -300;             // Gackt desde arriba
  kh2Y = -300;              // Klaha desde arriba
  txtTs2Y = -200;           // textos desde arriba
  txtGkt4Y = -200;
  txtKh2Y = -200;
}

void actualizarAnimacionPantalla11() {
  int duracionEntrada = 1000;      // 1 segundo por cada uno
  int duracionVisible = 10000;      // 10 segundos todos visibles
  int duracionSalida  = 1000;      // 1 segundo por cada uno

  float transcurrido = millis() - tiempoInicioPantalla11;
  float progreso;

  // Fase 1: entrada Tetsu
  if (estadoPantalla11 == 1) {
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    ts2Y = -300 + progreso * (80 - (-300));            // -300a 80
    txtTs2Y = -200 + progreso * (410 - (-200));        // -200 a 410

    if (progreso >= 1) {
      estadoPantalla11 = 2;
      tiempoInicioPantalla11 = millis();
      ts2Y = 80;
      txtTs2Y = 410;
    }
  }
  // Fase 2: entrada Gackt
  else if (estadoPantalla11 == 2) {
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    gkt4Y = -300 + progreso * (50 - (-300));           // -300 a 50
    txtGkt4Y = -200 + progreso * (410 - (-200));       // -200 a 410

    if (progreso >= 1) {
      estadoPantalla11 = 3;
      tiempoInicioPantalla11 = millis();
      gkt4Y = 50;
      txtGkt4Y = 410;
    }
  }
  // Fase 3: entrada Klaha
  else if (estadoPantalla11 == 3) {
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    kh2Y = -300 + progreso * (50 - (-300));            // -300 a 50
    txtKh2Y = -200 + progreso * (410 - (-200));        // -200 a 410

    if (progreso >= 1) {
      estadoPantalla11 = 4;
      tiempoInicioPantalla11 = millis();
      kh2Y = 50;
      txtKh2Y = 410;
    }
  }
  // Fase 4: pausa
  else if (estadoPantalla11 == 4) {
    if (transcurrido > duracionVisible) {
      estadoPantalla11 = 5;
      tiempoInicioPantalla11 = millis();
    }
  }
  // Fase 5: salida Klaha (primero en salir)
  else if (estadoPantalla11 == 5) {
    progreso = transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    kh2Y = 50 + progreso * (-300 - 50);
    txtKh2Y = 410 + progreso * (-200 - 410);

    if (progreso >= 1) {
      estadoPantalla11 = 6;
      tiempoInicioPantalla11 = millis();
      kh2Y = -300;
      txtKh2Y = -200;
    }
  }
  // Fase 6: salida Gackt
  else if (estadoPantalla11 == 6) {
    progreso = transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    gkt4Y = 50 + progreso * (-300 - 50);
    txtGkt4Y = 410 + progreso * (-200 - 410);

    if (progreso >= 1) {
      estadoPantalla11 = 7;
      tiempoInicioPantalla11 = millis();
      gkt4Y = -300;
      txtGkt4Y = -200;
    }
  }
  // Fase 7: salida Tetsu
  else if (estadoPantalla11 == 7) {
    progreso =transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    ts2Y = 80 + progreso * (-300 - 80);
    txtTs2Y = 410 + progreso * (-200 - 410);

    if (progreso >= 1) {
      estadoPantalla11 = 0;
      ts2Y = -300;
      txtTs2Y = -200;
    }
  }
}
