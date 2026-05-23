//pestaña con animaciones de la pantalla10
void iniciarAnimacionPantalla10() {
  estadoPantalla10 = 1;
  tiempoInicioPantalla10 = millis();
  mn3Y = -300;              
  kz3Y = -300;            
  yk3Y = -300;              
  txtMn3Y = -200;           
  txtKz3Y = -200;
  txtYk3Y = -200;
}

void actualizarAnimacionPantalla10() {
  int duracionEntrada = 1000;      // 1 segundo por cada uno
  int duracionVisible = 10000;      //10 segundos todos visibles
  int duracionSalida  = 1000;      // 1 segundo por cada uno

  float transcurrido = millis() - tiempoInicioPantalla10;
  float progreso;

  // Fase 1: entrada Mana
  if (estadoPantalla10 == 1) {
    progreso =transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    mn3Y = -300 + progreso * (70 - (-300));           // -300 a 70
    txtMn3Y = -200 + progreso * (410 - (-200));       // -200 a 410

    if (progreso >= 1) {
      estadoPantalla10 = 2;
      tiempoInicioPantalla10 = millis();
      mn3Y = 70;
      txtMn3Y = 410;
    }
  }
  // Fase 2: entrada Közi
  else if (estadoPantalla10 == 2) {
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    kz3Y = -300 + progreso * (70 - (-300));           // -300 a 70
    txtKz3Y = -200 + progreso * (410 - (-200));       // -200 a 410

    if (progreso >= 1) {
      estadoPantalla10 = 3;
      tiempoInicioPantalla10 = millis();
      kz3Y = 70;
      txtKz3Y = 410;
    }
  }
  // Fase 3: entrada Yu~ki
  else if (estadoPantalla10 == 3) {
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    yk3Y = -300 + progreso * (80 - (-300));           // -300 a 80
    txtYk3Y = -200 + progreso * (410 - (-200));       // -200 a 410

    if (progreso >= 1) {
      estadoPantalla10 = 4;
      tiempoInicioPantalla10 = millis();
      yk3Y = 80;
      txtYk3Y = 410;
    }
  }
  // Fase 4: pausa
  else if (estadoPantalla10 == 4) {
    if (transcurrido > duracionVisible) {
      estadoPantalla10 = 5;
      tiempoInicioPantalla10 = millis();
    }
  }
  // Fase 5: salida Yu~ki (primero en salir)
  else if (estadoPantalla10 == 5) {
    progreso = transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    yk3Y = 80 + progreso * (-300 - 80);
    txtYk3Y = 410 + progreso * (-200 - 410);

    if (progreso >= 1) {
      estadoPantalla10 = 6;
      tiempoInicioPantalla10 = millis();
      yk3Y = -300;
      txtYk3Y = -200;
    }
  }
  // Fase 6: salida Közi
  else if (estadoPantalla10 == 6) {
    progreso =transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    kz3Y = 70 + progreso * (-300 - 70);
    txtKz3Y = 410 + progreso * (-200 - 410);

    if (progreso >= 1) {
      estadoPantalla10 = 7;
      tiempoInicioPantalla10 = millis();
      kz3Y = -300;
      txtKz3Y = -200;
    }
  }
  // Fase 7: salida Mana
  else if (estadoPantalla10 == 7) {
    progreso =transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    mn3Y = 70 + progreso * (-300 - 70);
    txtMn3Y = 410 + progreso * (-200 - 410);

    if (progreso >= 1) {
      estadoPantalla10 = 0;
      mn3Y = -300;
      txtMn3Y = -200;
    }
  }
}
