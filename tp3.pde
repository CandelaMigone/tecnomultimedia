//Migone, Maria Candela
//Comision 1
//TP3 Juego interactivo libre
//https://www.youtube.com/watch?v=u3f-3U2Vyks
int c = 10;
PImage galleta;
int estado;
PFont fuente;
PImage elmo;
PImage elmo2;
PImage elmoganaste;
PImage elmoperdiste;
PImage elmoinicio;
float mx;
float [] posicionesX = new float [c];
float [] posicionesY = new float [c];
int puntosganados;
void setup() {
  size(500, 500);
  fuente= createFont("fuente.otf", 30);
  textFont(fuente);
  elmo2 = loadImage("elmo2.png");
  elmo = loadImage("elmo.png");
  galleta = loadImage("galleta0.png");
  elmoganaste = loadImage("elmoganaste.png");
  elmoperdiste = loadImage("elmoperdiste.png");
  elmoinicio= loadImage("elmoinicio.png");

  for (int i = 0; i < c; i++  ) {
    posicionesX[i] = random(0, width-100);
  }
  for (int i = 0; i < c; i++  ) {
    posicionesY[i] = random(-600, 0);
  }
}
void draw() {
  mx = constrain(mouseX, 0, width-100);
  estados();
} 
void mousePressed() {
  iniciar();
}
void keyPressed() {
  reiniciar();
}
void estados() {
  if ( estado==0  ) {
    background(255, 130, 33);
    fill(0);
    textSize(35);
    text("EL JUEGO DE LA GALLETA", 46, 120);
    textSize(20);
    fill(0);
    rect(140, 380, 220, 50);
    fill(255);
    text("CLICK PARA JUGAR", 155, 410);
    image(elmoinicio, 150, 150, 200, 200);
  } else if (estado==1) {
    background(255, 130, 33);
    fill(57, 169, 227);
    rect(20, 75, 470, 160);
    fill(255);
    textSize(20);
    text("Cada vez que elmo este cerca de\nla galleta, sumara puntos para ganar", 30, 100);
    text("Debe juntar 20 puntos para ganar", 30, 160);
    text("Cada vez que se le escape una galleta\nperdera", 30, 200);
    textSize(40);
    fill(0);
    text("Ayudalo a ganar!", 60, 320);
    textSize(50);
    fill(255);
    rect(140, 380, 220, 50);
    fill(0);
    text("INICIAR", 155, 424);
    image(elmo2, 0, 350, 150, 150);
  } else if (estado==2) {
    background(255, 130, 33);
    for (int i = 0; i < c; i++) {
      image(galleta, posicionesX[i], posicionesY[i], 80, 80);
      posicionesY[i]++;
      image(elmo, mx, 400, 100, 100);
      if (dist(posicionesX[i], posicionesY[i], mx, 400)   < 50 ) {
        if (frameCount%6 == 0) {
          puntosganados++;
          posicionesY[i] = -100;
        }
      }

      if (posicionesY[i]>height) {
        estado = 4;
      }
    }


    if (puntosganados>=20) {
      estado=3;
    }
    fill(255);
    textSize(20);
    text("puntos:", 20, 30);
    text(puntosganados, 50, 50);
  }
  if ( estado==3) {
    background(24, 250, 0);
    fill(255);
    textSize(70);
    text("GANASTE", 85, 150);
    fill(0);
    textSize(30);
    text("     PRESIONA ENTER\nPARA VOLVER A JUGAR", 86, 250);    
    image(elmoganaste, 0, 280, 250, 250);
  } else if (estado==4) {
    background(220, 30, 0);
    fill(255);
    textSize(70);
    text("PERDISTE", 85, 150);
    fill(0);
    textSize(25);
    text("     PRESIONA ENTER\nPARA VOLVER A JUGAR", 94, 250);
    image(elmoperdiste, 0, 320, 250, 250);
  }
}


boolean jugar(int x, int y, int ancho, int alto) {
  boolean click= mouseX>x && mouseX<x+ancho && mouseY>y && mouseY<y+alto;
  return click;
}
boolean iniciar(int x, int y, int ancho, int alto) {
  boolean iniciando= mouseX>x && mouseX<x+ancho && mouseY>y && mouseY<y+alto;
  return iniciando;
}
void iniciar() {
  if ( estado==0 && jugar(145, 380, 220, 50) ) {
    estado=1;
  } else if (estado==1 && iniciar(140, 380, 220, 50)) {
    estado=2;
  }
}

void reiniciar() {
  if ( key==ENTER ) {
    estado=0;
    puntosganados=0;
    for (int i = 0; i < c; i++  ) {
      posicionesX[i] = random(0, width-100);
    }
    for (int i = 0; i < c; i++  ) {
      posicionesY[i] = random(-600, 0);
    }
  }
}
