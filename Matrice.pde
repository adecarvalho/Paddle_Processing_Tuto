//
class Matrice {

  public static final int NB_COL=7;
  public static final int NB_ROW=4;

  private int nbBlocs=0;

  private Bloc[][] tabBlocs=null;


  Matrice() {
    tabBlocs= new Bloc[NB_ROW][NB_COL];

    createGrid();

    nbBlocs=NB_COL*NB_ROW;
  }


  //
  void createGrid() {

    int row=0;
    int py=50;

    createRow(row, py, Bloc.BLOC_TYPE_R1);

    py+=50;
    row++;
    createRow(row, py, Bloc.BLOC_TYPE_R2);

    py+=50;
    row++;
    createRow(row, py, Bloc.BLOC_TYPE_CONDO);

    py+=50;
    row++;
    createRow(row, py, Bloc.BLOC_TYPE_DIODE);
  }

  //
  void createRow(int row, int yp, int type) {
    for (int i=0; i< NB_COL; i++)
    {
      tabBlocs[row][i]= new Bloc(Bloc.BLOC_WIDTH/2+i*Bloc.BLOC_WIDTH*2, yp, type);
    }
  }

  //
  boolean isCollideBall(Ball ball) {

    Bloc item=null;
    int state=0;

    for (int row=0; row <NB_ROW; row++)
    {
      for (int col=0; col<NB_COL; col++)
      {
        item=tabBlocs[row][col];
        state= item.getState();

        if (item!= null && state==Bloc.BLOC_STATE_VISIBLE)
        {
          if (item.isCollide(ball))
          {
            item.setState(Bloc.BLOC_STATE_TOUCHED);
            nbBlocs--;
            return true;
          }
        }
      }
    }


    return false;
  }

  //
  boolean isAllDestroy() {
    if (nbBlocs==0)
    {
      newWave();
      nbBlocs=NB_COL*NB_ROW;
      return true;
    }
    return false;
  }

  //
  void newWave() {
    Bloc item=null;

    for (int row=0; row <NB_ROW; row++)
    {
      for (int col=0; col<NB_COL; col++)
      {
        item=tabBlocs[row][col];
        item.setState(Bloc.BLOC_STATE_VISIBLE);
      }
    }
  }

  //
  void render() {
    for (int row=0; row <NB_ROW; row++)
    {
      for (int col=0; col<NB_COL; col++)
      {
        Bloc item=tabBlocs[row][col];
        item.render();
      }
    }
  }
}
