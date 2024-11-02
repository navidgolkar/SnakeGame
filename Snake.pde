class Snake {
  float x, y, xspeed, yspeed;
  int total;
  ArrayList<PVector> tail = new ArrayList<PVector>();
  
  Snake() {
    this.x = 0;
    this.y = 0;
    this.xspeed = 1;
    this.yspeed = 0;
    total = 0;
  }
  
  void update() {
    if (tail.size() == total) {
      for (int i = 0; i < total-1; i++) {
        tail.get(i).set(tail.get(i+1));
      }
      if (total > 0) tail.get(total-1).set(x, y);
    }
    else tail.add(new PVector(x, y));
    x += xspeed*scale;
    y += yspeed*scale;
    if (x > width - scale) x = 0;
    else if (x < 0) x = width;
    if (y > height - scale) y = 0;
    else if (y < 0) y = height;
  }
  
  void show() {
    fill(255);
    for (int i = 0; i < total; i++) {
      rect(tail.get(i).x, tail.get(i).y, scale, scale);
    }
    fill(255, 255, 0);
    rect(x, y, scale, scale);
  }
  
  void dir(int x, int y) {
    if (x*xspeed + y*yspeed == 0) {
      this.xspeed = x;
      this.yspeed = y;
    }
  }
  
  boolean eat(PVector pos) {
    float d = dist(x, y, pos.x, pos.y);
    if (d < 1) {
      total++;
      return true;
    }
    else return false;
  }
  
  boolean death() {
    for (int i = 0; i < tail.size(); i++) {
      float d = dist(tail.get(i).x, tail.get(i).y, x, y);
      if (d < 1) {
        return true;
      }
    }
    return false;
  }
}
