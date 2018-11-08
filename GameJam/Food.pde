public class Food {

	PVector position;
	int size;

	public Food (PVector position, int size) {
		this.position = position;
		this.size = size;
	}

	PVector getPosition() {
		return position.copy();
	}

	int getSize() {
		return size;
	}

	void setPosition(PVector position) {
		this.position = position;
	}
}