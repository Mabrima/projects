int frame = 0;

void setup()
{
	size(640, 480);
	strokeWeight(5);
}

void draw()
{
	background(50, 0, 50);
	float distance = width/100.0;

	//Draw animated point
	for (int i = 0; i < width; i += distance) {
		stroke(200, 0, 0);
		point(distance + i, 240 + sin((-frame + i) * 0.01) * 100);
		stroke(0, 100, 255);
		point(distance + i, 240 + cos((frame + i) * 0.01) * 100);


	}
	
	frame++;
}