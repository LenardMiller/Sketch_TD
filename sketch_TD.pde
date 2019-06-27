import java.util.Map;

Enemy enemy;
ArrayList<Enemy> enemies;
EnemyTracker enTrak;
Tower tower;
ArrayList<Tower> towers;
Projectile projectile;
ArrayList<Projectile> projectiles;
Particle particle;
ArrayList<Particle> particles;
Icon icon;
ArrayList<Icon> icons;
Buff buff;
ArrayList<Buff> buffs;
Icon towerTabButton;
Icon sellButton;
Icon targetButton;
Icon repairButton;
Icon upgradeButtonZero;
Icon upgradeButtonOne;
Icon upgradeIconZero;
Icon upgradeIconOne;
Hand hand;
Selection selection;
CompressArray compress;
int backRed = 25;
int redSpeed = 8;
float enSize;
float enSpeed;
int enHp;
PFont FEFont;
PFont TFFont;
PFont ETFont;
PFont TWFont;
int Hp = 2000;
int money = 2000;
boolean alive = true;
int boardWidth = 700;
int boardHeight = 900;
HashMap<String,PImage> spritesH = new HashMap<String,PImage>();
HashMap<String,PImage[]> spritesAnimH = new HashMap<String,PImage[]>();
//pathfinding stuff
Node[][] nodeGrid;
HeapNode openNodes;
Node start;
Node[] end;
AStar path;
Fuzzer fuzz;
int nSize;
int numEnd;

void settings(){
  size(900, 900);
}

void setup(){
  //creates ArrayLists
  enemies = new ArrayList<Enemy>();
  enTrak = new EnemyTracker();
  towers = new ArrayList<Tower>();
  projectiles = new ArrayList<Projectile>();
  particles = new ArrayList<Particle>();
  icons = new ArrayList<Icon>();
  buffs = new ArrayList<Buff>();
  hand = new Hand();
  selection = new Selection();
  //loads font (default STHeitiSC-Light)
  FEFont = createFont("STHeitiSC-Light", 48);
  TFFont = createFont("STHeitiSC-Light", 24);
  ETFont = createFont("STHeitiSC-Light", 18);
  TWFont = createFont("STHeitiSC-Light", 12);
  //loads sprites
  loadSprites();
  loadSpritesAnim();
  //create gui
  gui();
  //pathfinding stuff
  nSize = 10;
  nodeGrid = new Node[boardWidth/nSize][boardHeight/nSize];
  for (int x = 0; x < boardWidth/nSize; x++){
    for (int y = 0; y < boardHeight/nSize; y++){
      nodeGrid[x][y] = new Node(new PVector(nSize*x,nSize*y));
    }  
  }
  path = new AStar();
  openNodes = new HeapNode(int(sq(boardWidth/nSize)));
  end = new Node[int(sq(1000/nSize))];
  nodeGrid[(boardWidth/nSize)-2][(boardHeight/nSize)/2].setEnd((boardWidth/nSize)-2,(boardHeight/nSize)/2);
  nodeGrid[1][(boardWidth/nSize)/2].setStart(1,(boardHeight/nSize)/2);
  start.findGHF();
  for (int i = 0; i < numEnd; i++){
    end[i].findGHF();
  }
  updateNodes(start);
  updatePath();
  
}

void draw(){
  //bg
  noStroke();
  fill(backRed,25,25);
  rect(0, 0, boardWidth, boardHeight);
  backRed -= redSpeed;
  //keys
  debugKeys();
  spawnKeys();
  //pathfinding
  if (path.reqQ.size() > 0){
    path.reqQ.get(0).getPath();
    path.reqQ.remove(0);
  }
  //self explanitory
  drawObjects(enemies,projectiles,towers,particles,buffs);
  //bg part 2: red (this will need to be redone when bg textures are thrown in)
  if (backRed < 25 ){
        backRed = 25;
        redSpeed = 8;
  }
  //gui stuff
  noStroke();
  fill(200);
  rect(boardWidth, 0, boardWidth + 250, boardHeight);
  drawGuiObjects(towers,icons);
  //text
  textAlign(LEFT);
  drawType(10);
}
