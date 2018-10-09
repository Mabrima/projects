public class GameObject {

	float x;
	float y;
	float size;
	boolean alive = false;
	boolean nextState = false;

	public GameObject (float x, float y, float size) {
		this.x = x;
		this.y = y;
		this.size = size;
	}


	void draw() {
		if (alive) {
			fill(255);
			stroke(0);
		}
		else {
			fill(0);
			stroke(50);
		}

		rect(x, y, size, size);

	}

	int checkAlive() {
		if (alive) {
			return 1;
		}
		else {
			return 0;
		}
	}
}