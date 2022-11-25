//Comision 1
// Migone, Maria Candela
//TP5 
//https://www.youtube.com/watch?v=kPitnuPnhc0

import processing.sound.*;
SoundFile miSonido;

Principal todo;
void setup() {
  size(800, 485);
  todo = new Principal();
  miSonido = new SoundFile(this, "sonido.mp3");
  
}
void draw() {
  todo.estados();
}
void keyPressed() {
  todo.apretar();
  todo.volverMenu();
  todo.irCreditos();
}

void mouseClicked() {
  todo.apretarlo();
}
