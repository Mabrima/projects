public class GameObject {
	float x;
	float y;
	float size;
	boolean alive = false;
	boolean nextAlive = false;
	char hasBeenAlive = 0;
	int lifeTimer = 0;
	int lifeTime = 3;
	int birth = 0;

	public GameObject (float x, float y, float size) {
		this.x = x;
		this.y = y;
		this.size = size;
	}
	
	int checkAlive() {
		if (alive) {	
			return 1;
		}
		else {
			return 0;
		}
	}

	void update() {
		if (alive) {
			hasBeenAlive = 1;
			lifeTimer = lifeTime;
			birth = 0;
		}
		else {
			birth = 1;
			if (lifeTimer != 0)
				lifeTimer--;
		}
	}

	void draw() {
		alive = nextAlive;
		if (alive) {
			fill(0, 100 + 100*birth, 0);
			stroke(0);
		}
		else {
			fill(0 + lifeTimer*50, 0, 0 + 50*hasBeenAlive);
			stroke(50);
		}

		rect(x, y, size, size);
	}
}