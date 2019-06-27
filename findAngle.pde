void findAngle(PVector p1, PVector p2){
    PVector ratio = PVector.sub(p1,p2);
    float angle = 0;
    if (p2.x == p1.x){ //if on the same x
       if (p2.y >= p1.y){ //if below target or on same y, angle right
         angle = 0;
       }
       else if (p2.y < p1.y){ //if above target, angle left
         angle = PI;
       }
    }
    else if (p2.y == p1.y){ //if on same y
       if (p2.x > p1.x){ //if  right of target, angle down
         angle = 3*HALF_PI;
       }
       else if (p2.x < p1.x){ //if left of target, angle up
         angle = HALF_PI;
       }
    }
    else{
      if (p2.x < p1.x && p2.y > p1.y){ //if to left and below NOT WORKING
        angle = (atan(abs(ratio.x+15)/abs(ratio.y)));
      }
      else if (p2.x < p1.x && p2.y < p1.y){ //if to left and above
        angle = (atan(abs(ratio.y)/abs(ratio.x))) + HALF_PI;
      }
      else if (p2.x > p1.x && p2.y < p1.y){ //if to right and above NOT WORKING
        angle = (atan(abs(ratio.x+15)/abs(ratio.y))) + PI;
      }
      else if (p2.x > p1.x && p2.y > p1.y){ //if to right and below
        angle = (atan(abs(ratio.y)/abs(ratio.x))) + 3*HALF_PI;
      }
    }
    angle -= HALF_PI;
  } 
