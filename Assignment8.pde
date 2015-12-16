int posX, posY, sizeX, sizeY;
int x = 0;
int speed = 3;

import ddf.minim.*;
AudioPlayer player;
Minim minim;//audio context

PImage lion;
PImage toucan;
PImage alligator;
PImage elephant;

Movement newMovement;

void setup() {
  size(800, 600);

    //IMAGE 1
      lion = loadImage("![lion](https://cloud.githubusercontent.com/assets/14797740/11840066/78b8d72c-a3b8-11e5-8b03-a3e450ebe298.jpg)
");
       lion.resize(800,600);
  
    //IMAGE 2
      toucan = loadImage("toucan.jpg");
      toucan.resize(800,600);
  
    //IMAGE 3
      alligator = loadImage("alligator.jpg");
      alligator.resize(800,600);
    
    //IMAGE 4
      elephant = loadImage("elephant.jpg");
      elephant.resize(800,600);

    //MOVEMENT
      posX = 100;
      posY = 100;
      sizeX = 30;
      sizeY = 30;

  newMovement = new Movement();
  
  minim = new Minim(this);
  player = minim.loadFile("circleoflife.mp3", 2048);
  player.play();
}

void draw() {
  display();
  newMovement.update();
  newMovement.display();
}

void display() {
  background(0);
}

void keyPressed() {
  newMovement.keyPressed(); 
}

void keyReleased() {
  newMovement.keyReleased(); 
}

void mouseMoved(){
  if(mouseX < width/2) //left side of screen
    if(mouseY < height/2) //top left
      background(lion);
    else //bottom left
      background(toucan);
  else  //right side of screen
    if(mouseY < height/2) //top right
       background(alligator);
    else //bottom right
       background(elephant);
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}

class Movement {
  int centerX, centerY;
  boolean keys[];    // In this array, the index corresponds with W,S,A,D.

  int xVelocity, yVelocity;

  // constructor
  Movement() {
    centerX = round(random(0, width));
    centerY = round(random(0, height));
    keys = new boolean [4];
  }

  void display() {  // creates a bug
  stroke(255);
    fill(#3FAD21);
    ellipse(centerX, centerY, 40, 90); //bug main body
   
    fill(0);
    ellipse(centerX + -15, centerY + -20, 15, 15); //eyeball left
    ellipse(centerX + 15, centerY + -20, 15, 15); //eyeball right
   
    fill(0);
    ellipse(centerX + -20, centerY + -1, 5, 20); //upper leg left
    ellipse(centerX + 20, centerY + -1, 5, 20); //upper leg right
    ellipse(centerX + -20, centerY + 25, 5, 20); //lower leg left
    ellipse(centerX + 20, centerY + 25, 5, 20); //lower leg right
  }

  void update() {
    if (keys[0]) {
      yVelocity = -5;
    }
    if (keys[1]) {
      yVelocity = 5;
    }
    if (keys[2]) {
      xVelocity = -5;
    }
    if (keys[3]) {
      xVelocity = 5;
    }
    if (!keys[2] && !keys[3]) { // if both Left and Right are released, horizontal velocity should be zero.
      xVelocity = 0;
      //println("no left or right");
    }
    if (!keys[0] && !keys[1]) { // if both Up and Down are released, vertical velocity should be zero.
      yVelocity = 0;
      //println("no left or right");
    }
    centerX += xVelocity;
    centerY += yVelocity;
  }

  void keyPressed() {
    if (key == 'w') {
      keys[0] = true;
    } 
    if (key == 's') {
      keys[1] = true;
    }
    if (key == 'a') {
      keys[2] = true;
    }
    if (key == 'd') {
      keys[3] = true;
    }
  }

  void keyReleased() { 
    println("Keyreleased " + key);
    if (key == 'w') {
      keys[0] = false;
    } 
    if (key == 's') {
      keys[1] = false;
    }
    if (key == 'a') {
      keys[2] = false;
    }
    if (key == 'd') {
      keys[3] = false;
    }
  }
}

