//
class GameStage extends ez_Stage {

  private Background bkg=null;

  private Paddle paddle=null;

  private Ball ball=null;

  private Matrice matrice=null;

  private int score;
  private int lives;

  private ez_Label labelPoints=null;
  private ez_Label labelLives=null;

  //
  GameStage() {
    super();

    bkg= new Background(false);

    paddle= new Paddle(width/2, height-50, 300);

    ball= new Ball(paddle);

    matrice= new Matrice();

    score=0;
    lives=3;

    labelPoints= new ez_Label("fonts/brick.ttf", 30);
    labelPoints.setColorText(color(255, 161, 31));
    labelPoints.setText("Points= "+score);


    labelLives= new ez_Label("fonts/brick.ttf", 30);
    labelLives.setColorText(color(255, 161, 31));
    labelLives.setText("Lives= "+lives);
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
    labelPoints.setText("Points= "+score);
    labelLives.setText("Lives= "+lives);

    //gameover
    if(lives <0)
    {
      StringDict msg= new StringDict();
      
      msg.set("SCORE",str(score));
      
      gStageManager.changeStage(new ConcluStage(),msg);
    }
  }


  //
  void render() {
    bkg.render();

    paddle.render();

    ball.render();

    matrice.render();

    labelPoints.render(20, 20);
    labelLives.render(width-200, 20);
  }

  void onEnter(StringDict message) {
  }

  void onExit() {
  }
}
