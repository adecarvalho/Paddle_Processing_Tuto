/**
 Class InputManager for EzLib
  version 0.19.04
 */
 
class ez_InputManager
{
  private boolean tabKeyPressed[];
  private boolean tabKeyReleased[];
  private boolean _mouseClicked;
  
  private final int nbKey=200;

  ez_InputManager()
  {
    tabKeyPressed= new boolean[nbKey];
    tabKeyReleased= new boolean[nbKey];
    _mouseClicked=false;

    for (int i=0; i< nbKey; i++)
    {
      tabKeyPressed[i]=false;
      tabKeyReleased[i]=false;
    }
  }

  //
  void update()
  {
    for (int i=0; i< nbKey; i++)
    {
      tabKeyPressed[i]=false;
      tabKeyReleased[i]=false;
      _mouseClicked=false;
    }
  }

  //
  void setMouseClicked()
  {
    _mouseClicked=true;
  }

  //
  void setMouseReleased()
  {
    _mouseClicked=false;
  }
  
  //
  boolean isMouseClicked()
  {
    return _mouseClicked;
  }

  //
  void setKeyboardPressed(int keycode)
  {
    tabKeyPressed[keycode]=true;
  }

  //
  void setKeyboardReleased(int keycode)
  {
    tabKeyReleased[keycode]=true;
  }

  //
  boolean isKeyPressed(int keycode)
  {
    return tabKeyPressed[keycode];
  }

  //
  boolean isKeyReleased(int keycode)
  {
    return tabKeyReleased[keycode];
  }
}
//
