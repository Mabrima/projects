public class Zombie extends Human {

	public Zombie () {
		size = random(17, 22);
		super.alive = false;
		super.rColor = random(30, 70);
        super.gColor = random(120, 170);
        super.bColor = random(70, 120);
	}

	public Zombie (PVector position, float velocity, float direction, float size) {
		super.position = position;
		super.velocity = velocity/2;
		super.direction = direction;
		super.size = size;
		super.alive = false;
		super.rColor = random(30, 70);
        super.gColor = random(120, 170);
        super.bColor = random(70, 120);
	}

	void draw() {
        fill(rColor, gColor, bColor);
        ellipse(position.x, position.y, size, size);
        fill(0);
        line(position.x, position.y, position.x + velocity/abs(velocity) * cos(direction)*size, position.y + velocity/abs(velocity) * sin(direction)*size);
    }

}