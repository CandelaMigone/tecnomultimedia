//Maria Candela Migone
//Comisión 1
//Tp2 ilusión optica interactiva
//https://youtu.be/reeEjBz-uV8
int can =40;
void setup() {
  size(600, 600);
}
void draw() {
  elipses();
  botones();
}

void elipses () {
  for ( int i=2300; i>50; i-=can) {
    strokeWeight(2);
    stroke(0);
    ellipse(300, 300, i, i);
    if (i%7==0) {
      fill(40, 0, 150);
    } else {
      fill(255, 0, 0);
    }
  }
}
void botones() { 
  fill(255, 0, 255);
  stroke(0, 40, 40);
  circle(300, 300, 50);
  rect(40, 550, 60, 30);
  fill(0);
  text("CLICK\nAQUÍ", 284, 300);
  text("REINICIA", 45, 570);
}

void mouseClicked() {
  clickYresetear();
}
void clickYresetear() {
  float d;
  float r;
  d= dist(mouseX, mouseY, 300, 300);
  r=50/2;

  if (d<r) {
    can--;
  }
  if (clickresetear(40, 550, 60, 30)) {
    can=40;
  }
}
boolean clickresetear(int x, int y, int ancho, int alto) {
  boolean sobreboton = mouseX>x && mouseX<x+ancho && mouseY>y && mouseY<y+alto;
  return sobreboton;
}
