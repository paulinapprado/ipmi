//pestaña con animaciones de la pantalla 8
void iniciarAnimacionPantalla8() {
  estadoPantalla8 = 1;
  tiempoInicioPantalla8 = millis();
  opacidadPantalla8 = 0;           // empieza transparente
}

void actualizarAnimacionPantalla8() {
  int duracionEntrada = 2000;      // 2 segundos para aparecer
  int duracionVisible = 10000;      // 4 segundos visible
  int duracionSalida  = 2000;      // 2 segundos para desaparecer

  float transcurrido = millis() - tiempoInicioPantalla8;
  float progreso;

  if (estadoPantalla8 == 1) {      // Fade in
    progreso = transcurrido / duracionEntrada;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    opacidadPantalla8 = 0 + progreso * 255;    // 0 a 255

    if (progreso >= 1) {
      estadoPantalla8 = 2;
      tiempoInicioPantalla8 = millis();
      opacidadPantalla8 = 255;
    }
  } else if (estadoPantalla8 == 2) {  // Visible
    if (transcurrido > duracionVisible) {
      estadoPantalla8 = 3;
      tiempoInicioPantalla8 = millis();
    }
  } else if (estadoPantalla8 == 3) {  // Fade out
    progreso =transcurrido / duracionSalida;
    if (progreso > 1) progreso = 1;
    if (progreso < 0) progreso = 0;

    opacidadPantalla8 = 255 - progreso * 255;  // 255a 0

    if (progreso >= 1) {
      estadoPantalla8 = 0;
      opacidadPantalla8 = 0;
    }
  }
}
