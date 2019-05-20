//
class ConcluStage extends ez_Stage {

  private Background bkg=null;

  private ez_Label labelPoint=null;
  private ez_Label labelEnter=null;
  private ez_Label labelExit=null;


  ConcluStage() {
    super();
    bkg= new Background(true);

    labelPoint=new ez_Label("fonts/free.ttf", 30);
    labelPoint.setColorText(color(200, 160, 50));
    labelPoint.setText("Points");

    labelEnter=new ez_Label("fonts/free.ttf", 30);
    labelEnter.setColorText(color(200, 160, 50));
    labelEnter.setText("Press Enter to play");

    labelExit=new ez_Label("fonts/free.ttf", 30);
    labelExit.setColorText(color(200, 160, 50));
    labelExit.setText("Press Esc to exit");
  }

  //
  void update(float dt) {
    if(gInputManager.isKeyPressed(10))
    {
      gStageManager.changeStage(new GameStage(),null);
    }
  }

  //
  void render() {
    bkg.render();

    labelPoint.render(250, 350);
    labelEnter.render(200, 400);
    labelExit.render(150, 450);
  }

  //
  void onEnter(StringDict msg) {
    if (msg!= null && msg.size()>0)
    {
      String points= msg.get("SCORE");

      labelPoint.setText("Points= "+points);
    }
  }


  //
  void onExit() {
  }
}
