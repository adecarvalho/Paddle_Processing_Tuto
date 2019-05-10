/**
 Class Score for EzLib
  version 0.19.04
 */

class ez_Score {

  private ez_Label labelPoint;
  private ez_Label labelLives;
  private ez_Label labelName;

  private int points=0;
  private int lives=3;
  private String name="NAME";
  private color col=color(0);

  ez_Score(String fontPath, color c) 
  {
    labelPoint= new ez_Label(fontPath, 25);
    labelPoint.setColorText(c);//
    labelPoint.setText("Points="+points);

    labelName= new ez_Label(fontPath, 25);
    labelName.setColorText(c);
    labelName.setText("Name");

    labelLives= new ez_Label(fontPath, 25);
    labelLives.setColorText(c);
    labelLives.setText("Lives="+lives);
  }

  //*************
  void setName(String name)
  {
    this.name=name;
  }

  //**************
  String getName()
  {
    return this.name;
  }

  //*************
  void setPoints(int pts)
  {
    this.points=pts;
  }

  //*************
  void setLives(int lives)
  {
    this.lives=lives;
  }

  //***************
  int getPoints()
  {
    return points;
  }

  //***********
  int getLives()
  {
    return lives;
  }

  //*********************
  void increment(int amt)
  {
    this.points+=amt;
  }

  //*******************
  void decrementLives()
  {
    this.lives--;
  }
  
  //
  void incrementLives(int amt)
  {
    this.lives+=amt;
    //
    if(this.lives >3)
    {
      this.lives=3;
    }
  }

  //******************
  boolean isGameOver()
  {
    if (this.lives <0)
    {
      return true;
    }

    return false;
  }

  //**********
  void render()
  {
    labelPoint.setText("Points="+this.points);
    labelLives.setText("Lives="+this.lives);
    labelName.setText(this.name);

    labelPoint.render(20, 20);
    labelName.render(width/2 -20, 20);
    labelLives.render(width-150, 20);
  }
}
