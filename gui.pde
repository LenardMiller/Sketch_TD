void gui(){ //gui icons & buttons
  //add money & add lives buttons
  icons.add(new AddHpButton(boardWidth + 22.5,17.5,"null",true));
  icons.add(new AddMoneyButton(boardWidth + 22.5,47.5,"null",true));
  //money and lives icons
  icons.add(new Icon(boardWidth + 57.5, 17.5,"livesIc",true));
  icons.add(new Icon(boardWidth + 57.5, 47.5,"moneyIc",true));
  //buy tower buttons tab 1 (4-18)
  icons.add(new TowerBuy(boardWidth + 21.5, 87,"slingshot",false)); //row 1
  icons.add(new TowerBuy(boardWidth + 60.5, 87,"crossbow",false));
  icons.add(new TowerBuy(boardWidth + 101.5, 87,"randomCannon",false));
  icons.add(new TowerBuy(boardWidth + 140.5, 87,"null",false)); //placeholders
  icons.add(new TowerBuy(boardWidth + 179.5, 87,"null",false));
  icons.add(new TowerBuy(boardWidth + 21.5, 127,"null",false)); //row 2
  icons.add(new TowerBuy(boardWidth + 60.5, 127,"null",false));
  icons.add(new TowerBuy(boardWidth + 101.5, 127,"null",false));
  icons.add(new TowerBuy(boardWidth + 140.5, 127,"null",false));
  icons.add(new TowerBuy(boardWidth + 179.5, 127,"null",false));
  icons.add(new TowerBuy(boardWidth + 21.5, 167,"null",false)); //row 3
  icons.add(new TowerBuy(boardWidth + 60.5, 167,"null",false));
  icons.add(new TowerBuy(boardWidth + 101.5, 167,"null",false));
  icons.add(new TowerBuy(boardWidth + 140.5, 167,"null",false));
  icons.add(new TowerBuy(boardWidth + 179.5, 167,"null",false));
  //buy tower buttons tab 2 (19-33)
  icons.add(new TowerBuy(boardWidth + 21.5, 87,"woodWall",true)); //row 1
  icons.add(new TowerBuy(boardWidth + 60.5, 87,"stoneWall",true));
  icons.add(new TowerBuy(boardWidth + 101.5, 87,"metalWall",true)); 
  icons.add(new TowerBuy(boardWidth + 140.5, 87,"crystalWall",true)); 
  icons.add(new TowerBuy(boardWidth + 179.5, 87,"null",true)); //placeholders
  icons.add(new TowerBuy(boardWidth + 21.5, 127,"null",true)); //row 2
  icons.add(new TowerBuy(boardWidth + 60.5, 127,"null",true));
  icons.add(new TowerBuy(boardWidth + 101.5, 127,"null",true));
  icons.add(new TowerBuy(boardWidth + 140.5, 127,"null",true));
  icons.add(new TowerBuy(boardWidth + 179.5, 127,"null",true));
  icons.add(new TowerBuy(boardWidth + 21.5, 167,"null",true)); //row 3
  icons.add(new TowerBuy(boardWidth + 60.5, 167,"null",true));
  icons.add(new TowerBuy(boardWidth + 101.5, 167,"null",true));
  icons.add(new TowerBuy(boardWidth + 140.5, 167,"null",true));
  icons.add(new TowerBuy(boardWidth + 179.5, 167,"null",true));
  //switch tower tab button
  towerTabButton = new TowerTabButton(800,198,"null",true);
  //sell tower button
  sellButton = new SellTower(800,877.5,"null",false);
  //target priority button
  targetButton = new TargetPriority(800,832.5,"null",false);
  //repair wall button
  repairButton = new RepairWall(800,780,"null",false);
}  
