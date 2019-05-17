/**
 Class Entity for EzLib
 version 0.19.04
 */
//****************************
/**
 RecBounds for ezLib
 */
class ez_RecBounds {
  private float xp;
  private float yp;

  private float xi;
  private float yi;

  private float width;
  private float height;


  ez_RecBounds(float px, float py, float w, float h)
  {
    this.xp=px;
    this.yp=py;
    this.width=w;
    this.height=h;
    this.xi=0;
    this.yi=0;
  }

  //
  boolean collide(ez_RecBounds target)
  {
    //test AABB colision
    
    if ((target.xp >= this.xp+this.width) 
      || (target.xp+target.width <= this.xp)
      ||(target.yp >= this.yp+this.height)
      ||(target.yp+target.height <= this.yp)
      )
      return false;
    else
    {
      return true;
    }

  }

  //
  void update(float xp, float yp)
  {
    this.xp=xp;
    this.xp=this.xp+this.xi;

    this.yp=yp;
    this.yp=this.yp+this.yi;
  }

  //
  void render()
  {
    strokeWeight(1);
    stroke(200, 20, 200);
    noFill();
    rect(this.xp, this.yp, this.width, this.height);
  }

  //
  void inflate(float xi, float yi)
  {
    this.xi=xi;
    this.yi=yi;
    this.width= this.width- 2*this.xi;
    this.height= this.height-2*this.yi;
  }
}
// end RecBounds

//****************************
class ez_Entity {
  private PVector position;
  private PVector speed;
  private PImage img;
  private int dim_width;
  private int dim_height;
  private ez_RecBounds recbounds=null;
  private int state;

  ez_Entity(float px, float py, int pw, int ph)
  {
    this.position= new PVector(px, py);
    this.speed= new PVector(0, 0);
    this.img=null;

    this.dim_width=pw;
    this.dim_height=ph;

    //bounds
    this.recbounds= new ez_RecBounds(this.position.x, this.position.y, this.dim_width, this.dim_height);

    //state
    this.state=0;
  }

  ez_Entity(float px, float py, String imagePath) {
    this.position= new PVector(px, py);
    this.speed= new PVector(0, 0);
    this.img=null;
    if (imagePath != "")
    {
      this.img= loadImage(imagePath);
      this.dim_width=img.width;
      this.dim_height=img.height;
    }
    //utilise rectangle violet
    else
    {
      this.dim_width=40;
      this.dim_height=40;
    }

    //bounds
    this.recbounds= new ez_RecBounds(this.position.x, this.position.y, this.dim_width, this.dim_height);

    //state
    this.state=0;
  }

  //
  void setImage(String imagePath)
  {
    this.img= loadImage(imagePath);
    this.dim_width=img.width;
    this.dim_height=img.height;
    this.recbounds= new ez_RecBounds(this.position.x, this.position.y, this.dim_width, this.dim_height);
  }

  //
  void setImage(PImage img)
  {
    this.img= img;
    this.dim_width=img.width;
    this.dim_height=img.height;
    this.recbounds= new ez_RecBounds(this.position.x, this.position.y, this.dim_width, this.dim_height);
  }

  //
  int getState()
  {
    return this.state;
  }

  //
  void setState(int state)
  {
    this.state=state;
  }

  //
  float getWidth()
  {
    return dim_width;
  }

  //
  float getHeight()
  {
    return dim_height;
  }

  //
  float getLeft() {
    return this.position.x;
  }

  //
  void setPosition(float xp, float yp)
  {
    this.position.x=xp;
    this.position.y=yp;
  }

  //
  void setPosition(PVector pv)
  {
    this.position.x=pv.x;
    this.position.y=pv.y;
  }

  //
  void setPositionX(float x)
  {
    this.position.x=x;
  }

  //
  void setPositionY(float y)
  {
    this.position.y=y;
  }

  //
  PVector getPosition()
  {
    return this.position;
  }

  //
  float getPositionX()
  {
    return this.position.x;
  }

  //
  float getPositionY()
  {
    return this.position.y;
  }

  //
  void setCenterX(float centerX)
  {
    this.position.x= centerX-(this.dim_width/2);
  }

  //
  void setCenterY(float centerY)
  {
    this.position.y= centerY-(this.dim_height/2);
  }

  //
  float getCenterX()
  {
    return (this.position.x+this.dim_width/2);
  }

  //
  float getCenterY()
  {
    return (this.position.y+this.dim_height/2);
  }

  //
  void setLeft(float left) {
    this.position.x=left;
  }

  //
  float getRight() {
    return (this.position.x+this.dim_width);
  }

  //
  void setRight(float right) {
    this.position.x=right- this.dim_width;
  }

  //
  float getTop() {
    return this.position.y;
  }

  //
  void setTop(float top) {
    this.position.y=top;
  }

  //
  float getBottom() {
    return (this.position.y+this.dim_height);
  }

  //
  void setBottom(float bottom)
  {
    this.position.y=bottom- this.dim_height;
  }

  //
  void setSpeeds(float dx, float dy)
  {
    this.speed.x=dx;
    this.speed.y=dy;
  }

  //
  void setSpeeds(PVector vit)
  {
    this.speed.x=vit.x;
    this.speed.y=vit.y;
  }

  //
  void setSpeedX(float dx)
  {
    this.speed.x=dx;
  }

  //
  void setSpeedY(float dy)
  {
    this.speed.y=dy;
  }

  //
  float getSpeedX()
  {
    return this.speed.x;
  }

  //
  float getSpeedY()
  {
    return this.speed.y;
  }

  //
  PVector getSpeeds()
  {
    return this.speed;
  }  

  //
  boolean isCollide(ez_Entity target)
  {
    if (this.recbounds.collide(target.recbounds))
    {
      return true;
    }
    return false;
  }

  //
  void update(float dt) {
    this.position.add(this.speed.x*dt, this.speed.y*dt);

    this.recbounds.update(this.position.x, this.position.y);
  }

  //
  void render() {
    imageMode(CORNER);

    if (this.img != null)
    {
      image(this.img, this.position.x, this.position.y);
    } else
    {
      fill(100, 250, 100, 200);
      noStroke();
      rect(this.position.x, this.position.y, this.dim_width, this.dim_height);
    }
  }

  //
  void renderDebug()
  {
    this.recbounds.render();
  }

  //
  void inflate(float xi, float yi)
  {
    this.recbounds.inflate(xi, yi);
  }
}
//end class Entity
