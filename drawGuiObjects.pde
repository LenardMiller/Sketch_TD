void drawGuiObjects(ArrayList<Tower> towers, ArrayList<Icon> icons){
  if (towers.size() == 0){ //force deactivation if no towers
    sellButton.active = false;  
    targetButton.active = false;
    repairButton.active = false;
  }  
  //switch tower tab button, jumps to ucMain
  towerTabButton.icMain(icons, 0);
  //sell button, jumps to icMain
  sellButton.icMain(icons, 0);
  //target priority button, jumps to icMain
  targetButton.icMain(icons, 0);
  //repair wall button, jumps to icMain
  repairButton.icMain(icons, 0);
  //currently selected, jumps to sMain
  if (towers.size() != 0){
    selection.sMain();
  }
  //icons, jumps to icMain
  for (int i = icons.size()-1; i >= 0; i--){
    Icon icon = icons.get(i);
    icon.icMain(icons, i);
  }
}  
