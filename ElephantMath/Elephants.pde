class Elephants{

  PImage img;
  
  int number;

  float posX;
  float posY;


  Elephants(PImage img, int number) {
    this.img = img;    
    this.number = number;
    posX = 0;
    posY = 0;
  }

  int getNumber() {
    return number;
  }
  
  PImage getImage(){
    return img.copy();
  }

  void setPosition (float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
  }

  void display() {
    image(img, posX, posY);
  }
}
