Snake s = new Snake();
float scale = 10;
boolean replay = false;
boolean live = true;

PVector food = new PVector();
void setup() {
  size(400, 400);
  PickLocation();
}

void draw() {
  background(50);
  frameRate(30);
  if (live) {
    fill(255, 0, 255);
    rect(food.x, food.y, scale, scale);
    if (s.eat(food)) PickLocation();
    if (s.death()) live = false;
    s.update();
    s.show();
  }
  else if (replay) {
    replay = false;
    live = true;
    s = new Snake();
  }
  else {
    String txt = "GAME OVER!";
    textSize(width/10);
    textAlign(CENTER);
    text(txt, width/2, height/2);
    txt = "score: " + s.tail.size() + "\npress R to play again";
    textSize(width/20);
    text(txt, width/2, height/2 + width/10);
  }
}

void keyPressed() {
  if (keyCode == UP) s.dir(0, -1);
  else if (keyCode == DOWN) s.dir(0, 1);
  else if (keyCode == LEFT) s.dir(-1, 0);
  else if (keyCode == RIGHT) s.dir(1, 0);
  if (key == 'r' || key == 'R') replay = true;
}

void PickLocation() {
  int cols = floor(height/scale);
  int rows = floor(width/scale);
  food.set(floor(random(cols)), floor(random(rows)));
  food.mult(scale);
}
