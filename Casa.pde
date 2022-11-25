class Casa {
  PImage casa;
  int x, y;

  Casa() {
    y = height/2;
    x= 2500;
    casa= loadImage("casa.png");
  }
  void dibujar() {
    pushStyle ();
    imageMode(CENTER);
    image(casa, x, y);
    popStyle();
    x--;
  }
  void reiniciar() {
    x = 2500;
  }
}
