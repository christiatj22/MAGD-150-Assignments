void setup() {
  //sea
  size(800, 600);
  background(#00FCEE);
}

void draw() {
  //yellow body
  fill(#F6FF00);
  rectMode(CENTER);
  rect(350, 300, 300, 320);

  //holes
  fill(#A5A71B);
  ellipse(250, 200, 20, 30);
  fill(#A5A71B);
  ellipse(235, 240, 10, 30);
  fill(#A5A71B);
  ellipse(455, 400, 20, 40);

  //outer eyes
  //left
  fill(255);
  ellipse(350, 250, 100, 100);
  //right
  fill(255);
  ellipse(450, 250, 100, 100);

  //inner eyes
  //left
  fill(#00B7FC);
  ellipse(370, 250, 50, 50);
  //right
  fill(#00B7FC);
  ellipse(470, 250, 50, 50);

  //eyebrows
  //left
  fill(0);
  line(300, 185, 380, 180);
  //right
  fill(0);
  line(400, 180, 480, 185);

  //freckles
  strokeWeight(2);
  fill(0);
  point(250, 300);
  fill(0);
  point(260, 310);
  fill(0);
  point(240, 310);

  //moving mouth
  fill(#FC003F);
  arc(mouseX, mouseY, 110, 110, 0, PI+QUARTER_PI, CHORD);

  //nose
  fill(#F6FF00);
  arc(400, 330, 15, 80, 0, PI+QUARTER_PI, OPEN);
}
