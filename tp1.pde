//Migone, Maria Candela
//Tp1 animación con codigo
PImage titulo;
PImage credito5;
PImage credito2;
PImage credito3;
PImage credito4;
PImage peakyblinders;
PFont fuentenueva;
int tam;

void setup(){
  size(600,600);
  fuentenueva= createFont("Leander.ttf",32);
  credito2= loadImage("credito2.jpg");
  credito3=loadImage("credito3.jpg");
  credito4=loadImage("credito4.jpg");
  credito5=loadImage("credito5.jpg");
  titulo= loadImage("titulo.png");
  peakyblinders= loadImage("peakyblinders.jpg");
tam=1;
}
  void draw(){
background(0);
textFont(fuentenueva);{
    if (frameCount >=0 && frameCount <550) {
  image(titulo,height-tam,80,450,450);
tam ++;}
{
if(frameCount>550 && frameCount<800){
 image(credito2,0,0,600,600);
  text("CILLIAM MURPHY\nSAM NEILL", 230,500);
}
{
  if(frameCount>800&& frameCount<1200){
 image(credito3,0,0,600,700);
  text("AND HELEN McCRORY\nPAUL ANDERSON\nANABELLE WAILLIS", 50,490); }
{
  if (frameCount>1200 && frameCount<1600){
 image(credito4,0,0,700,600);
  text("  PRODUCED\nBY KATIE SWINDEN", 50,500); 
}
if(frameCount>1600 && frameCount<2000){
 image(credito5,0,0,700,600);
  text("  CREATED BY\nSTEVEN KNIGHT", 60,500); }
  {
  if(frameCount>2000 && frameCount<2400){
 image(peakyblinders,0,0,700,600);
  text("  DIRECTED BY\nOTTO BATHURST", 150,500); }
   {
  if(frameCount>2400){
    fill(190,100,18);
 rect(200,200,200,200);
 fill(255);
  text(" CLICK\n  PARA\nVOLVER\n A VER",225,250);
}}}}}}}}
void mouseClicked(){
  if(mouseX>200 && mouseX <200+200 && mouseY>200 && mouseY<200+200 && frameCount>2400);
  frameCount= 0;
  tam =0;
}
