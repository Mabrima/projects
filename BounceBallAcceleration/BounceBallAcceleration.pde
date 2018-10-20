int frame = 0;
PVector circlePositionVector;
PVector velocity = new PVector(0, 0);
int sizeOfCircle = 50;
float xSpeed = 0;
float ySpeed = 100;
float accelleration = 100;
float frictionSpeedDecrease = 0.9;
float timePerFrame;
float time = 0;

void setup() {
    size(640, 480);
    strokeWeight(sizeOfCircle);
    stroke(0, 100, 255);
    circlePositionVector = new PVector(width/2, 0);
}

void draw() {
    int currentTime = millis();
    timePerFrame = (currentTime - time) * 0.001f;
    background(204);
    checkBorders();
    move();
    point(circlePositionVector.x, circlePositionVector.y);  
    frame++;
    time = currentTime;
}

void checkBorders() {
    if (velocity.x + circlePositionVector.x >= width + xSpeed*timePerFrame - sizeOfCircle/2) {
        xSpeed *= -frictionSpeedDecrease;
        circlePositionVector.set(width - sizeOfCircle/2 - 1, circlePositionVector.y);
    } else if (velocity.x + circlePositionVector.x <= 0 + xSpeed*timePerFrame + sizeOfCircle/2) {
        xSpeed = abs(xSpeed * frictionSpeedDecrease);
        circlePositionVector.set(0 + sizeOfCircle/2 + 1, circlePositionVector.y);
    } 
    if (velocity.y + circlePositionVector.y >= height + ySpeed*timePerFrame - sizeOfCircle/2) {
        ySpeed = ySpeed * -frictionSpeedDecrease;
        circlePositionVector.set(circlePositionVector.x, height - sizeOfCircle/2 - 1);
    } 
    // else if (velocity.y + circlePositionVector.y <= 0 + ySpeed + sizeOfCircle/2) { //top border
    //     ySpeed = abs(ySpeed);
    // }
}

void move() {
    ySpeed += accelleration * timePerFrame;
    velocity.set(xSpeed * timePerFrame, ySpeed * timePerFrame);
    circlePositionVector.add(velocity);
}
