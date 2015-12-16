//CLOUDY WITH A CHANCE OF MEATBALLS
int posX, posY, sizeX, sizeY;
int x = 0;
int speed = 3;

void setup() {
  size(800, 600);
  background(26, 216, 212);
  posX = 100;
  posY = 100;
  sizeX = 30;
  sizeY = 30;
  frameRate(20);
}

void draw() {
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
  background(26, 216, 212);

  //sun
  fill(234, 255, 13);
  ellipse(700, 100, 100, 100);

  //cloud
  fill(255);
  noStroke();
  ellipse(x, 100, 200, 60);

  //ground
  fill(0, 200, 0);
  noStroke();
  rect(0, 500, 800, 300);

  //plate
  ellipseMode(CENTER);
  fill(200);
  stroke(0);
  ellipse(mouseX, mouseY, 100, 40);
  noFill();
  stroke(0);
  ellipse(mouseX, mouseY, 50, 20);

  //meatballs move
  posX = round(random(width));
  posY = round(random(height));

  //meatballs display
  fill(255, 0, 0);
  noStroke();
  ellipse(posX, posY, sizeX, sizeY);
}

void mousePressed() {
  background(252, 165, 3);

  //sun.2
  fill(0, 255, 0);
  ellipse(700, 100, 100, 100);

  //cloud.2
  fill(227, 3, 252);
  noStroke();
  ellipse(x, 100, 200, 60);

  //ground.2
  fill(0, 0, 255);
  noStroke();
  rect(0, 500, 800, 300);
}
