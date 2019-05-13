//import 
import java.util.*;

//ezLib
ez_StageManager gStageManager=null;
ez_InputManager gInputManager=null;


float time=0;
float now=0;
float ex=0;
int fps=0;

//
void setup() {
  size(700, 500);
  //
  gStageManager= new ez_StageManager();
  
  gStageManager.addStage(new GameStage());
  
  gInputManager= new ez_InputManager();
  
  
}

//
void draw() {
  background(51);
  //
  now=millis();
  float dt= (now-ex)/1000.0f;

  time+=dt;
  fps++;

  if (time >1.0f)
  {
    println("fps= "+fps+ " dt= "+dt);
    fps=0;
    time=0;
  }
  //
  gStageManager.update(dt);
  
  gStageManager.render();
 
  gInputManager.update();
  
  ex= now;
}

//
void keyPressed() {
  println("keycode= "+keyCode);
  gInputManager.setKeyboardPressed(keyCode);
}

//
void keyReleased() {
  gInputManager.setKeyboardReleased(keyCode);
}
