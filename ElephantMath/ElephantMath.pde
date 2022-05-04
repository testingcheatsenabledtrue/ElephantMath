PImage ground;
PImage emptyCloud;

Elephants[] elephants;
Elephants elephantsA;
Elephants elephantsB;

Cloud [] clouds;

Calculator calc;

boolean gameRunning;

boolean gameOver;

void setup() {
  size(1920, 1080);

  ground = loadImage("Mark_1920.png");

  gameRunning = false;
  gameOver = false;

  elephants = new Elephants[5];
  clouds = new Cloud[3];
}

void draw () {
  //background(240, 165, 174); //rosa
  background(125, 185, 225); //blå
  image(ground, 0, height - ground.height);

  if (gameOver) {
    setGameOver();
  }

  if (!gameRunning && !gameOver) {
    fill(255);
    textSize(120);
    text("Klicka för att spela!", width/4, height/2);
  } else

    if (gameRunning && !gameOver) {

      for (Cloud cloud : clouds) {
        cloud.update();
      }

      for (Cloud cloud : clouds) {
        cloud.display();
      }

      elephantsA.display();
      elephantsB.display();

      fill(0);
      textSize(220);
      text("= ?", width - width/3.6, height/1.70);
      text("+", width/2.6, height/1.7);
    }
}

void setNewGame() {

  calc = new Calculator();
  setClouds();
  println("klick");
  setElephants();
  gameRunning = true;
  gameOver=false;
}

void setGameOver() {
  fill(255);
  textSize(200);
  text("Bra jobbat!", width/4, height/2.5);
  fill(0);
  textSize(100);
  text("Klicka för att spela igen", width/4, height/2 + height/8);
}

void setClouds() {

  clouds[0] = new Cloud (width/5, height/8);
  clouds[1] = new Cloud (width/2, height/8);
  clouds[2] = new Cloud (width - width/5, height/8);

  int sumIndex = (int) random(0, 2);
  int altIndexA;
  int altIndexB;

  switch (sumIndex) {
  case 0:
    altIndexA = 1;
    altIndexB = 2;
    break;
  case 1:
    altIndexA = 2;
    altIndexB = 0;
    break;
  default:
    altIndexA = 0;
    altIndexB = 1;
  }

  clouds[sumIndex].setAnswers(calc.getSum(), calc.getSum());
  clouds[altIndexA].setAnswers(calc.getWrongSumA(), calc.getSum());
  clouds[altIndexB].setAnswers(calc.getWrongSumB(), calc.getSum());
}

void setElephants() {

  elephants[0]= new Elephants(loadImage("1_Elefant.png"), 1);
  elephants[1]= new Elephants(loadImage("2_Elefanter.png"), 2);
  elephants[2]= new Elephants(loadImage("3_Elefanter.png"), 3);
  elephants[3]= new Elephants(loadImage("4_Elefanter.png"), 4);
  elephants[4]= new Elephants(loadImage("5_Elefanter.png"), 5);

  elephantsA = elephants[calc.getNumberA()-1];

  if (calc.getNumberA() == calc.getNumberB()) {
    elephantsB = new Elephants(elephantsA.getImage(), elephantsA.getNumber());
  } else {
    elephantsB = elephants[calc.getNumberB()-1];
  }

  elephantsA.setPosition(width/9, height/3);
  elephantsB.setPosition(width/2.3, height/3);
}



void mouseHasBeenPressed () {

  if (gameOver) {
    setNewGame();
  }
  if (!gameRunning) {

    setNewGame();
  } else {

    for (Cloud cloud : clouds) {
      if (cloud.checkMousePressed()) {
        if (cloud.checkAnswer()) {
          gameOver = true;
        }
      }
    }
  }
}

void mousePressed() {
  mouseHasBeenPressed();
}

void mouseReleased() {
}
