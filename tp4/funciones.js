function dibujarPantallaInicio() {

    textAlign(CENTER, CENTER);
  textSize(20);
  fill(255);

  background(0);
  text("se me fue todo el presupuesto a la/n animación perdon profe </3", 490, 400);
  imageMode(CENTER);
  let estadoBoton = 1;
  if (mouseX > btnX - btnW/2 && mouseX < btnX + btnW/2 && mouseY > btnY - btnH/2 && mouseY < btnY + btnH/2) {
    estadoBoton = 0;
  }
  image(boton[estadoBoton], btnX, btnY, btnW, btnH);
  image (bd, 630, 170, 350,350);
  image(yo[frameYo], 120, 480);
}
function actualizarTiempoYo() {
  let tiempoActual = millis();
  let transcurridoYo = tiempoActual - vezAnteriorYo;
  if (transcurridoYo >= intervaloYo) {
    frameYo = (frameYo + 1) % 4;
    vezAnteriorYo = tiempoActual;
  }
}


function calcularProgreso(transcurrido, intervalo) {
  let p = transcurrido / intervalo;
  if (p > 1) {
    return 1;
  } else {
    return p;
  }
}

function actualizarFrames(transcurrido, intervalo) {
  if (transcurrido >= intervalo) {
    frameActual = (frameActual + 1) % totalOrbital;  // Solo recorre 0-16
    frameActual2 = (frameActual2 + 1) % totalOrbital;
    return true;
  }
  return false;
}

function actualizarTiempoQifrey() {
  // Si la velocidad es 0 o negativa, activar estado idle y no avanzar la órbita
  if (idleForzado || velocidadQifreyOlly <= 0) {
    estadoIdle = true;
    if (sonidoFondo.isPlaying()) {
      sonidoFondo.pause();
    }
    return;  // No se actualiza frameActual ni progreso
  } else {
    estadoIdle = false;  // Volver a la animación normal
    if (!sonidoFondo.isPlaying()) {
      sonidoFondo.loop();
    }
  }
  // --- ACTUALIZACIÓN DEL FRAME ---
  let intervaloActual = 1000 / (fpsObjetivo * velocidadQifreyOlly);//divide 1 segundo en lacantidad de frames que busco
  let tiempoActual = millis(); //contador de milisegundos
  let transcurrido = tiempoActual - vezAnterior;// calcula cuantos milisegundos pasaron desde que se guardo el momento

  // Si pasó el intervalo, avanzamos al siguiente frame y reseteamos los contadors
  if (actualizarFrames(transcurrido, intervaloActual)) {
    vezAnterior = tiempoActual;
    transcurrido = 0;
  }
  progreso = calcularProgreso(transcurrido, intervaloActual);
}

function actualizarTiempoIdle() {
  if (estadoIdle) {
    let tiempoActual = millis();
    let transcurridoIdle = tiempoActual - vezAnteriorIdle;
    if (transcurridoIdle >= intervaloIdle) {
      frameIdle = (frameIdle + 1) % totalIdle;  // 0,1,2 y vuelve
      vezAnteriorIdle = tiempoActual;
    }
  }
}

function actualizarTiempoRamas() {
  let tiempoActualRamas = millis();
  let transcurridoRamas = tiempoActualRamas - vezAnteriorRamas;

  if (transcurridoRamas >= intervaloRamas) {
    frameActualRamas = (frameActualRamas + 1) % totalRamas;  // recorre 0,1,2,3 y vuelve
    vezAnteriorRamas = tiempoActualRamas;
  }
}

//  FUNCIÓN QUE CALCULA LA POSICIÓN X DE  QIFREY
function calcularPosicionQifrey(indiceFrame) {
  let xSiguiente = (indiceFrame + 1) % totalQifrey;

  // Si el salto es entre el frame 10 y el 11 o el 9 y el 10, NO interpola (salto inmediato)
  if (indiceFrame === 10 && xSiguiente === 11) {
    return posX[11];
  } else if (indiceFrame === 9 && xSiguiente === 10) {
    return posX[10];
  } else {
    return lerp(posX[indiceFrame], posX[xSiguiente], progreso);
  }
}
function dibujarEscena() {
  imageMode(CENTER);

  // Fondo se veia glitcheado cuando no estaba en center, no se por que
  image(fondo, width / 2, height / 2);

  // Ramas
  image(framesRamas[frameActualRamas], width / 2, height / 2);

  // Olly (fijo)
  image(framesOlly[frameActual], 375, 300);

  // Qifrey 1 y Qifrey 2
  if (estadoIdle) {
    // --- MODO IDLE: dibujar frames 17,18,19 en la última posición ---
    image(framesQifrey[17 + frameIdle], ultimaX1, 200);
    image(framesQifrey[17 + frameIdle], ultimaX2, 200);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(20);
    // textFont(fuentesitaBonita);
    text("Espacio para comenzar", width / 2, 50);
    text("+ y - para aumentar/reducir la velocidad", width / 2, 80);
    text("Escape para volver al menu", width / 2, 110);
  } else {
    let x1 = calcularPosicionQifrey(frameActual);
    let x2 = calcularPosicionQifrey(frameActual2);

    // ACTUALIZAR LAS POSICIONES GUARDADAS
    ultimaX1 = x1;
    ultimaX2 = x2;

    //  DIBUJAR QIFREY EN MODO MOVIMIENTO
    image(framesQifrey[frameActual], calcularPosicionQifrey(frameActual), 200);
    image(framesQifrey[frameActual2], calcularPosicionQifrey(frameActual2), 200);
  }
}
