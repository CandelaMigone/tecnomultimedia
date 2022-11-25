class Caracol {

  PImage image;
  float x, y, w, h ;
  boolean damage;


  Caracol (int _y) {

    image = loadImage ("caracol.png");
    y = _y;
    w = 60;
    h = 50;
    x = random(width, width+1000);
  }


  void dibujar() {
    pushStyle();
    imageMode(CENTER);
    image(image, x, y, w, h);
    popStyle();
  }

  void mover() {  
    x--;
  }

  void aumentarVelocidad() {
    x-=2;
  }

  void volver() {
    if (x < 0) {    
      x =  random(width, width+800);
    }
  }
  void reiniciar() {
    x =  random(width, width+800);
  }
}
