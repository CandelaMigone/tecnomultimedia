class Principal {

  Personaje p;
  Inicio inicio;
  Fondo dia;
  Portal portal;
  Casa casa;
  Caracol [] caracoles;
  int cantCaracoles;
  int estado;
  String nombreDelEstado;
  PFont fuente;
  PImage ganaste, perdiste, instruccion, creditos;
  int puntaje;
  int puntaje2;


  Principal() {
    casa = new Casa();
    inicio = new Inicio();
    estado = 0;
    dia = new Fondo();
    p = new Personaje();
    portal = new Portal();
    cantCaracoles = 5;
    caracoles = new Caracol [cantCaracoles];
    for (int i=0; i < cantCaracoles; i++) {
      caracoles[i] = new Caracol((i*50)+200);
    }

    puntaje = 5;
    puntaje2 = 5;
    perdiste = loadImage("perdiste.png");
    ganaste = loadImage("ganaste.png");
    fuente = createFont("Galpon-Black.ttf", 30);
    instruccion= loadImage("instruccion.png");
    creditos=loadImage("creditos.png");
  }


  void estados() {
    textFont (fuente);
    if (estado == 0) {
      inicio.dibujar();
    } else if (estado==1) {
      inicio.instrucciones();
    } else if (estado == 2) {
      nivel1();
    } else if (estado == 3) {
      nivel2();
    } else if (estado == 4) {
      perdiste();
    } else if (estado == 5) {
      ganaste();
    } else if (estado==6) {
      creditos();
    }
  }


  void nivel1() {
    p.limitar();
    dia.dibujar();
    dibujarPuntaje();
    for (int i=0; i < cantCaracoles; i++) {
      caracoles[i].dibujar();
      caracoles[i].mover();
      caracoles[i].volver();
    }
    portal.dibujar();
    p.dibujar();
    hayObstaculo(p, caracoles);
    llegoAlPortal (p, portal);
    Contador();
    textSize(40);
    fill(255);
    text("Nivel 1", 120, 70);
  }


  void nivel2() {
    p.limitar();
    dia.dibujar();
    dibujarPuntajeNivel2();
    Contador ();

    for (int i=0; i < cantCaracoles; i++) {
      caracoles[i].dibujar();
      caracoles[i].mover();
      caracoles[i].aumentarVelocidad();
      hayObstaculoNivel2(p, caracoles);
      caracoles[i].volver();
    }
    casa.dibujar();
    p.dibujar();
    llegoAlaCasa (p, casa);
    textSize(40);
    fill(255);
    text("Nivel 2", 120, 70);
  }




  void apretar() {
    if (keyPressed) {
      p.mover2(keyCode);
    }
  }


  void dibujarPuntaje() {
    pushStyle();
    fill(255);
    textFont(fuente);
    textSize(40);
    text("Vidas:", 560, 70);
    text(puntaje, 670, 70);
    popStyle();
  }

  void dibujarPuntajeNivel2() {
    pushStyle();
    fill(255);
    textFont(fuente);
    textSize(40);
    text("Vidas:", 560, 70);
    text(puntaje2, 670, 70);
    popStyle();
  }

  void hayObstaculo (Personaje personaje, Caracol [] caracoles) {
    for (int i = 0; i < caracoles.length; i++) {
      if ((dist (personaje.x, personaje.y, caracoles[i].x, caracoles[i].y ) < 60)) {
        caracoles[i].x = random(width+50, width+1800);
        puntaje--;
        miSonido.play();

      }
    }
  }
   void hayObstaculoNivel2 (Personaje personaje, Caracol [] caracoles) {
    for (int i = 0; i < caracoles.length; i++) {
      if ((dist (personaje.x, personaje.y, caracoles[i].x, caracoles[i].y ) < 60)) {
        caracoles[i].x = random(width+50, width+1800);
        puntaje2--;
        miSonido.play();
      }
    }
  }

  void llegoAlPortal (Personaje personaje, Portal portal) {
    if ((dist (personaje.x, personaje.y, portal.x, portal.y ) < 150)) {
      for (int i=0; i < cantCaracoles; i++) {
        caracoles[i].reiniciar();
        estado = 3;
      }
    }
  }
  void llegoAlaCasa (Personaje personaje, Casa casa) {
    if ((dist (personaje.x, personaje.y, casa.x, casa.y ) < 150)) {
      estado = 5;
    }
  }
  void perdiste() {
    pushStyle();
    imageMode(CENTER);
    image(perdiste, width/2, height/2);
    fill(255);
    textSize(150);
    text("PERDISTE", 100, 180);
    textSize(25);
    text("CLICK PARA VOLVER A JUGAR", 100, 300);
    textSize(18);
    text("ENTER PARA VOLVER A MENU", 100, 330);
    text("TECLA C PARA VER CREDITOS", 100, 360);
    popStyle();
  }
  void ganaste() {
    pushStyle();
    imageMode(CENTER);
    image(ganaste, width/2, height/2);
    fill(22, 178, 30);
    textSize(150);
    text("GANASTE", 100, 150);
    textSize(25);
    text("CLICK PARA VOLVER A JUGAR", 90, 300);
    textSize(18);
    text("ENTER PARA VOLVER A MENU", 90, 330);
    text("TECLA C PARA VER CREDITOS", 90, 360);
    popStyle();
  }
  void creditos() {
    pushStyle();
    imageMode(CENTER);
    image(creditos, width/2, height/2);
    textAlign(CENTER);
    text("MIGONE, MARIA CANDELA", width/2, height/2-100);
    text("TECNOLOGIA MULTIMEDIAL 1", width/2, height/2-20);
    text("FACULTAD DE ARTES, 2022", width/2, height/2+50);
    textSize(20);
    text("ENTER PARA VOLVER AL MENÚ", width/2, height/2+120);
    popStyle();
  }


  void apretarlo() {
    if (estado == 0) {
      estado = 1;
    } else if (estado == 1) {
      estado=2;
      puntaje= 5;
      puntaje2=5;
      casa.reiniciar();
      portal.reiniciar();
      for (int i=0; i < cantCaracoles; i++) {
        caracoles[i].dibujar();
      }
    } else if (estado ==4) {
      estado = 2;
      puntaje= 5;
      puntaje2=5;
      casa.reiniciar();
      portal.reiniciar();
      for (int i=0; i < cantCaracoles; i++) {
        caracoles[i].reiniciar();
      }
    } else if (estado ==5) {
      estado = 2;
      puntaje= 5;
      puntaje2=5;
      casa.reiniciar();
      portal.reiniciar();
      for (int i=0; i < cantCaracoles; i++) {
        caracoles[i].reiniciar();
      }
    }
  }

  void Contador () {
    if (puntaje == 0) {
      estado = 4;
    } 
    if (puntaje2 == 0) {
      estado = 4;
    }
  }
  void volverMenu() {
    if (estado ==4 && key==ENTER) {
      estado=0;
      puntaje= 5;
      puntaje2=5;
      casa.reiniciar();
      portal.reiniciar();
      for (int i=0; i < cantCaracoles; i++) {
        caracoles[i].reiniciar();
      }
    } else if (estado ==5 && key==ENTER) {
      estado=0;
      puntaje= 5;
      puntaje2=5;
      casa.reiniciar();
      portal.reiniciar();
      for (int i=0; i < cantCaracoles; i++) {
        caracoles[i].reiniciar();
      }
    } else if (estado ==6 && key==ENTER) {
      estado=0;
      puntaje= 5;
      puntaje2=5;
      casa.reiniciar();
      portal.reiniciar();
      for (int i=0; i < cantCaracoles; i++) {
        caracoles[i].reiniciar();
      }
    }
  }


  void irCreditos() {
    if (estado==4 && key=='C' || key=='c') {
      estado=6;
    } else if (estado==5 && key=='c' || key=='C') {
      estado=6;
    }
  }
}
