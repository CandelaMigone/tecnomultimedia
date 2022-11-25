class Fondo {
  PImage fondo;
  int x;
  Fondo() {
    fondo= loadImage("carretera3.png");
    x =0;
  }
  void dibujar() {
    image(fondo, x, 0);
    moverFondo();
  }

  void moverFondo() {
    x = x <0 ? x : -width;
    x++;
  }
}
