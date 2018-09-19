int frame = 0;
PVector circleVector = new PVector(0, 0);
PVector v = new PVector(0, 0);
int sizeOfCircle = 50;
float xSpeed = random(-5, 5);
float ySpeed = random(-5, 5);

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
  if (v.x + circleVector.x >= width + xSpeed - sizeOfCircle/2) {
    xSpeed *= -1;
  } else if (v.x + circleVector.x <= 0 + xSpeed + sizeOfCircle/2) {
    xSpeed = abs(xSpeed);
  } 
  if (v.y + circleVector.y >= height + ySpeed - sizeOfCircle/2) {
    ySpeed *= -1;
  } else if (v.y + circleVector.y <= 0 + ySpeed + sizeOfCircle/2) {
    ySpeed = abs(ySpeed);
  }
}

void move() {
  v.set(xSpeed, ySpeed);
	circleVector.add(v);
}
