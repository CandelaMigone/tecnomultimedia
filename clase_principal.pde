class Principal {
  Fondo dia;
  Personaje p;
  Puerta portal;

  Principal() {
    dia = new Fondo();
    p = new Personaje();
    portal = new Puerta();
  }
  void dibujartodo() {
    dia.dibujar();
    portal.dibujar();
    p.dibujar();
    p.colision(dia);
  }

  void apretar() {
    if (keyPressed) {
      p.mover(keyCode);
    }
  }
}
