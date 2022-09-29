class Fondo {
  PImage fondo, fondo2;
  Fondo() {
    fondo= loadImage("fondodia.jpg");
    fondo2= loadImage("fondooscuro.jpg");
  }
  void dibujar() {
    image(fondo, 0, 0, 800,600);
  }
  void fondoNoche() {
    image(fondo2, 0, 0, 1000,600);
  }
}
