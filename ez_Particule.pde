/**
 Class Particule ezLib
  version 0.19.04
 */

class ez_Particule
{
  private PVector position=null;

  private PVector speed=null;
  private float radius;
  private float lives;
  private int col_alpha;
  private int state;
  private float timer;


  static final int PARTICULE_STATE_LIVE=100;
  static final int PARTITULE_STATE_DEAD=200;

  //
  ez_Particule(float px, float py)
  {
    position= new PVector(px, py);

    speed= new PVector(0, 0);

    this.radius=15.0;
    this.lives=3.0f;
    this.state=PARTITULE_STATE_DEAD;
    this.timer=0.0f;
    this.col_alpha=255;
  }

  //
  boolean isDead()
  {
    if (state==PARTITULE_STATE_DEAD)
    {
      return true;
    }
    return false;
  }

  //
  void reset(float xn, float yn )
  {
    position.x=xn;
    position.y=yn;

    lives=random(1, lives);
    timer=0;
    state=PARTICULE_STATE_LIVE;
  }

  //
  void setSpeed(float module, float angle)
  {
    float a=radians(angle);

    speed.x=module*cos(a);
    speed.y=-module*sin(a);
    this.state=PARTICULE_STATE_LIVE;
  }


  //
  void update(float dt)
  {
    if (state==PARTICULE_STATE_LIVE)
    {
      timer+=dt;


      if (timer >lives)
      {
        timer=0;
        state=PARTITULE_STATE_DEAD;
      }
      //
      col_alpha=int(255-(255*timer)/lives);

      position.x+=(speed.x)*dt;
      position.y+=(speed.y)*dt;
    }
  }

  //
  void render()
  {
    noStroke();
    fill(50, 50, 50, col_alpha);
    ellipse(position.x, position.y, radius, radius);
  }
}
//end
//*******************
//*******************
/**
 class ezGenerator ezLIb
 */

class ez_Generator
{
  final int NB_PARTICULES=100;
  private ez_Particule[] particules=null;
  private boolean go;
  private PVector position=null;

  //
  ez_Generator(float xp, float yp, float speed_min, float speed_max, float deg_min, float deg_max)
  {
    this.position= new PVector(xp, yp);
    this.go=false;
    particules= new ez_Particule[NB_PARTICULES];

    for (int i=0; i <NB_PARTICULES; i++)
    {
      particules[i]= new ez_Particule(xp, yp);
      particules[i].setSpeed(random(speed_min, speed_max), random(deg_min, deg_max));
    }
  }

  //
  void begin()
  {
    this.go=true;
  }

  //
  void move(float xp, float yp)
  {
    position.x=xp;
    position.y=yp;
  }

  //
  void stop()
  {
    this.go=false;
  }

  //
  void update(float dt)
  {
    if (go==true && particules.length >0)
    {
      for (int i=0; i <NB_PARTICULES; i++)
      {
        particules[i].update(dt);

        if (particules[i].isDead()==true)
        {
          particules[i].reset(position.x, position.y);
        }
      }
    }
  }

  //
  void render()
  {
    if (go==true && particules.length >0)
    {
      for (ez_Particule item : particules)
      {
        item.render();
      }
    }
  }
}
//end
