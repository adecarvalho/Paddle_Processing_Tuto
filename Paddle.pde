//
class Paddle extends ez_Entity {

  private float speedModule;

  public static final int MOVE_LEFT=10;
  public static final int MOVE_RIGHT=20;

  Paddle(float px, float py, float speed) {
    super( px, py, "images/ram.png");
    speedModule=speed;
  }

  void move(int direction) {
    if (direction== Paddle.MOVE_LEFT)
    {
      setSpeeds(-speedModule, 0);
    } else if (direction == Paddle.MOVE_RIGHT)
    {
      setSpeeds(speedModule, 0);
    }
  }

  void stop() {
    setSpeeds(0, 0);
  }


  void update(float dt) {
    super.update(dt);
    
    //limites
    if(getLeft() <0)
    {
      setLeft(0);
    }
    
    if(getRight() > width)
    {
      setRight(width);
    }
  }


  void render() {
    super.render();
    
    super.renderDebug();
  }
}
