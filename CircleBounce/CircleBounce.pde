int frame = 0;
PVector circleVector = new PVector(0, 0);
PVector v = new PVector(0, 0);
int sizeOfCircle = 50;
int speed = 5;
int xSpeed = 0;
int ySpeed = 0;

void setup() {
	size(640, 480);
	strokeWeight(50);
  stroke(0, 100, 255);
}



void draw() {
  background(204);
  strokeWeight(sizeOfCircle);
  checkBorders();
  move();
  point(circleVector.x , circleVector.y);  
  frame++;
}

void checkBorders() {
  if (v.x + circleVector.x >= width + speed - sizeOfCircle/2) {
    xSpeed = -speed;
  } else if (v.x + circleVector.x <= 0 - speed + sizeOfCircle/2) {
    xSpeed = speed;
  } 
  if (v.y + circleVector.y >= height + speed - sizeOfCircle/2) {
    ySpeed = -speed;
  } else if (v.y + circleVector.y <= 0 - speed + sizeOfCircle/2) {
    ySpeed = speed;
  }
}

void move() {
  v.set(xSpeed, ySpeed);
	circleVector.add(v);
}
