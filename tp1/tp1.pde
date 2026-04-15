// Paulina Prado, Comisión 3 12/4/2026

PImage mural;
void setup(){
  size(800, 400);
mural = loadImage("data/mural.png");
}
void mousePressed(){
    println(mouseX,mouseY);
}
void draw(){
 background(230,230,230);
 pushMatrix();
  translate(400,0);
 //hojita naranja
 noStroke();
 fill(219,164,137);
 triangle(325,179,340,105,391,181);
 ellipse(370,154,58,67);
 
  //hojita amarilla
fill(222,180,121);
noStroke();
triangle(320,127,303,68,354,66);
triangle(320,127,376,125,373,85);
triangle(320,127,338,78,362,112);
ellipse(351,88,50,50);
 stroke(186,140,98);
line(320,127,312,142);

 //Planeta
 fill(94,145,212);
 noStroke();
 ellipse(202,204,252,247);
 fill(52,95,87);
triangle(157,255,100,245,146,309);
triangle(184,141,148,210,146,123);
triangle(154,136,143,94,95,135);
rect(95,135,55,55);
triangle(95,135,74,190,110,189);
triangle(244,88,279,105,243,126);
stroke(52,95,87);
bezier(244,88,280,100,318,140,320,166);
noStroke();
ellipse(260,135,55,55);
triangle(279,105,279,155,324,168);
triangle(293,118,284,133,321,162);

 // hojita izq 
 fill(76,120,83);
 ellipse(21,285,45,80);
 triangle(43,296,-2,286,-5,404);
 triangle(44,286,12,248,67,230);
 ellipse(33,170,42,130);
 triangle(15,139,48,43,52,140);
// flor amarilla izq

 fill(214,180,114);
 ellipse (10,90,50,33);
 triangle(0,138,20,74,0,72);
  triangle(0,64,20,74,0,75);
 
 //flores rositas izq)
  stroke(61,81,109);
 strokeWeight(2);
  line(62,109,57,151);
  line(95,103,57,152);
  line(110,120,57,151);
  line(57,151,54,190);

  noStroke();
 fill(197,108,177);

  triangle(52,95,41,107,54,111);
  triangle(54,92,71,93,68,103);
 ellipse (58,102,20,20);
 triangle(94,80,80,82,87,96);
 triangle(106,82,120,95,107,102);
  ellipse (99,92,25,25);
  triangle(119,105,103,109,107,122);
   ellipse (120,118,27,27);

 // pandurata?
 stroke(37,58,85);
 strokeWeight(3);

 line(70,400,55,257);
 line(64,339,72,327);
 line(59,284,68,271);
  noStroke();
 fill(53,90,84);

  ellipse(107,370,80,50);
  ellipse(22,331,65,50);
  triangle(54,325,65,350,25,356);
  ellipse(102,302,60,50);
  triangle(72,304,71,329,105,327);
  ellipse(30,282,44,30);
  triangle(51,276,32,297,58,293);
  ellipse(84,269,36,19);

 //hojitas de abajo
 fill(92,136,76);

  ellipse(182,360,36,74);
  ellipse(217,365,35,50);
  triangle(201,353,227,321,229,348);
  triangle(196,338,174,304,166,344);
  triangle(175,395,203,405,229,383);
  triangle(196,338,218,391,185,393);

   fill(61,108,72);

    ellipse(251,336,32,31);
    triangle(235,338,242,358,263,347);
    triangle(237,329,260,296,267,333);

  stroke(114,162,132);
  strokeWeight(2);

  line(230,400,242,357);
  bezier(243,357,249,340,253,340,256,310);

  //hojas abajo izq
  fill(95,133,108);
  noStroke();

  ellipse(298,375,55,55);
  triangle(270,373,243,400,301,400);
  ellipse(306,332,40,80);
  triangle(289,311,306,262,319,301);
  triangle(308,359,349,319,344,379);
  ellipse(345,376,50,45);
  triangle(364,364,399,400,343,398);
  triangle(342,368,365,281,377,282);

  //manoizq abajo
  fill(190,170,160);

  triangle(0,173,0,264,275,222);
  triangle(60,243,209,292,170,210);
   triangle(211,274,238,280,267,243);
   rect(189,165,42,20);
   triangle(189,165,152,189,194,184);
   quad(243,268,279,254,293,272,279,286);

  //mano arriba
  fill(169,140,144);

  rect(230,181,170,80);
  rect(192,181,38,85);
  triangle(190,261,256,272,356,259);
  triangle(100,189,89,209,146,207);
  triangle(100,189,81,192,89,209);
  triangle(205,181,100,189,195,230);
  triangle(188,207,115,226,206,251);
  triangle(115,226,117,246,176,238);
  triangle(115,226,96,255,118,253);
  triangle(95,254,108,263,145,235);
  triangle(195,234,140,262,204,261);
   triangle(140,262,155,281,202,255);
   triangle(193,260,177,284,241,264);
   triangle(177,284,190,289,234,259);

  //dedos arriba
  fill(217,200,200);

triangle(208,291,200,272,221,264);
triangle(207,291,226,287,220,264);
triangle(200,272,220,265,211,258);
triangle(236,281,252,250,258,272);
triangle(236,282,252,251,231,246);
triangle(247,240,253,252,230,247);
triangle(220,179,231,163,263,176);
triangle(220,178,238,192,263,175);
bezier(238,192,257,194,266,178,261,175);
bezier(241,191,229,194,214,183,221,179);
bezier(235,280,248,289,261,279,257,270);
bezier(207,291,209,297,227,299,226,286);
bezier(201,273,195,264,213,250,220,265);
quad(281,288,271,264,295,252,299,280);
popMatrix();
bezier(671,264,669,251,690,244,695,253);
bezier(634,261,623,246,629,237,647,239);


//flor violetita
fill(#A875AF);
ellipse(778,262,50,50);
 //Imagen
 image(mural, 0,0);
}
