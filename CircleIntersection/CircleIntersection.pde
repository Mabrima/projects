private float _dt, _lt;
public ArrayList<Shape> shapes;

public Circle circ1, circ2;
public Box box1, box2;
public Line line1, line2;
public MultiBox player;

public void setup(){
    size(640, 800);

    shapes = new ArrayList<Shape>();

    circ1 = new Circle(300, 200, 50);
    circ2 = new Circle(200, 225, 50);

    box1 = new Box(400, 600, 60, 40);
    box2 = new Box(430, 620, 60, 40);

    line1 = new Line(10, 10, width - 10, height - 10);
    line2 = new Line(width - 10, 10, 10, height - 10);

    player = new MultiBox(400, 541, 40, 80);

    shapes.add(circ1);
    shapes.add(circ2);

    shapes.add(box1);
    shapes.add(box2);

    shapes.add(line1);
    shapes.add(line2);

    shapes.add(player);
}

public void draw(){
    tickDeltaTime();
    background(128);
  
    for(int i = 0; i < shapes.size(); i++){
        shapes.get(i).update(_dt);
    }

    if (player.onGround(box1) || player.onGround(box2)) {
        player.setFalling(false);
        player.yVelocity = 0;
    } else {
        player.setFalling(true);
      
    //println(circ1.intersectsCircle(circ2));
    //println(box1.intersectsBox(box2));
    //println(line1.intersectsLine(line2));
    //println("onGround: " + player.onGround(box1));
    //println("inGround: " + player.inGround(box1));
    }
    if (player.intersectsCircle(circ1)){
        shapes.remove(circ1);
    }
    if (player.intersectsCircle(circ2)){
        shapes.remove(circ2);
    }


    player.moveOutOfGround(box1);
    player.moveOutOfGround(box2);
}

public void tickDeltaTime(){
    _dt = (millis() - _lt) * 0.001;
    _lt = millis();
}