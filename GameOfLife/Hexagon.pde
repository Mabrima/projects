 public class Hexagon extends GameObject {
    float angle = 360.0 / 6;
       
    Hexagon(float x, float y, float size) {
      super(x, y, size);
    }

    void draw() {
    	alive = nextAlive;
		if (alive) {
			fill(0, 100 + 100*birth, 0);
			stroke(0);
		}
		else {
			fill(0 + 50*lifeTimer, 0, 0);
			stroke(50);
		}

     	beginShape();
      	for (int i = 0; i < 6; i++) {
        	vertex(x + size * cos(radians(angle * i)), y + size * sin(radians(angle * i)));
      	}
      	endShape(CLOSE);
    }
}