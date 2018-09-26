import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class HumanVsZombie extends PApplet {

ArrayList<Human> people = new ArrayList<Human>();
Human testHuman;
Zombie testZombie;
int amount = 99;

public void setup() {
   
   for (int i = 0; i < amount; ++i) {
        people.add(new Human());
   }
   people.add(new Zombie());

   // testHuman = new Human();
   // testZombie = new Zombie();
}

public void draw() {
    background(255);
    zombieBite();
    update();
   // testHuman.update();
   // testHuman.draw();
   // testZombie.update();
   // testZombie.draw();
}

public void update() {
    for(int i = 0; i < people.size(); i++) {
        people.get(i).update();
        people.get(i).draw();
    }
}

public void zombieBite() {
    for (int i = 0; i < people.size(); i++) {
        for (int j = i+1; j < people.size(); j++) {
            if (collision(people.get(i).position, people.get(i).size, people.get(j).position, people.get(j).size)){
                if (people.get(i) instanceof Zombie && !(people.get(j) instanceof Zombie)) {
                    people.set(j, new Zombie(people.get(j).position, people.get(j).velocity, people.get(j).direction, people.get(j).size));
                } else if (people.get(j) instanceof Zombie && !(people.get(i) instanceof Zombie)) {
                    people.set(i, new Zombie(people.get(i).position, people.get(i).velocity, people.get(i).direction, people.get(i).size));
                }
            } 
        }
    }
}

public boolean collision(PVector v1, float size1, PVector v2, float size2) {
    float maxDistance = (size1 + size2)/2;
    if (abs(v1.x - v2.x) > maxDistance || abs(v1.y - v2.y) > maxDistance){
        return false;
    }  
    return dist(v1.x, v1.y, v2.x, v2.y) < maxDistance;
}
class Human {
    boolean alive = true;
    PVector position;
    float velocity;
    float direction;
    float size;
    float rColor;
    float bColor;
    float gColor;

    Human() {
        position = new PVector(random(size/2, width), random(size/2, height));
        size = 20;
        velocity = random(10) - 5;
        direction = random(0, PI/2);
        rColor = random(170, 220);
        gColor = random(70, 120);
        bColor = random(70, 120);

    }

    Human(float x, float y, float size) {
        position = new PVector(x, y); 
        this.size = size;
        velocity = random(10) - 5;
        direction = random(0, PI/2);
    }

    public void update() {
        position.x += velocity * cos(direction);
        position.y += velocity * sin(direction);

        if (position.x > width - size/2){
            position.x = 0 + size/2;
        } else if (position.x < 0 + size/2) {
            position.x = width - size/2;
        } else if (position.y > height - size/2) {
            position.y = 0 + size/2;
        } else if (position.y < 0 + size/2) {
            position.y = height - size/2;
        }
    }

    public void draw() {
        fill(rColor, gColor, bColor);
        ellipse(position.x, position.y, size, size);
    }

}
public class Zombie extends Human {

	public Zombie () {
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

	public void draw() {
        fill(rColor, gColor, bColor);
        ellipse(position.x, position.y, size, size);
    }

}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "HumanVsZombie" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
