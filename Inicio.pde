class Inicio {  
  PImage inicio, instruccion;
  Inicio() {
    inicio= loadImage("inicio.png");
    instruccion= loadImage("instruccion.png");
  }

  void dibujar() {
    pushStyle();
    imageMode(CENTER);
    image(inicio, width/2, height/2); 
    textAlign(CENTER);
    textSize(50);
    text("EL MOUNSTRO CARACOL", width/2+70, height/2 - 75);
    textSize(20);
    text("Haz click para ver las instrucciones", width/2, height/2 + 130);
    popStyle();
  }
  void instrucciones() {
    pushStyle();
    imageMode(CENTER);
    image(instruccion, width/2, height/2);
    textAlign(CENTER);
    fill(255,0,0);
    text("Logra que el personaje llegue\n a su casa pasando el portal,", width/2+20, height/2 - 80);
    text("Con las teclas arriba y abajo\n esquiva los caracoles", width/2+20, height/2 + 10);
    textSize(20);
    fill(255);
    text("Haz click para comenzar", width/2+20, height/2 + 130 );
    popStyle();
  }
}
