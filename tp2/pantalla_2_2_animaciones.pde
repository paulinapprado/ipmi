//pestaña con animaciones dela pantalla 22
void iniciarAnimacionPantalla22() {
  estadoPantalla22 = 1;
  tiempoInicioPantalla22 = millis();
  // Imágenes arrancan más arriba todavía
  ts1Y = -300;
  gz1Y = -300;
  km1Y = -300;
  yk1Y = -300;

  // Textos también desde fuera
  txtTetsu22Y = -150;
  txtGaz22Y = -150;
  txtKami22Y = -150;
  txtYuki22Y = -150;
  opacidadInfo22 = 0;
}
void actualizarAnimacionPantalla22() {
  int transcurrido = millis() - tiempoInicioPantalla22;
  float progreso;

  // Fase 1: entrada ts1
  if (estadoPantalla22 == 1) {
    progreso = transcurrido / 1000.0;
    if (progreso > 1) progreso = 1;
    ts1Y = -300 + progreso * (30 - (-300));
    txtTetsu22Y = -150 + progreso * (325 - (-150));
    if (progreso >= 1) {
      estadoPantalla22 = 2;
      tiempoInicioPantalla22 = millis();
      ts1Y = 30;
      txtTetsu22Y = 325;
    }
  }
  // Fase 2: entrada gz1
  else if (estadoPantalla22 == 2) {
    progreso = transcurrido / 1000.0;
    if (progreso > 1) progreso = 1;
    gz1Y = -300 + progreso * (30 - (-300));
    txtGaz22Y = -150 + progreso * (325 - (-150));
    if (progreso >= 1) {
      estadoPantalla22 = 3;
      tiempoInicioPantalla22 = millis();
      gz1Y = 30;
      txtGaz22Y = 325;
    }
  }
  // Fase 3: entrada km1
  else if (estadoPantalla22 == 3) {
    progreso = transcurrido / 1000.0;
    if (progreso > 1) progreso = 1;
    km1Y = -300 + progreso * (30 - (-300));
    txtKami22Y = -150 + progreso * (325 - (-150));
    if (progreso >= 1) {
      estadoPantalla22 = 4;
      tiempoInicioPantalla22 = millis();
      km1Y = 30;
      txtKami22Y = 325;
    }
  }
  // Fase 4: entrada yk1
  else if (estadoPantalla22 == 4) {
    progreso = transcurrido / 1000.0;
    if (progreso > 1) progreso = 1;
    yk1Y = -300 + progreso * (30 - (-300));  // destino = 30
    txtYuki22Y = -150 + progreso * (325 - (-150));
    if (progreso >= 1) {
      estadoPantalla22 = 5;                        // ahora fase 5 = pausa
      tiempoInicioPantalla22 = millis();
      yk1Y = 30;
      txtYuki22Y = 325;
    }
  }
  // Fase 5: pausa (ahora 7 segundos en lugar de 4)
  else if (estadoPantalla22 == 5) {
    if (transcurrido > 7000) {                    // 7000
      estadoPantalla22 = 6;                        // comenzar salida
      tiempoInicioPantalla22 = millis();
    }
  }
  // Fase 6: salida yk1 (ahora 1 segundo en lugar de 0.5)
  else if (estadoPantalla22 == 6) {
    progreso = transcurrido / 1000.0;             //  1000.0
    if (progreso > 1) progreso = 1;
    yk1Y = 30 + progreso * (-300 - 30);
    txtYuki22Y = 325 + progreso * (-150 - 325);
    if (progreso >= 1) {
      estadoPantalla22 = 7;
      tiempoInicioPantalla22 = millis();
      yk1Y = -300;
      txtYuki22Y = -150;
    }
  }
  // Fase 7: salida km1
  else if (estadoPantalla22 == 7) {
    progreso = transcurrido / 1000.0;             //1000.0
    if (progreso > 1) progreso = 1;
    km1Y = 30 + progreso * (-300 - 30);
    txtKami22Y = 325 + progreso * (-150 - 325);
    if (progreso >= 1) {
      estadoPantalla22 = 8;
      tiempoInicioPantalla22 = millis();
      km1Y = -300;
      txtKami22Y = -150;
    }
  }
  // Fase 8: salida gz1
  else if (estadoPantalla22 == 8) {
    progreso = transcurrido / 1000.0;             //  1000.0
    if (progreso > 1) progreso = 1;
    gz1Y = 30 + progreso * (-300 - 30);
    txtGaz22Y = 325 + progreso * (-150 - 325);
    if (progreso >= 1) {
      estadoPantalla22 = 9;
      tiempoInicioPantalla22 = millis();
      gz1Y = -300;
      txtGaz22Y = -150;
    }
  }
  // Fase 9: salida ts1
  else if (estadoPantalla22 == 9) {
    progreso = transcurrido / 1000.0;             // 1000.0
    if (progreso > 1) progreso = 1;
    ts1Y = 30 + progreso * (-300 - 30);
    txtTetsu22Y = 325 + progreso * (-150 - 325);
    if (progreso >= 1) {
      estadoPantalla22 = 0;                        // todo terminado
      ts1Y = -300;
      txtTetsu22Y = -150;
    }
  }
}
  
void iniciarInfoPantalla22() {
  estadoInfo22 = 1;                     // empieza el fade in
  tiempoInicioInfo22 = millis();
  opacidadInfo22 = 0;                   // comienza transparente
}

void actualizarInfoPantalla22() {
  int transcurrido = millis() - tiempoInicioInfo22;
  float progreso;

  if (estadoInfo22 == 1) {                     // fade in (2 segundos)
    progreso = transcurrido / 2000.0;
    if (progreso > 1) progreso = 1;
    opacidadInfo22 = 0 + progreso * 255;
    if (progreso >= 1) {
      estadoInfo22 = 2;                       // pasa a visible
      tiempoInicioInfo22 = millis();
      opacidadInfo22 = 255;
    }
  } else if (estadoInfo22 == 2) {              // visible (11 segundos)
    if (transcurrido > 11000) {
      estadoInfo22 = 3;                       // empieza fade out
      tiempoInicioInfo22 = millis();
    }
  } else if (estadoInfo22 == 3) {              // fade out (2 segundos)
    progreso = transcurrido / 2000.0;
    if (progreso > 1) progreso = 1;
    opacidadInfo22 = 255 - progreso * 255;
    if (progreso >= 1) {
      estadoInfo22 = 0;                       // terminó
      opacidadInfo22 = 0;
    }
  }
}
