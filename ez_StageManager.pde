/**
 Stage game manager for ezGameLib
  version 0.19.04
 */

//import java.util.*;


class ez_StageManager {

  private Stack<ez_Stage> stack=null; 
  private ez_Stage current=null;


  ez_StageManager() {
    stack= new Stack<ez_Stage>();
  }

  //**********************
  void addStage(ez_Stage stage)
  {
    stack.push(stage);
    current= stack.peek();
    current.onEnter(null);
  }

  //*************
  void popStage()
  {
    if (stack.isEmpty()==false)
    {
      current=stack.pop();
      current.onExit();
    }
  }
  
  //*****************************
  void changeStage(ez_Stage newStage,StringDict message)
  {
    if (stack.isEmpty()==false)
    {
      current.onExit();
      stack.pop();
      //
      stack.push(newStage);
      current=stack.peek();
      current.onEnter(message);
    }
  }
  
  //*******************
  void update(float dt)
  {
    current.update(dt);
  }
  
  //***********
  void render()
  {
    current.render();
  }
}
//end
