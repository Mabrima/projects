PVector position;
float speed = 5;

void setup() {
	size(1024, 1024);
	position = new PVector(width/2, height/2);
	ellipseMode(CENTER);

}

void draw() {
	background(40);

	float x = getAxisRaw("Horizontal") * speed;
	float y = getAxisRaw("Vertical") * speed;

	ellipse(position.x, position.y, 50, 50);

	position.x += x;
	position.y += y;



}
