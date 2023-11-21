boolean crossing(xroad x,yroad y){
  boolean result=false;
  if(x.end>y.loc){
    if(y.loc+road_width>x.start){
      if(y.end>x.loc){
        if(x.loc+road_width>y.start){result=true;}}}}
  return result;
}

boolean crossing(xroad x1,xroad x2){
  boolean result=false;
  if(x1.end>x2.start){
    if(x2.end>x1.start){
      if(x1.loc+road_width+road_dis>x2.loc){
        if(x2.loc+road_width+road_dis>x1.loc){result=true;}}}}
  return result;
}

boolean crossing(yroad y1,yroad y2){
  boolean result=false;
  if(y1.end>y2.start){
    if(y2.end>y1.start){
      if(y1.loc+road_width+road_dis>y2.loc){
        if(y2.loc+road_width+road_dis>y1.loc){result=true;}}}}
  return result;
}

boolean crossing(xroad x,building b){
  boolean result=false;
  if(x.end>b.bx){
    float tem = b.bx+b.blength;
    if(tem>x.start){
      if(x.loc+road_width>b.by){
        tem = b.by+b.bheight;
        if(tem>x.loc){result=true;}}}}
  return result;
}


boolean crossing(yroad y,building b){
  boolean result=false;
  if(y.end>b.by){
    float tem = b.by+b.bheight;
    if(tem>y.start){
      if(y.loc+road_width>b.bx){
        tem = b.bx+b.blength;
        if(tem>y.loc){result=true;}}}}
  return result;
}


boolean crossing(building b1,building b2){
  boolean result=false;
  if(b1.bx+b1.blength>=b2.bx){
    if(b2.bx+b2.blength>=b1.bx){
      if(b1.by+b1.bheight>=b2.by){
        if(b2.by+b2.bheight>=b1.by){result=true;}}}}
  return result;
}


boolean crossing(float cx,float cy,xroad x){
  boolean result = false;
  if(cx>=x.start){
    if(cx<=x.end){
      if(cy>=x.loc){
        float tem = x.loc+road_width;
        if(cy<=tem){
          result = true;}}}}
  return result;
}

boolean crossing(float cx,float cy,yroad y){
  boolean result = false;
  if(cy>=y.start){
    if(cy<=y.end){
      if(cx>=y.loc){
        float tem = y.loc+road_width;
        if(cx<=tem){
          result = true;}}}}
  return result;
}

boolean crossing(float cx,float cy,building b){
  boolean result = false;
  if(cx>=b.bx){
    if(cy>=b.by){
      if(cx<=b.bx+b.blength){
        if(cy<=b.by+b.bheight){
          result = true;}}}}
  return result;
}
