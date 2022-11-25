class Personaje {
  float x, y;
  boolean caminando;
  PImage [] personajecaminata= new PImage [9];
  PImage fondo2;
  int mover;
  int ancho;
  int alto;


  Personaje() {
    x = width/2;
    y = height/2;
    ancho = 70;
    alto = 136;
    caminando = false;
    personajecaminata = new PImage [9];
    for (int i=0; i<9; i++) {
      personajecaminata[i] = loadImage ("caminata" + i + ".png");
    }
  }

  void dibujar() {
    pushStyle();
    imageMode(CENTER);
    mover();
    image(personajecaminata[mover], x, y, ancho, alto);
    popStyle();
  }

  void mover() {
    if (frameCount%10==0) {
      mover+=6;
      mover = mover%9;
    }
  }


  void mover2(int apretar) {
    if (apretar == DOWN) {
      y +=6;
      caminando = true;
      }
    if (apretar == UP) {
      y -=6;
      caminando = true;
    }
  }
  void limitar() {
    y = constrain(y, 115, height-140);
  }
}
