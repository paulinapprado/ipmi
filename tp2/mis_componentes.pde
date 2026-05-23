//En esta pesetaña se encuentran funciones de los componentes y animaciones
//que se usan en cada una de las pantallas

void dibujarBoton(String texto, color col) {
  stroke(255);
  fill(col);
  rect(width/2 - 60, height/2 + 50, tamañoBotonX, tamañoBotonY);
  fill(255);
  textSize(24);
  textAlign(CENTER, CENTER);
  text(texto, width/2, height/2 + 70);
}

void dibujarTitulo(String texto) {
  textSize(tituloTamaño);
  textAlign(CENTER, CENTER);
  text(texto, width/2, height/2 - 60);
}

//  ANIMACIÓN DEL TÍTULO
void animarTitulo() {
  if (tituloAgrandando) {
    tituloTamaño += 0.2; //aca fui probando distintos valres hasta llegar a una velocidad de agrandamiento que me gustara
    if (tituloTamaño >= 90) {
      tituloTamaño = 90;
      tituloAgrandando = false;
    }
  } else {
    tituloTamaño -= 0.2;
    if (tituloTamaño <= 80) {
      tituloTamaño = 80;
      tituloAgrandando = true;
    }
  }
}
//INFORMACION EN LAS DEMAS PANTALLAS
void dibujarInfo1() {
  if (estadoInfo1 != 0) {
    fill(0, 140);
    stroke(0);
    float rectY = info1Y - 70;   //mantiene la distancia con la parte de arriba de la caja de texto
    //consistente a lo largo de la animación
    rect(0, rectY, 700, 300);
    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    text(info, width/2, info1Y);
  }
}
void dibujarInfo2(String texto, float rectY, float rectHeight, float textY, float tamTexto) {
  fill(0, 140);
  stroke(0);
  rect(0, rectY, 700, rectHeight);
  fill(255);
  textSize(tamTexto);
  textAlign(CENTER, CENTER);
  text(texto, width/2, textY);
}
void dibujarInfoBase(String texto, float rectX, float rectY, float rectW, float rectH,
  float textX, float textY, float opacidadFondo, float opacidadTexto) {
  if (opacidadFondo >= 0) {
    fill(0, 0, 0, opacidadFondo);
    stroke(0, opacidadFondo);
  } else {
    fill(0, 140);
    stroke(0);
  }
  rect(rectX, rectY, rectW, rectH);

  if (opacidadTexto >= 0) {
    fill(255, 255, 255, opacidadTexto);
  } else {
    fill(255);
  }
  textSize(30);
  textAlign(CENTER, CENTER);
  text(texto, textX, textY);
}
//Unifique varias de las funciones de información que tenian
//animaciones similares en una sola. Antes cada una tenia su propia
//funcion, como dibujarInfo1 y dibujarInfo2.

void infoMiembros(String texto, float x, float y) {
  fill(255);
  textSize(30);
  textAlign(CENTER, CENTER);
  text(texto, x, y);
}

//anim telon

void iniciarCortina() {
  estadoCortina = 1;                      // empieza a cerrarse
  tiempoInicioCortina = millis();   //Empiezo a contar el tiempo desde que inició
  // Posiciones iniciales fuera de pantalla
  cortinaIzqX = -width/2;
  cortinaDerX = width;
}

//Aproximadamente de este punto en adelante, le pedí a la IA ayuda con la parte de
//las formulas matematicas para las animaciones, pero la lógica/estructura esta hecha
//por mi

void actualizarCortina() {
  float transcurrido = millis() - tiempoInicioCortina;
  float progreso;
  transcurrido = millis() - tiempoInicioCortina;
  if (estadoCortina == 1) {                // CERRANDO
    // calculamos el progreso
    progreso = transcurrido / duracionCierre; // indica cuánto se completó la fase actual, lo use tanto para la animación como para decidir cuando cambiar de estado

    // movimiento de al posición de las cortinas
    cortinaIzqX = -width/2 + progreso * (width/2);   // va de -width/2 a 0
    cortinaDerX = width - progreso * (width/2);       // va de width a width/2

    if (progreso >= 1) {
      estadoCortina = 2;                  // pasa a esperar
      tiempoInicioCortina = millis();
      cortinaIzqX = 0;                    // posición final exacta
      cortinaDerX = width/2;
    }
  } else if (estadoCortina == 2) {           // DETENIDO
    if (transcurrido > duracionEspera) {
      estadoCortina = 3;                  // empieza a abrir
      tiempoInicioCortina = millis();
      // Cambiamos a la nueva pantalla justo al empezar a abrir
      pantalla = pantallaSiguiente;
      presentacionActiva = true;
      tiempoInicio = millis();            // cronómetro de la nueva pantalla
      iniciarPantallaActual();// empieza la animación de la pantalla
    }
  } else if (estadoCortina == 3) {           // ABRIENDO
    progreso = transcurrido / duracionApertura;

    cortinaIzqX = 0 - progreso * (width/2);          // 0 a -width/2
    cortinaDerX = width/2 + progreso * (width/2);    // width/2 a width

    if (progreso >= 1) {
      estadoCortina = 0;                  // telón inactivo
    }
  }
}



void dibujarCortina() {
  if (estadoCortina != 0) {
    // Dibujamos las dos mitades del telón en sus posiciones actuales
    image(cortinaIzq, cortinaIzqX, 0, width/2, height); //fuerzo que cubran la mitad de la pantalla
    image(cortinaDer, cortinaDerX, 0, width/2, height);
  }
}
