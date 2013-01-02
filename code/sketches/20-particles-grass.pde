

// my stuff
float bgGreen = .2;
int numBlades = 10;
Grass[] blades;
//---------

void setup () {
  size(600,600);
  frameRate(60);
  colorMode(RGB, 1.0, 1.0, 1.0);
  smooth();
  strokeWeight(0.5);
  background(0,bgGreen,0);
  
  // draw graphics
  blades = new Grass[numBlades];
  for(int i = 0; i < numBlades; i++) {
    blades[i] = new Grass();   
  }

}

void draw() {
  for(int i = 0; i < numBlades; i++) {
    blades[i].update();   
  }
}

// A Cell object
class Grass {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x;
  float y;
  float curLength;
  float lengthVelocity;
  float waveIncrementer;
  float waveIncrementerAmount;
  float curSize;
  float sizeVelocity;
  float curRed;
  float redVelocity;
  float curGreen;
  float greenVelocity;
  float curBlue;
  float blueVelocity;
  float bgGreen = .2;

  // Cell Constructor
  Grass() {
    reset();
  } 
  
  // Oscillation means increase angle
  void update() {
    // use some perlin noise with the sin for some natural waviness
    float curX = x + noise(waveIncrementer*.1) * 20 + sin(waveIncrementer) * 10;
    y -= lengthVelocity;
    
    //draw the shape
    stroke(0,bgGreen,0,70);
    fill(curRed,curGreen,curBlue);
    ellipse(curX,y,curSize,curSize);
    
    // increment properties
    curLength -= lengthVelocity;
    curSize -= sizeVelocity;
    if( curGreen > bgGreen ) curGreen -= greenVelocity;
    curRed -= redVelocity;
    curBlue -= blueVelocity;
    waveIncrementer += waveIncrementerAmount;
    
    // start next blade
    if( curSize <= 0 )
    {
    reset();
    }
  }
  
  void reset(){
    // place grass at bottom
    x = random(0,width);
    y = height + 10;
    curLength = 0;
    lengthVelocity = random(1,3);
    curSize = 20;
    sizeVelocity = random(.1, .2);
    waveIncrementer = random( 0, 2*PI );
    waveIncrementerAmount = random( .002, .05 );
    // 
    curGreen = random(.5, 1);
    greenVelocity = random( .0001, .005 );
    curRed = random(0, .25);
    redVelocity = .5 * greenVelocity;
    curBlue = curRed;
    blueVelocity = redVelocity;
  }
}

void mouseDragged() {
  mousePressed(); 
}

void mousePressed() {
  
}

