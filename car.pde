class car{
  float kx,ky;
  float x_start,x_end;
  float y_start,y_end;
  int dircetion;
  color kcolor;
  int level;
  
  
  car(float gone,float x1,float x2,float y1,float y2){
    if(x1==x2){
      kx = x1;
      ky = y1 + gone;
      while(ky>y2){ky=ky-y2+y1;}
    }
    if(y1==y2){
      ky = y1;
      kx = x1 + gone;
      while(kx>x2){kx=kx-x2+x1;}
    }
    x_start = x1;
    x_end = x2;
    y_start = y1;
    y_end = y2;
    dircetion = floor(random(0,1.999))*2-1;
    kcolor = colors[floor(random(0,3.999))];
    level = 0;
    car_num++;
  }
  
  void move(){
    if(x_start==x_end){
      ky += speed*dircetion;
      while(ky>y_end){ky=ky-y_end+y_start;}
      while(ky<y_start){ky=ky+y_end-y_start;}
    }
    if(y_start==y_end){
      kx += speed*dircetion;
      while(kx>x_end){kx=kx-x_end+x_start;}
      while(kx<x_start){kx=kx+x_end-x_start;}
    }
    if(level<show_speed){level++;}
  }
  
  void show(){
    noStroke();
    fill(kcolor);
    rect(kx,ky,road_width,road_width);
  }
  
}
