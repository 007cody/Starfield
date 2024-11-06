PImage img;
confetti []bob = new confetti[1000];
void setup() {
  size(800, 800);
  background(0);
  for (int i=0; i<bob.length; i++) {
    bob[i] = new confetti();
  }
  for (int i =0; i<10; i++) {
    bob[i] = new stars();
  }
  img = loadImage("yippeee.png");
}

void draw() {
  background(255);
  image(img, 330, 330, 150, 150);
  for (int i=0; i<bob.length; i++) {
    bob[i].move();
    bob[i].show();
  }
}

void mousePressed() {
  for (int i=0; i<bob.length; i++) {
    bob[i] = new confetti();
  }
  for (int i=0; i<10; i++) {
    bob[i] = new stars();
  }
}

class stars extends confetti {
  stars() {
    myX = width/2;
    myY = height/2;
    myAngle = (float)(Math.random()*2*PI);
    mySpeed = (float)(Math.random()*10+2);
    myColor = color((int)(Math.random()*255)+1, (int)(Math.random()*255)+1, (int)(Math.random()*255)+1);
  }
  void show() {
    fill(myColor);
    star(myX, myY, 20, 60, 5);
  }
}

class confetti {
  float myX, myY, myAngle, mySpeed;
  int myColor;

  confetti() {
    myX = width/2;
    myY = height/2;
    myAngle = (float)(Math.random()*2*PI);
    mySpeed = (float)(Math.random()*7+2);
    myColor = color((int)(Math.random()*255)+1, (int)(Math.random()*255)+1, (int)(Math.random()*255)+1);
  }

  void move() {
    myY = myY + mySpeed * (float)(Math.sin(myAngle));
    myX = myX + mySpeed * (float)(Math.cos(myAngle));
  }
  void show() {
    fill(myColor);
    noStroke();
    ellipse((float)myX, (float)myY, 10, 10);
  }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
