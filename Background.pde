//
class Background {

  private PImage img=null;

  Background() {
    img= loadImage("images/background.jpg");
  }

  void render() {
    if (img!= null)
    {
      imageMode(CORNER);
      image(img,0,0);
    }
  }
}
