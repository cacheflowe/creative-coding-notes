Blocks[] blocks;

void setup() {
  size(screen.width,screen.height);
  frameRate(40);
  background(0);
  rectMode(CENTER);

  int numBlocks = 20;
  blocks = new Blocks[numBlocks];
  for(int i=0; i < numBlocks; i++) {
    blocks[i] = new Block();
  }
}

void draw(){
  fill(random(0,255));
  for(int i=0; i < blocks.length; i++) {
    blocks[i].update();
  }
}

class Block {
  int size;
  int x;
  int y;
  int color1;
  int speedX;
  int speedY;
  int gravity = 0.03;
  int drag = 0.03;

  public Block() {
    size = random(5,40);
    x = width/2;
    y = height/2;
    color1 = color(random(30,255),random(30,255),random(30,255));
    speedX = random(-3,3);
    speedY = random(-6,0);
  }

  void update() {
    x -= drag;
    speedY += gravity;

    x += speedX;
    y += speedY;
    if(y > height) {
      speedY *= -0.8;
      y += speedY;
    }

    fill(color1);
    rect(x, y, size, size);
  }
}

