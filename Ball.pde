//
class Ball extends ez_Entity{
  
  public static final int BALL_STATE_LOCKED=100;
  public static final int BALL_STATE_MOVING=110;
  public static final int BALL_STATE_LOST=120;
  
  private final float SPEED_MIN=150.0;
  private final float SPEED_MAX=200.0;
  
  private float speedModule=0;

  private Paddle paddle=null;

  Ball(Paddle ref){
    super(0,0,"images/ball.png");
    paddle= ref;
    
    setState(Ball.BALL_STATE_LOCKED);
    
    speedModule= newSpeed();
  }
  
  float newSpeed(){
    return random(SPEED_MIN,SPEED_MAX);
  }
  
  
  void setMove(){
    
    if(getState()==Ball.BALL_STATE_LOCKED)
    {
      setState(Ball.BALL_STATE_MOVING);
      
      setSpeedX(newSpeed());
      
      setSpeedY(newSpeed());
    }
    
  }
  
  void removeX(){
    float dx= getSpeedX();
    
    float sp= newSpeed();
    
    if(dx >0)
    {
      sp=sp*-1.0;
    }
    //
    setSpeedX(sp);
  }
  
  void removeY(){
    float dy= getSpeedY();
    
    float sp= newSpeed();
    
    if(dy >0)
    {
      sp=sp*-1.0;
    }
    //
    setSpeedY(sp);
  }
  
  void bump(){
    float dx= getSpeedX();
    float dy= getSpeedY();
    
    speedModule=sqrt(dx*dx+dy*dy);
    
    float x= getCenterX()- paddle.getCenterX();
    float w_2=paddle.getWidth()/2;
    
    float anglemin=radians(20);
    float anglemax=radians(160);
    
    float angle= map(x,-w_2,+w_2,anglemax,anglemin);
    
    dx= speedModule*cos(angle);
    dy=-speedModule*sin(angle);
    
    setSpeeds(dx, dy);
    
  }
  
  
  boolean isCollidePaddle(){
    
    if(paddle!= null)
    {
      if(isCollide(paddle) && getSpeedY() >0)
      {
        bump();
        return true;
      }
    }
    return false;
  }
  
  
  void update(float dt){
    super.update(dt);
    
    if(getState()==Ball.BALL_STATE_LOCKED)
    {
      setBottom(paddle.getTop());
      setCenterX(paddle.getCenterX());
    }
    
    //limites
    if(getTop() <0 && getSpeedY() <0)
    {
      removeY();
    }
    //
    else if(getLeft() <0 && getSpeedX() <0)
    {
      removeX();
    }
    //
    else if(getRight() > width && getSpeedX()>0)
    {
      removeX();
    }
    //
    else if(getBottom() > height && getSpeedY()>0)
    {
      setState(Ball.BALL_STATE_LOST);
    }
    
  }
  
  void render(){
    super.render();
    
    //super.renderDebug();
  }
}
