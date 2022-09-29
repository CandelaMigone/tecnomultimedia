class Puerta {
  PImage portal;
  Puerta() {
    portal= loadImage("portal.png");
  }
  void dibujar() {
    image(portal, 540, 320);
  }
}
