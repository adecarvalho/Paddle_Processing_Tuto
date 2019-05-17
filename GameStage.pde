//
class GameStage extends ez_Stage {

  private Background bkg=null;

  private Paddle paddle=null;

  private Ball ball=null;

  private Matrice matrice=null;

  private int score;
  private int lives;

  private ez_Label labelPoint=null;
  private ez_Label labelLive=null;


  GameStage() {
    super();
    score=0;
    lives=3;

    bkg= new Background();

    paddle= new Paddle(width/2, height-50, 300);

    ball= new Ball(paddle);

    matrice= new Matrice();

    labelPoint= new ez_Label("fonts/brick.ttf", 30);
    labelPoint.setColorText(color(255, 161, 31));
    labelPoint.setText("Points= "+score);

    labelLive= new ez_Label("fonts/brick.ttf", 30);
    labelLive.setColorText(color(255,161, 31));
    labelLive.setText("Lives= "+lives);
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

  void setScore() {
    labelPoint.setText("Points= "+score);
    labelLive.setText("Lives= "+lives);
  }

  //
  void update(float dt) {

    input();

    paddle.update(dt);

    ball.update(dt);

    //ball is lost
    if (ball.getState()==Ball.BALL_STATE_LOST)
    {
      ball.setState(Ball.BALL_STATE_LOCKED);
      lives--;
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
      score++;
    }

    //
    if (matrice.isAllDestroy())
    {
      ball.setState(Ball.BALL_STATE_LOCKED);
    }

    //
    setScore();
  }


  void render() {
    bkg.render();

    paddle.render();

    ball.render();

    matrice.render();


    labelPoint.render(20, 20);
    
    labelLive.render(width-200,20);
  }

  void onEnter(StringDict message) {
  }

  void onExit() {
  }
}
