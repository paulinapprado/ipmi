//Paulina Prado, Comisión 3, Legajo 125664/7 //<>//
//VIDEO: https://youtu.be/xHVWFQe8fqU
//CONTROLES:
//CAMBIAR COLORES : Click sobre cada cuadrante cambia los colores
//T= Resetear todos los colores G=Resetear cuadrante verde
// M= Resetear cuadrante marron, R= resetear cuadrante rojo,
//CANTIDAD DE CUADRADOS
// + para aumentar - para disminuir
PImage trece;
//establezco los colores originales de la imagen
final color verde1Original = color(3, 46, 37);
final color verde2Original = color(90, 220, 105);
final color rojo1Original = color(147, 2, 30);
final color rojo2Original = color(255, 148, 148);
final color marron1Original = color(70, 30, 26);
final color marron2Original = color(255, 192, 0);
final color violeta1Original = color(77, 37, 133);
final color violeta2Original = color(226, 213, 234);
//color que va a mostrar el programa, cambian al acer click
color verde1 = verde1Original;
color verde2 = verde2Original;
color rojo1 = rojo1Original;
color rojo2 = rojo2Original;
color marron1 = marron1Original;
color marron2 = marron2Original;
color violeta1 = violeta1Original;
color violeta2 = violeta2Original;
color colorCorrespondiente1; //Asignan el color a cada cuadrante
color colorCorrespondiente2;
int cantidadCuadrados= 10;
boolean rotarActivo = false;
void setup() {
  size( 800, 400);
  trece = loadImage("data/13.jpg");
}

void draw () {
  image(trece, 0, 0, 400, 400);
  for (int x = 0; x<400; x+=200) { //dibuja los 2 cuadrados a la derecha
    for (int y = 0; y<300; y+=200) { //dibuja 1 cuadrado mas hacia abajo

      if (PintarVerde (500 + x, 100 + y)) { //elije que color le corresponde a cada uno
        colorCorrespondiente1 = verde1;
        colorCorrespondiente2 = verde2;
      } else if ( PintarRojo (500 + x, 100 + y) ) {
        colorCorrespondiente1  = rojo1;
        colorCorrespondiente2 = rojo2;
      } else if (PintarAzul(500 + x, 100 + y)) {
        colorCorrespondiente1 = violeta1;
        colorCorrespondiente2 = violeta2;
      } else {
        colorCorrespondiente1 = marron1;
        colorCorrespondiente2 = marron2;
      }
      pushMatrix();
      translate(500, 0);
        cuadradosAchicandose(x, 100+y, cantidadCuadrados, colorCorrespondiente1, colorCorrespondiente2);
      popMatrix();
    }
  }
}

void cuadradosAchicandose(float x, float y, float cant, color col1, color col2) {
  //Dibuja los cuadrados haciendose cada vez mas chicos
  float anchoAlto = 200;

  for (int i = 0; i <= cant; i++) {

    rectMode(CENTER);
    noStroke();
    float t = i / (cant);  //valor entre 0.0 y 1.0 para el lerpColor
    float anguloPorCuadrado = radians(5);
    color colorFinal = lerpColor(col1, col2, t); //va calculando los valores intermedios de cada cuadrado
    fill(colorFinal);

    // El tamaño disminuye progresivamente: 200, 180, 160, ..., 20
    float tam = anchoAlto - i * (anchoAlto / cant);


    if (rotarActivo) {
      // Guarda el estado actual de la matriz
      pushMatrix();
      translate(x, y);
      rotate(i * anguloPorCuadrado); // Rotación aumenta según i
      rect(0, 0, tam, tam);
      popMatrix();
    } else {
      // Sin rotación: dibujo normal
      rect(x, y, tam, tam);
    }
  }
}
void mousePressed() {

  //Detectar en qué cuadrante se hizo clic 
  // Cuadrante verde
  if (enCuadrante(400, 600, 0, 200)) {
    // verde1: más oscuro (G bajo), verde2: más claro (G alto)
    verde1 = color(random(0, 50), random(100, 160), random(0, 50));
    verde2 = color(random(10, 60), random(200, 255), random(10, 60));
  }
  // Cuadrante rojo
  else if (enCuadrante(600, 800, 0, 200)) {
    // rojo1: más oscuro (R bajo), rojo2: más claro (R alto)
    rojo1 = color(random(150, 200), random(0, 50), random(0, 50));
    rojo2 = color(random(230, 255), random(10, 110), random(10, 110));
  }
  // Cuadrante marrón
  else if (enCuadrante(400, 600, 200, 400)) {
    // marrón1: más oscuro (valores bajos), marrón2: más claro (valores altos)
    marron1 = color(random(80, 140), random(30, 80), random(0, 30));
    marron2 = color(random(170, 210), random(100, 160), random(10, 60));
  }
  // Cuadrante violeta
  else if (enCuadrante(600, 800, 200, 400)) {
    // Violeta/morado: R alto, G bajo, B alto
    violeta1 = color(random(100, 180), random(0, 60), random(140, 200));
    violeta2 = color(random(200, 255), random(10, 70), random(220, 255));
  }
}

void keyPressed() {
  // ESPACIO -> resetear todos los cuadrantes
  if (key == 't' ||key == 'T') {
    verde1 = verde1Original;
    verde2 = verde2Original;
    rojo1 = rojo1Original;
    rojo2 = rojo2Original;
    marron1 = marron1Original;
    marron2 = marron2Original;
    violeta1 = violeta1Original;
    violeta2 = violeta2Original;
  }
  // G -> resetear solo el cuadrante verde
  else if (key == 'g' || key == 'G') {
    verde1 = verde1Original;
    verde2 = verde2Original;
  }
  // R -> resetear solo el cuadrante rojo
  else if (key == 'r' || key == 'R') {
    rojo1 = rojo1Original;
    rojo2 = rojo2Original;
  }
  // V -> resetear solo el cuadrante violeta
  else if (key == 'v' || key == 'V') {
    violeta1 = violeta1Original;
    violeta2 = violeta2Original;
  }
  // M -> resetear solo el cuadrante marrón
  else if (key == 'm' || key == 'M') {
    marron1 = marron1Original;
    marron2 = marron2Original;
  }
  if (key == '+') {
    cantidadCuadrados+=2;
  }
  if (key == '-') {
    cantidadCuadrados-=2;
  }
  if (key == 'i' || key == 'I') {
    rotarActivo = !rotarActivo; // Alterna entre true/false
  }
}
boolean PintarVerde(int x, int y) {
  return (x==500 && y==100);
}
boolean PintarRojo(int x, int y) {
  return (x==700 && y==100);
}
boolean PintarMarron(int x, int y) {
  return (x==500 && y==300);
}
boolean PintarAzul(int x, int y) {
  return (x==700 && y==300);
}

boolean enCuadrante(int limiteX1, int limiteX2, int limiteY1, int limiteY2) {

  return (mouseX >= limiteX1 && mouseX <= limiteX2 && limiteY1 >= 0 && mouseY <= limiteY2);
} //calcula en que cuadrante se encuentra el mouse
