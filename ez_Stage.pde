/**
 Class Stage for ezLib
  version 0.19.04
 */

abstract class ez_Stage {

  ez_Stage() {
  }

  //
  abstract void update(float dt);

  //
  abstract void render();

  //
  abstract void onEnter(StringDict message);

  //
  abstract void onExit();
}
//end 
