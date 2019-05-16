//
class Bloc extends ez_Entity {

  public static final int BLOC_WIDTH=50;
  public static final int BLOC_HEIGHT=25;

  public static final int BLOC_STATE_VISIBLE=100;
  public static final int BLOC_STATE_TOUCHED=110;

  public static final int BLOC_TYPE_R1=200;
  public static final int BLOC_TYPE_R2=210;
  public static final int BLOC_TYPE_CONDO=220;
  public static final int BLOC_TYPE_DIODE=230;


  Bloc(float px, float py, int type) {
    super(px, py, Bloc.BLOC_WIDTH, Bloc.BLOC_HEIGHT);
    
    setState(Bloc.BLOC_STATE_VISIBLE);
    
    switch(type)
    {
      case BLOC_TYPE_R1:
      setImage("images/resistance.png");
      break;
      
      case BLOC_TYPE_R2:
      setImage("images/resistance_2.png");
      break;
      
      case BLOC_TYPE_CONDO:
      setImage("images/condensateur.png");
      break;
      
      case BLOC_TYPE_DIODE:
      setImage("images/diode.png");
      break;
      
    }
  }

  void touched() {
     setState(Bloc.BLOC_STATE_TOUCHED);
  }


  void update(float dt) {
    super.update(dt);
  }

  void render() {
    if(getState()==Bloc.BLOC_STATE_VISIBLE)
    {
      super.render();
    }
  }
}
