int frame = 0;
PVector circleVector;
PVector weirdBall = new PVector(0, 0);
PVector v = new PVector(0, 0);
int sizeOfCircle = 50;
float xSpeed = 0;
float ySpeed = 100;
float a = 100;
float tpf;
float time = 0;

void setup() {
  size(640, 480);
  strokeWeight(sizeOfCircle);
  stroke(0, 100, 255);
  circleVector = new PVector(width/2, 0);
  frameRate(30);
}

void draw() {
  int currentTime = millis();
  tpf = (currentTime - time) * 0.001f;
  background(204);
  checkBorders();
  move();
  point(circleVector.x, circleVector.y);  
  frame++;
  time = currentTime;
}

void checkBorders() {
  if (v.x + circleVector.x >= width + xSpeed*tpf - sizeOfCircle/2) {
    xSpeed *= -0.9;
    circleVector.set(width - sizeOfCircle/2 - 1, circleVector.y);
  } else if (v.x + circleVector.x <= 0 + xSpeed*tpf + sizeOfCircle/2) {
    xSpeed = abs(xSpeed * 0.9);
    circleVector.set(0 + sizeOfCircle/2 + 1, circleVector.y);
  } 
  if (v.y + circleVector.y >= height + ySpeed*tpf - sizeOfCircle/2) {
    ySpeed = ySpeed * -0.9;
    circleVector.set(circleVector.x, height - sizeOfCircle/2 - 1);
  } 
  // else if (v.y + circleVector.y <= 0 + ySpeed + sizeOfCircle/2) { //top border
  //   ySpeed = abs(ySpeed);
  // }
}

void move() {
  ySpeed += a*tpf;
  v.set(xSpeed * tpf, ySpeed * tpf);
  circleVector.add(v);
}
