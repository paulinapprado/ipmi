// Paulina Prado, Comisión 3, LEGAJO: 125664/7
let pantallaInicio = true;
let boton = [];
let yo = [];
let framesYo = [];
let frameYo = 0;
let intervaloYo = 1000 / 4;  // 4 fps
let vezAnteriorYo = 0;
let btnX = 400;
let btnY = 440;
let btnW = 200;
let btnH = 60;
let bd;

let totalQifrey = 20;
let totalOrbital = 17;  // Frames 0-16 para la órbita
let totalIdle = 3;           // Frames 17-19 para el estado idle
let totalOlly = 17;
let totalRamas = 3;
let frameActual = 0;// Indica qué frame de la animación se dibuja en este momento
let frameActual2 = 9;         // índice del segundo Qifrey (empieza en 9)
let frameActualRamas = 0;

let framesQifrey = [];
let framesOlly = [];
let fondo;
let framesRamas = [];

// estado idle
let estadoIdle = false;
let idleForzado = true
  let frameIdle = 0;
let intervaloIdle = 1000 / 3;  // 3 fps para la animación idle
let vezAnteriorIdle = 0;

// Variable para el audio
let sonidoFondo;  // le pedi ayuda a la IA para que me explique como añadir audio


// Arrays para calcular la posicion
let posX = [];
let ultimaX1 = 0;  // Última posición X del primer Qifrey
let ultimaX2 = 0;  // Última posición X del segundo Qifrey

// Control de tiempo
let velocidadQifreyOlly = 1.0 //para subir o bajarle la velocidad
  let fpsObjetivo = 7.5;
let intervaloRamas= 1000/3;
let vezAnterior = 0;
let vezAnteriorRamas = 0;
let progreso = 0; // progreso entre frames (0 a 1)

//let fuentesitaBonita; Intenté crear una fuente pero aparentemente .vlw no funciona
//con p5.js o algo así y no tuve ganas de buscar una solución alternativa en el momento juju

function preload() {
  for ( i = 0; i < 2; i++) {
    boton[i] = loadImage("data/boton" + i + ".png");
  }
  for ( i = 0; i < 4; i++) {
    yo[i] = loadImage("data/bibujando/yo" + nf(i, 4) + ".png");
  }
  for ( i = 0; i < totalQifrey; i++) {
    framesQifrey[i] = loadImage("data/qifrey/qifrey" + nf(i, 4) + ".png");
  }
  for (i = 0; i < totalOlly; i++) {
    framesOlly[i] = loadImage("data/olly/olly" + nf(i, 4) + ".png");
  }
  for ( i = 0; i < totalRamas; i++) {
    framesRamas[i] = loadImage("data/ramas/ramas" + nf(i, 4) + ".png");
  }
  fondo = loadImage("data/fondo.png");
  sonidoFondo = loadSound("data/TwinattheCarousel.mp3");
  //fuentesitaBonita = loadFont("data/fuente.vlw");
  bd =loadImage("data/bd.jpg");
}

function setup() {
  createCanvas(800, 600);

  // Asignar posiciones frame a frame
  posX[0] = 440;

  posX[1] = 405;

  posX[2] = 330;

  posX[3] = 260;

  posX[4] = 240;
  posX[5] = 210;
  posX[6] = 190;
  posX[7] = 190;
  posX[8] = 200;
  posX[9] = 250;
  // Salto: los frames 9+ aparecen al otro lado
  posX[10] = 300;
  posX[11] = 430;
  posX[12] = 435;
  posX[13] = 492;
  posX[14] = 500;
  posX[15] = 510;
  posX[16] = 520;
  posX[17] = 520;

  vezAnterior = millis(); // Guarda el momento actual para controlar el tiempo entre frames
  vezAnteriorYo = millis();

  vezAnteriorIdle = millis();
  vezAnteriorRamas = millis();
  ultimaX1 = posX[0];   // Posición inicial del primer Qifrey
  ultimaX2 = posX[9];   // Posición inicial del segundo Qifrey
}

function draw() {

  if (pantallaInicio) {
    actualizarTiempoYo();

    dibujarPantallaInicio();
  } else {
    actualizarTiempoQifrey();
    actualizarTiempoIdle();
    actualizarTiempoRamas();
    dibujarEscena();
  }
}

function mousePressed() {
  print(mouseX, mouseY);

  if (pantallaInicio) {
    // check click on button
    if (mouseX > btnX - btnW/2 && mouseX < btnX + btnW/2 && mouseY > btnY - btnH/2 && mouseY < btnY + btnH/2) {
      pantallaInicio = false;
    }
  }
}

function keyPressed() {
  if (!pantallaInicio) {
    if (key === 'Escape') {  // o keyCode === 27
      pantallaInicio = true;
      sonidoFondo.pause(); // Detener la música
      // Reiniciar animación a estado inicial (opcional)
      frameActual = 0;
      frameActual2 = 9;
      frameIdle = 0;
      idleForzado = true;
      estadoIdle = true;
      ultimaX1 = posX[0];
      ultimaX2 = posX[9];
      velocidadQifreyOlly = 1.0;
    }
    if (key === ' ') {
      idleForzado = !idleForzado;
    }
    if (key === '+') {
      velocidadQifreyOlly += 0.3;
    }
    // Bajar velocidad (con mínimo de 0.1 para evitar cero o negativos)
    else if (key === '-' ) {
      velocidadQifreyOlly -= 0.3;
      //queria intentar ponerle un límite porque actualmente si apretas -
      //varias veces despues de llegar a 0, desp tenes que apretas + esa misma
      //cantidad de veces para que empiece de vuelta la animación, pero no logre
      //entender como se usaba la función q me sugería la ia
    }
  }
}
