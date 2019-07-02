class HeapFloat{
  int maxCount;
  int currentCount;
  ItemFloat[] items;
  HeapFloat(int maxCount){
    this.maxCount = maxCount;
    items = new ItemFloat[maxCount];
  }
  void addItem(ItemFloat item){
    items[currentCount] = item;
    item.index = currentCount;
    sortUp(item);
    currentCount++;
  }
  ItemFloat removeFirstItem(){
    ItemFloat first = items[0];
    currentCount--;
    items[0] = items[currentCount];
    items[0].index = 0;
    sortDown(items[0]);
    return first;
  }  
  void updateItem(ItemFloat item){
    sortUp(item);
  }  
  boolean contains(ItemFloat item){
    return (items[item.index] == item);
  }  
  void sortDown(ItemFloat item){
    while(true){
      int childIndexA = item.index*2+1;
      int childIndexB = item.index*2+2;
      int swapIndex = 0;
      if (childIndexA < currentCount){
        swapIndex = childIndexA;
        if (childIndexB < currentCount){
          if (items[childIndexA].value > items[childIndexB].value){
             swapIndex = childIndexB; 
          }  
        }
        if (item.value > items[swapIndex].value){
            swap(item,items[swapIndex]);
        }  
        else{
          return;  
        }  
      }
      else{
        return;  
      }  
    }  
  }  
  void sortUp(ItemFloat item){
    int parentIndex = (item.index-1)/2;
    while(true) {
      ItemFloat parent = items[parentIndex];
      if (item.value < parent.value){
        swap(item,parent);
      }  
      else{
        break;
      }
      parentIndex = (item.index-1)/2;
    }  
  } 
  void swap(ItemFloat a, ItemFloat b){
    items[a.index] = b;
    items[b.index] = a;
    int aIndex = a.index;
    a.index = b.index;
    b.index = aIndex;
  }  
}  
class ItemFloat{
  ItemFloat parent;
  ItemFloat childA;
  ItemFloat childB;
  float value;
  int index;
  ItemFloat(float value){
    this.value = value;
  }  
}  
