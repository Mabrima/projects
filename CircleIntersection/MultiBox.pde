public class MultiBox extends Shape {
    float xVelocity = 0;
    float xAcceleration = 1;
    float xMaxVelocity = 10; //not needed right now due to code funk
    float yVelocity = 0;
    float yAcceleration = 1;
    float yMaxVelocity = 20;
    float jumpSpeed = -25;
    boolean falling = false;

    public Box center;
    public Box inLeft, inRight, inTop, inBot;
    public Box onLeft, onRight, onTop, onBot;

    public MultiBox(float x, float y, float w, float h) {
      super(x, y);
      
      center = new Box(x, y, w, h);
      
      inLeft = new Box(x - w * 0.5 + 2, y, 2, h);
      inRight = new Box(x + w * 0.5 - 2, y, 2, h);
      inTop = new Box(x, y - h * 0.5 + 2, w, 2);
      inBot = new Box(x, y + h * 0.5 - 2, w, 2);
      
      onLeft = new Box(x - w * 0.5 - 1, y, 2, h);
      onRight = new Box(x + w * 0.5 + 1, y, 2, h);
      onTop = new Box(x, y - h * 0.5 - 1, w, 2);
      onBot = new Box(x, y + h * 0.5 + 1, w, 2);
    }

    public void update(float dt) {
        move();
        updateBoxes();
        super.update(dt);
        rectMode(CENTER);
        rect(pos.x, pos.y, center.size.x, center.size.y);
    }

    private void updateBoxes() {
        center.pos.x = pos.x;
        center.pos.y = pos.y;

        onBot.pos.x = pos.x;
        onBot.pos.y = pos.y + center.size.y/2 + 1;

        inBot.pos.x = pos.x;
        inBot.pos.y = pos.y + center.size.y/2 - 2;
    }

    public void moveOutOfGround(Box other) {
        while (inGround(other)) {
            pos.y--;
            updateBoxes();
        }
    }

    public boolean inGround(Box other) {
      return inBot.intersectsBox(other);
    }

    public boolean onGround(Box other) {
      return onBot.intersectsBox(other);
    }

    public boolean intersectsCircle(Circle circle) {
        return !(pos.x - center.size.x/2 > circle.pos.x + circle.r ||
            pos.x + center.size.x/2 < circle.pos.x - circle.r ||
            pos.y - center.size.y/2 > circle.pos.y + circle.r ||
            pos.y + center.size.y/2 < circle.pos.y - circle.r);
    }

    private void move() {
        gravity();
        xVelocity = xAcceleration * getAxisRaw("Horizontal") + xVelocity * 0.9;
        if (!falling) {
            if (jump() && yMaxVelocity > abs(yVelocity)){
                yVelocity += jumpSpeed;
                falling = true;
            }
        }
        pos.x += xVelocity;
        pos.y += yVelocity;
    }

    private void gravity() {
        if (falling && yVelocity < yMaxVelocity) {
            yVelocity += yAcceleration;
        }
    }

    public void setFalling(boolean b) {
        falling = b;
    }
}