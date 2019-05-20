//
class Background {

  private PImage img=null;
  private PImage img_over=null;

  Background(boolean isgameOver) {
    img= loadImage("images/background.jpg");

    if (isgameOver==true)
    {
      img_over= loadImage("images/gameOver.png");
    }
    //
  }

  void render() {
    if (img!= null)
    {
      imageMode(CORNER);
      image(img, 0, 0);
    }
    //
    if (img_over!= null)
    {
      imageMode(CENTER);
      image(img_over, width/2, 150);
    }
  }
}
