public class Player {

	PVector position;
	int size;
	int speed = 3;

	public Player (PVector position, int size) {
		this.position = position;
		this.size = size;
	}

	void update() {
		position.x += getAxisRaw("Horizontal") * speed;
		position.y += getAxisRaw("Vertical") * speed;

	}

	PVector getPosition() {
		return position.copy();
	}

	int getSize() {
		return size;
	}

	void grow() {
		size += 2;
	}

}