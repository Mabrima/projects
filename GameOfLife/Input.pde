

void keyPressed() {

	switch (keyCode) {
		case 32: 
			pause = !pause;
		break;
		case 107: 		//add
			if (myFrameRate < 60){
				myFrameRate++;  
				frameRate(myFrameRate);
			}
		break;   		//subract
		case 109: 
			if (myFrameRate != 1){
				myFrameRate--;	
				frameRate(myFrameRate);  
			}
		break;
	}

}

void mousePressed() {
	if (mouseButton == LEFT) {
		cells[(int) (mouseX/10)][(int) (mouseY/10)].nextState = !cells[(int) (mouseX/10)][(int) (mouseY/10)].nextState;
	}
}
