int frame = 0;
PVector circleVector = new PVector(0, 0);
PVector velocity = new PVector(0, 0);

void setup() {
	size(640, 480);
	strokeWeight(5);
	stroke(0, 100, 255);
}

void draw() {
    background(204);

    for (int i = 0; i < 2*PI*100; i += 15) {
      	point(circleVector.x + cos((i + frame) * 0.01) * 100, circleVector.y + sin((i + frame) * 0.01) * 100);
    }

    point(circleVector.x , circleVector.y);
    move();
    frame++;
}

void move() {
	velocity.set(mouseX - circleVector.x, mouseY - circleVector.y);
	velocity.normalize();
	circleVector.add(velocity);
}
