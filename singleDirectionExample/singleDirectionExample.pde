float posX;
float posY;

float v = 10;
float direction = 0;

void setup() {
	size(800, 600);
	posX = width/2;
	posY = height/2;
	strokeWeight(5);
}

void draw() {
	background(255);

	direction += 0.1;
	float dx = cos(direction) *v;
	float dy = sin(direction) *v;

	posX += dx;
	posY += dy;

	point(posX, posY);
}