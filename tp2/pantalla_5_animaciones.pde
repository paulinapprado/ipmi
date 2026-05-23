//pestaña con animaciones dela pantalla 5
void iniciarAnimacionPantalla5() {
  estadoPantalla5 = 1;
  tiempoInicioPantalla5 = millis();
  gktera1Y = -350;               // arranca fuera de pantalla por arriba
}

void actualizarAnimacionPantalla5() {
  int duracionEntrada = 2000;     // 2 segundos para bajar
  int duracionVisible = 10000;     // 10 segundos quietos
  int duracionSalida  = 2000;     // 2 segundos para subir

  float transcurrido = millis() - tiempoInicioPantalla5;
  float progreso;

  if (estadoPantalla5 == 1) {      // Bajando
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    gktera1Y = -350 + progreso * (25 - (-350));   // -350 a 25

    if (progreso >= 1) {
      estadoPantalla5 = 2;         // pasa a visible
      tiempoInicioPantalla5 = millis();
      gktera1Y = 25;
    }
  } 
  else if (estadoPantalla5 == 2) {  // Pausa visible
    if (transcurrido > duracionVisible) {
      estadoPantalla5 = 3;          // empieza a subir
      tiempoInicioPantalla5 = millis();
    }
  } 
  else if (estadoPantalla5 == 3) {  // Subiendo
    progreso = transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    gktera1Y = 25 + progreso * (-350 - 25);    // 25 a -350

    if (progreso >= 1) {
      estadoPantalla5 = 0;         // animación terminada
      gktera1Y = -350;
    }
  }
}

void iniciarInfoPantalla5() {
  estadoInfo5 = 1;
  tiempoInicioInfo5 = millis();
  info5Y = height + 200;           // arranca abajo, fuera de pantalla
}

void actualizarInfoPantalla5() {
  int duracionEntrada = 2000;      // 2 segundos para subir
  int duracionVisible = 10000;      //10 segundos quieto
  int duracionSalida  = 2000;      // 2 segundos para bajar

  float transcurrido = millis() - tiempoInicioInfo5;
  float progreso;

  if (estadoInfo5 == 1) {          // Subiendo desde abajo
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    info5Y = (height + 200) + progreso * (345 - (height + 200));
    if (progreso >= 1) {
      estadoInfo5 = 2;             // pasa a visible
      tiempoInicioInfo5 = millis();
      info5Y = 345;
    }
  } 
  else if (estadoInfo5 == 2) {     // Visible
    if (transcurrido > duracionVisible) {
      estadoInfo5 = 3;             // empieza a bajar
      tiempoInicioInfo5 = millis();
    }
  } 
  else if (estadoInfo5 == 3) {     // Bajando
    progreso = transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    info5Y = 345 + progreso * ((height + 200) - 345);
    if (progreso >= 1) {
      estadoInfo5 = 0;             // terminó
      info5Y = height + 200;
    }
  }
}
