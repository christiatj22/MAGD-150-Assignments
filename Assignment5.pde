int x = 0;
int speed = 4;

void setup(){
  size(800,600);
  background(#00FFFD);
}

void draw(){
  move();
  bounce();
  display();
}

void move(){
   x = x + speed;
}

void bounce(){
  if ((x>width)||(x<0)) {
    speed = speed * -1;
  }
}

void display(){
  background(#00FFFD);
//tennis ball
fill(#8FFF00);
ellipse(x,300,90,90);

fill(255);
rectMode(CENTER);
rect(400,500,10,200);
}
