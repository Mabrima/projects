

void keyPressed() {

	switch (keyCode) {
		case 107: 		//add
			myFrameRate++;   
			frameRate(myFrameRate);

		break;   		//subract
		case 109: 
			myFrameRate--;
			if (myFrameRate <= 0)
				myFrameRate = 1;
			frameRate(myFrameRate);  
		break;
	}

}

