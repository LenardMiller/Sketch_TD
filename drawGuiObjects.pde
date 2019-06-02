void drawGuiObjects(ArrayList<Tower> towers, ArrayList<Icon> icons){
  if (towers.size() == 0){ //force deactivation if no towers
    sellButton.active = false;  
    targetButton.active = false;
    repairButton.active = false;
    upgradeButtonZero.active = false;
    upgradeButtonOne.active = false;
    upgradeIconZero.active = false;
    upgradeIconOne.active = false;
  }  
  towerTabButton.icMain(icons, 0);
  sellButton.icMain(icons, 0);
  targetButton.icMain(icons, 0);
  repairButton.icMain(icons, 0);
  upgradeButtonZero.icMain(icons, 0);
  upgradeButtonOne.icMain(icons, 0);
  upgradeIconZero.icMain(icons, 0);
  upgradeIconOne.icMain(icons, 0);
  if (towers.size() != 0){
    selection.sMain();
  }
  for (int i = icons.size()-1; i >= 0; i--){
    Icon icon = icons.get(i);
    icon.icMain(icons, i);
  }
}  
