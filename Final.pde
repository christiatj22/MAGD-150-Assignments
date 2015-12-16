class Timer {
  float startTime, stopTime; // two variables to keep track of the time that the timer starts and length of time for the timer.
  boolean started = false;  // keep track of the timer, where it's been started on not. 

  //constructor. This sets the amount of the time to lapse before it sets the boolean below to true. 
  // an example use would be 
  // Timer myTimer = new Timer(2000);    <---- that sets the timer to 2 seconds.
  Timer(float _stopTime) {
    stopTime = _stopTime;
  }

  // you can call this anyway (inside the Setup which would start almost immediately or inside the draw loop, which would make 
  // it restart ever cycle.
  void timerStart() {
    startTime = millis();
    started = true;
  }

  void stopTimer() {
    started = false;
    println("time stopped");
  }

  boolean isFinished() {
    float passedTime = millis() - startTime;
    if ((passedTime > stopTime) && (started)) {
      return true;
    } else {
      return false;
    }
  }
}

class Movement {
  int centerX, centerY, offset1, offset2, offsetX1, offsetX2;
  boolean keys[];    // In this array, the index corresponds with W,S,A,D.

  int xVelocity, yVelocity;

  // constructor
  Movement() {
    centerX = round(random(0, width));
    centerY = round(random(0, height));
    offset1 = -20;
    offset2 = +20;
    offsetX1 = -20;
    offsetX2 = + 20;
    keys = new boolean [4];
  }

  void display() {  // creates a spaceship. 
    fill(#0948E3);
    ellipse(centerX, centerY, 40, 80); //ship main body
    fill(#EAEAEA);
    ellipse(centerX, centerY + offset1, 20, 20); // cockpit
    fill(#FFEB0D);
    rect(centerX + offsetX1, centerY + offset2, 40, 25); //engine
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

  void keyReleased() { // the 
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

class CircleEnemy {
  int centerX, centerY, size;

  // constructor
  CircleEnemy() {
    centerX = round(random(width));
    centerY = 10;
    size = round(random(50, 50));
  }

  // update position
  void update() {
    centerX = round(random(-10, 10)) + centerX;
    centerY = centerY + 1;
  }

  // display the enemy after the position is updated
  void display() {
    fill(#8112C6);
    ellipse(centerX, centerY, size, size);
  }
}

int posX, posY, sizeX, sizeY;
Movement newMovement;
CircleEnemy[] enemies;                         
Timer myTimer;                                  
int numberEnemies; 
int stateCount = 0;
int state = 0;

void setup() {
  size(900, 600);
  background(0);
  posX = 100;
  posY = 100;
  sizeX = 3;
  sizeY = 5;
  frameRate(20);
  newMovement = new Movement();
 enemies = new CircleEnemy[10];              // create the array with 10 slots
  for(int x = 0; x < enemies.length-1; x++){    // create 10 instances of CircleEnemy to the array
    enemies[x] = new CircleEnemy();
  }
  myTimer = new Timer(3000);     // sets timer to 3 seconds
  myTimer.timerStart();
}

void draw() {
  randomizePos();
  displayEllipse();
  newMovement.update();
  newMovement.display();

     if (state == 0) {
    // put all the code you want for state 0 here.
    background(0);
  }
  if (state == 1) {
    // put all the code you want for state 0 here.
    background(255, 0, 0);
  }
 
   if (myTimer.isFinished()){
      textSize(100);
      text("DOOMSDAY", 180, 300);
     }
 if(myTimer.isFinished()){                      // whenever the timer goes off, add other enemy
    numberEnemies++;                             // increase the number of enemies
    myTimer.timerStart(); // restart the timer      // restart the timer everytime the timer goes off
  }
  
  if (numberEnemies == enemies.length-1){         // incase we run out of enemies, restart the count
    numberEnemies = 0;
  }
 
  //this for loops handles the number of enemies. 
  for(int newEnemies = numberEnemies; newEnemies > 0 ; newEnemies --){    //  keep track of all the previous
    enemies[newEnemies].update();                                         //  enemies 'spawned'.
    enemies[newEnemies].display();
  }
}

//stars
void randomizePos() {
  posX = round(random(width));
  posY = round(random(height));
}

void displayEllipse() {
  fill(255);
  ellipse(posX, posY, sizeX, sizeY);
}

//movement for ship
void keyPressed(){
  newMovement.keyPressed(); 
}

void keyReleased(){
  newMovement.keyReleased(); 
}

void mousePressed(){
  //everytime mouse is pressed, the states should increment 0 > 1 > 2 > 0 > 1 > 2, etc
  stateCount++;
  state = stateCount % 3;
}
