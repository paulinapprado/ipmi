//pestaña con animaciones dela pantalla 2
void iniciarAnimacionPantalla1() {
estadoPantalla1 = 1;
tiempoInicioPantalla1 = millis();
// Posiciones iniciales fuera de pantalla por la izquierda
mmz1X = -200;
mmz2X = -200;
mmz3X = -200;
txtTetsuX = -100;
txtGacktX = -100;
txtKlahaX = -100;
}

void actualizarAnimacionPantalla1() {
  // Duraciones locales (podés ajustarlas)
  int duracionEntradaImg = 2000;   // 2 segundos
  int duracionEntradaTxt = 1000;   // 1 segundo después de las imágenes
  int duracionVisible = 10000;      // 10 segundos quietos
  int duracionSalida = 2000;       // 2 segundos para irse

  float transcurrido = millis() - tiempoInicioPantalla1;
  float progreso;

  // Entrada de imágenes (desde -200 a sus posiciones finales)
  if (estadoPantalla1 == 1) {
    progreso = transcurrido / duracionEntradaImg;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    mmz1X = -200 + progreso * (10 - (-200));
    mmz2X = -200 + progreso * (205 - (-200));
    mmz3X = -200 + progreso * (420 - (-200));

    if (progreso >= 1) {
      estadoPantalla1 = 2;                  // empezar a entrar textos
      tiempoInicioPantalla1 = millis();
      mmz1X = 10;
      mmz2X = 205;
      mmz3X = 420;
    }
  }
  // 2. Entrada de textos
  else if (estadoPantalla1 == 2) {
    progreso = transcurrido / duracionEntradaTxt;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    txtTetsuX = -100 + progreso * (100 - (-100));
    txtGacktX = -100 + progreso * (300 - (-100));
    txtKlahaX = -100 + progreso * (530 - (-100));

    if (progreso >= 1) {
      estadoPantalla1 = 3;                  // fase visible
      tiempoInicioPantalla1 = millis();
      txtTetsuX = 100;
      txtGacktX = 300;
      txtKlahaX = 530;
    }
  }
  // 3. Pausa visible
  else if (estadoPantalla1 == 3) {
    if (transcurrido > duracionVisible) {
      estadoPantalla1 = 4;                  // empezar a salir
      tiempoInicioPantalla1 = millis();
    }
  }
  // 4. Salida hacia la derecha
  else if (estadoPantalla1 == 4) {
    progreso = transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    mmz1X = 10 + progreso * ((width + 100) - 10);
    mmz2X = 205 + progreso * ((width + 100) - 205);
    mmz3X = 420 + progreso * ((width + 100) - 420);
    txtTetsuX = 100 + progreso * ((width + 100) - 100);
    txtGacktX = 300 + progreso * ((width + 100) - 300);
    txtKlahaX = 530 + progreso * ((width + 100) - 530);

    if (progreso >= 1) {
      estadoPantalla1 = 0;                  // animación terminada
    }
  }
}
void iniciarAnimacionInfo1() {
  estadoInfo1 = 1;
  tiempoInicioInfo1 = millis();
  info1Y = info1YFuera;
}

void actualizarAnimacionInfo1() {
  int duracionEntrada = 2000;
  int duracionVisible = 10000;
  int duracionSalida = 2000;
  float transcurrido = millis() - tiempoInicioInfo1;
  float progreso;

  if (estadoInfo1 == 1) {
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    info1Y = info1YFuera + progreso * (info1YDestino - info1YFuera);
    if (progreso >= 1) {
      estadoInfo1 = 2;
      tiempoInicioInfo1 = millis();
      info1Y = info1YDestino;
    }
  } else if (estadoInfo1 == 2) {
    if (transcurrido > duracionVisible) {
      estadoInfo1 = 3;
      tiempoInicioInfo1 = millis();
    }
  } else if (estadoInfo1 == 3) {
    progreso = transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    info1Y = info1YDestino + progreso * (info1YFuera - info1YDestino);
    if (progreso >= 1) {
      estadoInfo1 = 0;
      info1Y = info1YFuera;
    }
  }
}
