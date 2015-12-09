int posX, posY, sizeX, sizeY;
int x = 0;
int speed = 5;

void setup() {
  size(800, 600);
  background(0);
  posX = 100;
  posY = 100;
  sizeX = 3;
  sizeY = 5;
  frameRate(20);
  //TEXT
  textSize(25);
  textMode(CENTER);
  text("ALIEN INVASION", 40, 40);
}

void draw() {
  //spaceship
  fill(55);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 100, 20);

  randomizePos();
  displayEllipse();
  move();
  bounce();
  display();
}
void move() {
  x = x + speed;
}

void bounce() {  
  if ((x>width)||(x<0)) {
    speed = speed * -1;
  }
}
void display() {
  //Sun
  fill(250, 238, 8);
  strokeWeight(10);
  stroke(252, 140, 3);
  ellipse(400, 300, 200, 200);  

  //Moon/Eclipse
  fill(0);
  stroke(0);
  ellipse(x, 300, 100, 100);
}

//stars
void randomizePos() {
  posX = round(random(width));
  posY = round(random(height));
}

void displayEllipse() {
  fill(250);
  ellipse(posX, posY, sizeX, sizeY);
}
