class Personaje {
  int personajex, personajey;
  boolean caminando, fondo;
  PImage [] personajecaminata= new PImage [9];
  PImage fondo2;
  int mover;

  Personaje() {
    personajex = 30;
    personajey = 320;
    caminando = false;
    fondo= false;
    personajecaminata = new PImage [9];
    fondo2= loadImage("fondooscuro.jpg");
    for (int i=0; i<9; i++) {
      personajecaminata[i] = loadImage ("caminata" + i + ".png");
    }
  }
  void dibujar() {
    image(personajecaminata[mover], personajex, personajey);
  }

  void mover(int apretar) {
    if (apretar == RIGHT) {
      personajex ++;
      caminando = true;
      if (frameCount%10==0) {
        mover+=6;
        mover = mover%9;
      }
    } 
    if (apretar == LEFT) {
      personajex -=4;
      caminando = true;
    }
  }

  void colision(Fondo dia) {
    if (personajex >= 570){
      fondo= true;    
    }
      if (fondo== true){
   dia.fondoNoche();
    image(personajecaminata[mover], personajex, personajey);
        
    }
  }
}
