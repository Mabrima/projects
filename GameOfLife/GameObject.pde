public class GameObject {

	float x;
	float y;
	float size;
	boolean alive = false;
	boolean nextAlive = false;
	int timer = 0;
	int time = 3;
	int birth = 0;


	public GameObject (float x, float y, float size) {
		this.x = x;
		this.y = y;
		this.size = size;
	}

	void update() {
		if (alive) {
			timer = time;
			birth = 0;
		}
		else {
			birth = 1;
			if (timer != 0)
				timer--;
		}
	}


	void draw() {
		alive = nextAlive;
		if (alive) {
			fill(0, 100 + 100*birth, 0);
			stroke(0);
		}
		else {
			fill(0 + timer*50, 0, 0);
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