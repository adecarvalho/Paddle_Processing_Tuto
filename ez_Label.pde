/**
 Class Label for EzPLib
  version 0.19.04
 */
 
class ez_Label {

  private PFont font;
  private String txt;
  private color txt_color;

  ez_Label(String fontpath, int size)
  {
    font= createFont(fontpath, size);
    txt_color= color(255,255,0);
    txt="";
  }

  //
  void setText(String txt)
  {
    this.txt=txt;
  }

  //
  void setColorText(color c)
  {
    this.txt_color=c;
  }

  //
  void render(float px, float py)
  {
    textFont(this.font);
    fill(this.txt_color);
    text(this.txt, px, py);
  }
}
