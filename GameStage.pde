//
class GameStage extends ez_Stage {
  
  private Background bkg=null;
  
  private Paddle paddle=null;

  GameStage() {
    super();
    bkg= new Background();
    
    paddle= new Paddle(width/2, height-50,300);
  }
  
  void input(){
    if(gInputManager.isKeyPressed(RIGHT))
    {
      paddle.move(Paddle.MOVE_RIGHT);
    }
    //
    if(gInputManager.isKeyPressed(LEFT))
    {
      paddle.move(Paddle.MOVE_LEFT);
    }
    //
    if(gInputManager.isKeyReleased(RIGHT)||gInputManager.isKeyReleased(LEFT))
    {
      paddle.stop();
    }
  }

  void update(float dt) {
    
    input();
    
    paddle.update(dt);
    
  }

  void render() {
    bkg.render();
    
    paddle.render();
    
  }

  void onEnter(StringDict message) {
  }

  void onExit() {
  }
}
