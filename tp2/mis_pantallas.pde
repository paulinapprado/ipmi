//  PANTALLAS
//En esta pestaña estan las funciones que corresponden a cada una de
//las pantallas de la presentación
void dibujarPantallaInicio() {
  background(fondo0);

  dibujarTitulo("MALICE MIZER");
  animarTitulo();

  dibujarBoton("INICIAR", colorBoton);
  // Cambio de color del botón
  if ( mouseSobreBotonIniciar()) {
    colorBoton = color(#5A4576);
  } else {
    colorBoton = color(0);
  }
}
void dibujarPantalla1() {
  background(fondo1);
  image(mmz1, mmz1X, 45);
  image(mmz2, mmz2X, 45);
  image(mmz3, mmz3X, 45);

  text("Era Tetsu", txtTetsuX, 325);
  text("Era Gackt", txtGacktX, 325);
  text("Era Klaha", txtKlahaX, 325);
  info = "Malice Mizer fue una banda japonesa de visual kei.\nEl nombre de la banda proviene de las palabras francesas 'malice' y 'misère'\n  (malicia y miseria). La banda pasó por tres eras distintas, definidas\n por sus tres vocalistas,y se caracterizó por su estética,\n y sus elaborados conciertos.";
  dibujarInfo1();
}

void dibujarPantalla2() {
  background(fondo2);
  if (estadoPantalla2 >= 1 || estadoPantalla2 == 0) {
    if (estadoPantalla2 != 0) {
      image(mn1, mn1X, 90);
      image(kz1, kz1X, 100);
    }
  }

  // txt1 (aparece a partir del estado 2)
  if (estadoPantalla2 >= 2) {
    tint(255, 255, 255, opacidadTextos); //le pregunte a la IA que funcion podia utilizar para cambiar la opacidad
    //de las imagenes
    image(txt1, 250, 5);
    noTint();
  }

  // txt2 (a partir del estado 3)
  if (estadoPantalla2 >= 3) {
    float opacidad;
    if (estadoPantalla2 < 5) {
      opacidad = opacidadTxt2;
    } else {
      opacidad = opacidadTextos;
    }
    tint(255, 255, 255, opacidad);
    image(txt2, 190, 120);
    noTint();
  }

  // txt3 (a partir del estado 4)
  if (estadoPantalla2 >= 4) {
    tint(255, 255, 255, opacidadTextos);
    image(txt3, 250, 210);
    noTint();
  }


  info = "La banda se formo en agosto de 1992 por los guitarristas Mana y Közi,\n quienes se conocieron trabajando en un karaoke en Tokio.";
  dibujarInfo2 (info, 407, 300, height/1.2 + 40, tamañoInfo2);
}

void dibujarPantalla22() {
  background(fondo2);

  image(ts1, 7, ts1Y, 206, 274);
  image(gz1, 207, gz1Y, 203, 278);
  image(km1, 427, km1Y, 77, 290);
  image(yk1, 537, yk1Y, 77, 290);

  fill(255);
  textSize(21);
  textAlign(CENTER, CENTER);
  text("Tetsu", 100, txtTetsu22Y);
  text("Gaz", 305, txtGaz22Y);
  text("Kami", 475, txtKami22Y);
  text("Yu~ki", 575, txtYuki22Y);

  // Información con fade
  info = "Ellos reclutaron al vocalista Tetsu, al bajista Yu~ki y al baterista Gaz,\n quien dejó la banda  pronto y fue reemplazado por Kami.\n Su sonido inicial mezclaba rock gótico de los 80 con\n influencias clásicas. ";
  // unificada: ahora usa dibujarInfoBase con opacidad
  if (estadoInfo22 != 0) {
    dibujarInfoBase(info, 0, 345, 700, 300, width/2, height/1.2+15, opacidadInfo22, opacidadInfo22);
  }
}

void dibujarPantalla3() {
  background(fondo3);


  image(memoire, memoireX, 25, 300, 300);

  textSize(25);
  textAlign(LEFT);
  text("Canciones del album:", cancionesX, 65);
  text("1 - de memoire", cancionesX, 95);
  text("2 -Kioku To Sora", cancionesX, 125);
  text("3 -Ege Umi ni Sasagu", cancionesX, 155);
  text("4 -Gogo no Sasayagi", cancionesX, 185);
  text("5 - Miwaku no Roma", cancionesX, 215);
  text("6 - seraph", cancionesX, 245);
  text("7 - Baroque", cancionesX, 275);


  info = "En 1994 lanzaron su primer álbum, Memoire, bajo el sello independiente\n Midi:Nette creado por Mana. Sin embargo, a finales de 1994,Tetsu anunció \n su salida por diferencias creativas, separandose amistosamente.\n";
  dibujarInfoBase(info, 0, 345, 700, 300, info3X, height/1.2+15, -1, -1);
}

void dibujarPantalla4() {
  background(fondo4);
  image(gk1, gk1X, 80, 248, 236);
  image(gktera2, gktera2X, 60, 270, 270);

  info = "Tras una pausa de casi un año, en 1995 se unió  Gackt Camui. Con él,\n la banda alcanzó su mayor pico de popularidad. Su llegada también marcó un \n punto de inflexión:  Su sonido evolucionó hacia un estilo más\n romántico, con influencias de la música clásica e incorporando letras \n en francés.";
  if (estadoInfo4 != 0) {
    dibujarInfoBase(info, 0, info4Y, 700, 300, width/2, info4Y+70, -1, -1);
  }
}

void dibujarPantalla5() {
  background(fondo5);
  image(gktera1, 20, gktera1Y, 600, 300);
  info = "Estéticamente, optaron por atuendos coloridos  históricos.  Cada miembro\n tenía un color y un rol (Gackt: príncipe negro, Mana: princesa azul,\n Közi: payaso rojo, Yu~ki: vampiro amarillo, Kami: mariposa violeta).\n Las presentaciones en vivo también cambiaron: adquirieron\n gran teatralidad, con bailes y pequeñas escenas";
  dibujarInfoBase(info, 0, info5Y, 700, 300, width/2, info5Y+70, -1, -1);
}

void dibujarPantalla6() {
  background(fondo7);
  image(voyage, voyageX, 25, 150, 150);
  image(merveilles, merveillesX, 25, 150, 150);
  fill(255);
  textSize(25);
  textAlign(LEFT);
  text("Canciones del album:", textosVoyageX, 190);
  text("1 - yami no kanata e~", textosVoyageX, 210);
  text("2 -Transylvania", textosVoyageX, 230);
  text("3 -tsuioku no kakera", textosVoyageX, 250);
  text("4 -Premier Amour", textosVoyageX, 270);
  text("5 - itsuwari no musette", textosVoyageX, 290);
  text("6 -N.p.s N.g.s", textosVoyageX, 310);
  text("7 - claire ~tsuki no shirabe~", textosVoyageX, 330);
  text("8 - Madrigal", textosVoyageX + 160, 210);
  text("9 - shi no butou", textosVoyageX + 160, 230);
  text("10 - ~zenchou", textosVoyageX + 160, 250);

  text("Canciones del album:", textosMerveillesX + 100, 190);
  text("1 - de merveilles", textosMerveillesX, 210);
  text("2 -(Syunikiss", textosMerveillesX, 230);
  text("3 -Bel Air", textosMerveillesX, 250);
  text("4 -ILLUMINATI", textosMerveillesX, 270);
  text("5 -Brise", textosMerveillesX, 290);
  text("6 - ~sugisarishi kaze\n     to tomo ni~)", textosMerveillesX, 310);
  text("7 -au revoir~", textosMerveillesX + 140, 210);
  text("8 - Ju te veux", textosMerveillesX + 140, 230);
  text("9 - S-CONSCIOUS", textosMerveillesX + 140, 250);
  text("10 - Le ciel", textosMerveillesX + 140, 270);
  text("11 - Gekka no Yasoukyoku", textosMerveillesX + 140, 290);
  text("12 - Bois de merveilles", textosMerveillesX + 140, 310);
  info ="En 1996, lanzaron el álbum 'Voyage ~sans retou ~' y firmaron con\n la discográfica Nippon Columbia. En marzo de 1998 lanzaron 'merveilles',\n su álbum  más exitoso";
  // unificada
  dibujarInfoBase(info, 0, info6Y, 700, 300, width/2, info6Y+60, -1, -1);
}
void dibujarPantalla7() {
  background(fondo8);
  image(gkt2, gkt2X, 30, 250, 300);
  image(gkt3, gkt3X, 30);

  info = "a pesar del éxito, a inicios de 1999, Gackt dejó la banda para\n iniciar su propia carrera solista. Años más tarde, en su autobiografía, Gackt\n explica que la ruptura se debió a tensiones por su composición de la canción\n 'Le Ciel', conflictos por la gestión del dinero, y una creciente sensación\n de aislamiento dentro de la banda.";
  // unificada
  if (estadoInfo7 != 0) {
    dibujarInfoBase(info, 0, info7Y, 700, 300, width/2, info7Y+70, -1, -1);
  }
}
void dibujarPantalla8() {
  background(fondo9);

  info = "El 21 de junio de 1999, Kami fue\n encontrado muerto en su casa\n debido a una hemorragia cerebral. La\n pérdida afectó profundamente a la banda y,\n tras un periodo de silencio, decidieron no\n reemplazar a Kami y continuar sin una\n batería oficial, utilizando músicos \nde apoyo en adelante ";
  // unificada con opacidad
  if (estadoPantalla8 != 0) {
    dibujarInfoBase(info, 140, 130, 375, 220, width/2, height/2, opacidadPantalla8, opacidadPantalla8);
    tint(255, 255, 255, opacidadPantalla8);
    image(km3, 1, 250, 230, 230);
    image(km2, 410, 200);
    noTint();
  }
}
void dibujarPantalla9() {
  background(fondo10);
  image(bara, 370, baraY, 160, 160);

  fill(255);
  textSize(25);
  textAlign(LEFT);
  text("Canciones del album:", 370, textosBaraY);
  text("1 -   Bara ni Irodorareta Akui\n         to Higeki no Makuake", 230, textosBaraY + 20);
  text("2 -Seinaru Toki Eien no Inori", 230, textosBaraY + 60);
  text("3 -Kyomu no Naka de no Yugi", 230, textosBaraY + 80);
  text("4 -Kagami no Butou Genwaku \n                     no Yoru", 230, textosBaraY + 100);
  text("5 -Mayonaka ni Kawashita Yakusoku", 230, textosBaraY + 140);
  text("6 - ~Chinurareta Kajitsu", 440, textosBaraY + 20);
  text("7 -Chikasuimyaku no Meiro", 440, textosBaraY + 40);
  text("8 -Hakai no Hate", 440, textosBaraY + 60);
  text("9 -Shiroi Hada ni Kuru Ai\n    to Kanashimi no Rondo", 440, textosBaraY + 80);
  text("10 -Saikai no Chi to Bara", 440, textosBaraY + 120);

  image(kh1, kh1X, 70, 200, 250);

  info="En 2000 incorporaron a Klaha como nuevo vocalista oficial. Con él,\n lanzaron su último álbum, 'Bara No Seidou', que mezclaba música\n clásica, gótica y heavy metal. El exito  no igualó el de la era anterior y en\n 2001 la banda anunció su disolución temporal o hiato indefinido,\n despidiéndose con el sencillo 'Garnet ~Kindan no Sono e~'";
  // unificada
  if (estadoInfo9 != 0) {
    dibujarInfoBase(info, 0, info9Y, 700, 300, width/2, info9Y+70, -1, -1);
  }
}
void dibujarPantalla10() {
  background(fondo11);

  image(mn3, 20, mn3Y, 200, 250);
  image(kz3, 210, kz3Y, 200, 250);
  image(yk3, 440, yk3Y, 190, 230);

  fill(0, 140);
  stroke(0);
  rect(0, 345, 700, 300);

  infoMiembros("Mana creó su marca \nde ropa gótica\n Moi-même-Moitié y la \nbanda Moi Dix Mois.", 100, txtMn3Y);
  infoMiembros("Közi inició una\n carrera solista y\n  formó bandas como\n Eve of Destiny y ZIZ.", 325, txtKz3Y);
  infoMiembros("Yu~Ki se mantuvo\n  apoyando los \n proyectos de Mana\n  y Közi.", 540, txtYk3Y);
}

void dibujarPantalla11() {
  background(fondo11);

  image(ts2, 10, ts2Y, 170, 230);
  image(gkt3, 210, gkt4Y, 200, 280);
  image(kh2, 430, kh2Y, 200, 280);

  fill(0, 140);
  stroke(0);
  rect(0, 345, 700, 300);

  infoMiembros("Tetsu continuó\n su carrera tras\n dejar el grupo y \npasó por varias\n bandas", 80, txtTs2Y);
  infoMiembros("Gackt se convirtió\nen un gran solista,\naunque ha expresado\n su arrepentimiento\n por haber dejado la banda", 290, txtGkt4Y);
  infoMiembros("Klaha tuvo una\nbreve carrera solista\nLuego de esto desapareció\ndel ojo público y no\n se sabe nada de él", 530, txtKh2Y);
}
void dibujarPantallaFinal() {
  background(fondofin);
  pushMatrix();
  translate(0, -110);
  dibujarTitulo("GRACIAS POR VER");
  animarTitulo();
  popMatrix();
  image(gracias, 105, 105);
  pushMatrix();
  translate(0, 120);
  dibujarBoton("REINICIAR", colorBoton);

  popMatrix();
  // Color del botón reiniciar
  if ( mouseSobreBotonReiniciar()) {
    colorBoton = color(#685871);
  } else {
    colorBoton = color(0);
  }
}
