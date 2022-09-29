//Comision 1
// Migone, Maria Candela
//TP4 Programando con objetos
//https://www.youtube.com/watch?v=ZxW18PDUHjw
Principal todo;
void setup(){
  size(800,600);
  todo = new Principal();
}
void draw(){
  background(333,0,0);
  todo.dibujartodo();
}
void keyPressed(){
  todo.apretar();
}
