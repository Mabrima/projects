

/*public class parabolicLines extends {

// Position is where in the graph the corner is placed
// axis 1/2 will be x and y axis size 
// number of lines will make the line distance

	public parabolicLines (position, axis1, axis2, numberOfLines) {
		
	}

} */


int lineDistance = 30;

void setup() {
	size(800, 800);
 	strokeWeight(1);
 	background(50, 166, 240);
}

void draw() {
	for (int i = 0; i < height; i += lineDistance) {
		if (i%(lineDistance*3) == 0) {
			stroke(0, 0, 0);
		}
		else {
			stroke(128);
		}
		line(0, i, i, height);
	}
}
