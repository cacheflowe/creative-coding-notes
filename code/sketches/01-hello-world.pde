void setup()
{
  size(screen.width,screen.height);
  background(125);
  fill(255);
  noLoop();

  PFont fontA = loadFont("courier");
  textFont(fontA, 14);  
}

void draw(){
  text("This is text!",20,20);
  println("Hello ErrorLog!");
}
