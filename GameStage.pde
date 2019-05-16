//
class GameStage extends ez_Stage {

  private Background bkg=null;

  private Paddle paddle=null;

  private Ball ball=null;

  private Matrice matrice=null;


  GameStage() {
    super();
    bkg= new Background();

    paddle= new Paddle(width/2, height-50, 300);

    ball= new Ball(paddle);

    matrice= new Matrice();
  }

  void input() {
    if (gInputManager.isKeyPressed(RIGHT))
    {
      paddle.move(Paddle.MOVE_RIGHT);
    }
    //
    if (gInputManager.isKeyPressed(LEFT))
    {
      paddle.move(Paddle.MOVE_LEFT);
    }
    //
    if (gInputManager.isKeyReleased(RIGHT)||gInputManager.isKeyReleased(LEFT))
    {
      paddle.stop();
    }

    //ball
    if (gInputManager.isKeyReleased(32))
    {
      ball.setMove();
    }
  }

  void update(float dt) {

    input();

    paddle.update(dt);

    ball.update(dt);

    //ball is lost
    if (ball.getState()==Ball.BALL_STATE_LOST)
    {
      ball.setState(Ball.BALL_STATE_LOCKED);
    }

    //ball collide paddle
    if (ball.isCollidePaddle())
    {
    }

    //bloc and ball
    if (matrice.isCollideBall(ball))
    {
      ball.removeX();
      ball.removeY();
    }

    //
    if (matrice.isAllDestroy())
    {
      ball.setState(Ball.BALL_STATE_LOCKED);
    }
  }


  void render() {
    bkg.render();

    paddle.render();

    ball.render();
    
    matrice.render();
    
  }

  void onEnter(StringDict message) {
  }

  void onExit() {
  }
}
