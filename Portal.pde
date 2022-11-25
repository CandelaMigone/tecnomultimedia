class Portal {
  PImage portal1;
  int x, y;
  Portal() {
    portal1= loadImage("portal.png");
    y = height/2+15;
    x= 2500;
  }
  void dibujar() {
    pushStyle ();
    imageMode(CENTER);
    image(portal1, x, y);
    popStyle();
    x--;
  }

  void reiniciar() {
    x = 2500;
  }
}
