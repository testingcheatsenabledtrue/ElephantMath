class Cloud {

  PImage img;
  int altAnswer;
  int rightAnswer;

  boolean moveDown;
  boolean moveUp;

  float posX;
  float posY;
  float speed;

  Cloud(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
    img = loadImage("Moln.png");
    altAnswer = 0;
    rightAnswer = -1;
    speed = 5;
  }

  int getAnswer() {
    return altAnswer;
  }

  boolean checkAnswer() {
    if (altAnswer == rightAnswer) {
      return true;
    }
    return false;
  }

  void setAnswers(int altAnswer, int rightAnswer) {
    this.altAnswer = altAnswer;
    this.rightAnswer = rightAnswer;
  }

  void setSpeed(int speed) {
    this.speed = speed;
  }

  void moveDown() {
    posY += speed;
  }

  void moveUp() {
    posY -= speed;
  }

  boolean checkMousePressed() {
    if (mouseX > posX - img.width/2 && mouseX < posX + img.width/2 &&
      mouseY > posY && mouseY < posY + img.height) {
      if (altAnswer < rightAnswer) {
        moveDown = true;
      } else if (altAnswer > rightAnswer) {
        moveUp = true;
      }
      return true;
    } else {
      return false;
    }
  }

  void update() {
    if (moveDown) {
      if (posY < height + img.height) {
        moveDown();
      } else {
        moveDown = false;
        //arrived = true;
      }
    }
    if (moveUp) {
      if (posY > -img.height) {
        moveUp();
      } else {
        moveUp = false;
        //arived =true;
      }
    } //<>//
  }

  void display() {
    image(img, posX - img.width/2, posY);
    fill(0);
    textSize(img.height/2);
    text(altAnswer, posX - img.width/15, posY + img.height/1.5);
  }
}
