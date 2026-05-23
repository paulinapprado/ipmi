//En esta pestaña se encuentras las funciones que sirven para condicionar el comportamiento de ciertos elementos
//de la presentación
// FUNCIONES DE TRANSICIÓN
boolean debeAvanzarPantalla() {
  // Solo avanza si la presentación está activa, estamos en pantallas 1-12 y pasó el tiempo de duración
  return presentacionActiva && pantalla >= 1 && pantalla <= 12 &&
    millis() - tiempoInicio > duracionPantallas;
}

void avanzarPantalla() {
  pantalla++;
  if (pantalla > 12) {
    pantalla = 13;
    presentacionActiva = false;
  }
  tiempoInicio = millis();  // reiniciamos el cronómetro para la nueva pantalla
  iniciarPantallaActual(); //iniciamos la animacion de la pantalla q sigue
}
//iniciar las animaciones segun la pantalla
void iniciarPantallaActual() {
  if (pantalla == 1) {
    iniciarAnimacionPantalla1();
    iniciarAnimacionInfo1();
  } else if (pantalla == 2) {
    iniciarAnimacionesPantalla2();
    estadoInfo2 = 1;
    tamañoInfo2 = 1;
  } else if (pantalla == 3) {
    iniciarAnimacionPantalla22();
    iniciarInfoPantalla22();
  } else if (pantalla == 4) {
    iniciarAnimacionPantalla3();
    iniciarInfoPantalla3();
  } else if (pantalla == 5) {
    iniciarAnimacionPantalla4();
    iniciarInfoPantalla4();
  } else if (pantalla == 6) {
    iniciarAnimacionPantalla5();
    iniciarInfoPantalla5();
  } else if (pantalla == 7) {
    iniciarAnimacionPantalla6();
    iniciarInfoPantalla6();
  } else if (pantalla == 8) {
    iniciarAnimacionPantalla7();
    iniciarInfoPantalla7();
  } else if (pantalla == 9) {
    iniciarAnimacionPantalla8();
  } else if (pantalla == 10) {
    iniciarAnimacionPantalla9();
    iniciarInfoPantalla9();
  } else if (pantalla == 11) {
    iniciarAnimacionPantalla10();
  } else if (pantalla == 12) {
    iniciarAnimacionPantalla11();
  }
}

//  FUNCIONES DE DETECCIÓN DE BOTONES

boolean mouseSobreBotonIniciar() {
  return mouseX > width/2 - 60 && mouseX < width/2 - 60 + tamañoBotonX &&
    mouseY > height/2 + 50 && mouseY < height/2 + 50 + tamañoBotonY; //si todas estas condiciones se cumplen, devuelve true
}
boolean mouseSobreBotonReiniciar() {
  return mouseX > width/2 - 60 && mouseX < width/2 - 60 + tamañoBotonX &&
    mouseY > height/2 + 170 && mouseY < height/2 + 170 + tamañoBotonY; //si todas estas condiciones se cumplen, devuelve true
}
