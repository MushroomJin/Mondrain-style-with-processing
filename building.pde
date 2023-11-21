class building{
  //parameters
  float bx,by;
  float blength,bheight;
  color[] bcolor;
  int type;
  //type-0:pure
  //type-1:one block
  //type-2:one line
  //type-3:one block and one line
  //type-4:two layers of block
  int directon;
  //up0
  //down1
  //left2
  //right3
  
  building(float xin,float yin,float lengthin,float heightin){
    bx = xin;
    by = yin;
    blength = lengthin;
    bheight = heightin;
  }
  
  building(){if(build_num<build_max){
    float cx,cy;
    type = floor(random(0,4.9999));
    directon = floor(random(0,3.9999));
    //print("type=");
    //println(type);
    //print("dir=");
    //println(directon);
    boolean redo_flag = true;
    float x1 = 0;
    float x2 = width;
    float y1 = 0;
    float y2 = height;
    cx = random(0,width);
    cy = random(0,height);
    
    
    while(redo_flag){
      redo_flag=false;
      cx = random(0,width);
      cy = random(0,height);
      x1 = 0;
      x2 = width;
      y1 = 0;
      y2 = height;
      for(int i=0;i<xroad_num;i++){
        if(crossing(cx,cy,Xrs.get(i))){
          redo_flag = true;break;}
        else{
         if(Xrs.get(i).start<=cx){
         if(Xrs.get(i).end>=cx){
          if(Xrs.get(i).loc+road_width<cy){y1 = max(y1,Xrs.get(i).loc+road_width);}
          if(Xrs.get(i).loc>cy){y2 = min(y2,Xrs.get(i).loc);}}
        }}}
      for(int i=0;i<yroad_num;i++){
        if(crossing(cx,cy,Yrs.get(i))){
          redo_flag = true;break;}
        else{
         if(Yrs.get(i).start<=cy){
         if(Yrs.get(i).end>=cy){
          if(Yrs.get(i).loc+road_width<cx){x1 = max(x1,Yrs.get(i).loc+road_width);}
          if(Yrs.get(i).loc>cx){x2 = min(x2,Yrs.get(i).loc);}}
        }}}
      for(int i=0;i<build_num;i++){
        if(crossing(cx,cy,builds.get(i))){
          redo_flag = true;break;}}
      if(redo_flag!=true){
        building temb = new building(x1,y1,x2-x1,y2-y1);
        for(int i=0;i<build_num;i++){
          if(crossing(temb,builds.get(i))){redo_flag = true;break;}
        }
      }
    }
    if(x2-x1<y2-y1){
      blength = x2-x1;
      bx = x1;
      bheight = random(road_width*1.5,blength);
      if(y2-cy>cy-y1){
        if(cy-y1>bheight){by = y1;}
        else{by = cy-bheight/2;}}
      else{
        if(y2-cy>bheight){by = y2-bheight;}
        else{by = cy-bheight/2;}}
    }
    else{
      bheight = y2-y1;
      by = y1;
      blength = random(road_width*1.5,bheight);
      if(x2-cx>cx-x1){
        if(cx-x1>blength){bx = x1;}
        else{bx = cx-blength/2;}}
      else{
        if(x2-cx>blength){bx = x2-blength;}
        else{bx = cx-blength/2;}}
    }
    
    bcolor = new color[3];
    int i1,i2,i3;
    i1 = floor(random(0,3.9999));
    i2 = floor(random(0,3.9999));
    i3 = floor(random(0,3.9999));
    while(i2==i1){i2 = floor(random(0,3.9999));}
    if(type==3){
      while(i3==i1){i3 = floor(random(0,3.9999));}}
    if(type==4){
      while(i3==i2){i3 = floor(random(0,3.9999));}}
    bcolor[0]=colors[i1];
    bcolor[1]=colors[i2];
    bcolor[2]=colors[i3];
    
    build_num++;
  }}
  
  void show(){
    noStroke();
    fill(bcolor[0]);
    rect(bx,by,blength,bheight);
    switch(type){
      case 0:break;
      case 1:{
             float cx = bx+blength/2;
             float cy = by+bheight/2;
             fill(bcolor[1]);
             if(directon<2){
               rect(cx-blength/4,cy-bheight/6,blength/2,bheight/3);}
             else{rect(cx-blength/6,cy-bheight/4,blength/3,bheight/2);}
             break;}
      case 2:{
             fill(bcolor[1]);
             switch(directon){
               case 0:{rect(bx,by,blength,road_width);break;}
               case 1:{rect(bx,by+bheight-road_width,blength,road_width);break;}
               case 2:{rect(bx,by,road_width,bheight);break;}
               case 3:{rect(bx+blength-road_width,by,road_width,bheight);break;}
             }break;}
      case 3:{
             fill(bcolor[1]);
             switch(directon){
               case 0:{rect(bx,by,blength,road_width);
                       float cx=bx+blength/2;
                       float cy=by+road_width+(bheight-road_width)/2;
                       float l1=blength;
                       float h1=bheight-road_width;
                       fill(bcolor[2]);
                       rect(cx-l1/4,cy-h1/6,l1/2,h1/3);
                       break;}
               case 1:{rect(bx,by+bheight-road_width,blength,road_width);
                       float cx=bx+blength/2;
                       float cy=by+(bheight-road_width)/2;
                       float l1=blength;
                       float h1=bheight-road_width;
                       fill(bcolor[2]);
                       rect(cx-l1/4,cy-h1/6,l1/2,h1/3);
                       break;}
               case 2:{rect(bx,by,road_width,bheight);
                       float cx=bx+road_width+(blength-road_width)/2;
                       float cy=by+bheight/2;
                       float l1=blength-road_width;
                       float h1=bheight;
                       fill(bcolor[2]);
                       rect(cx-l1/6,cy-h1/4,l1/3,h1/2);
                       break;}
               case 3:{rect(bx+blength-road_width,by,road_width,bheight);
                       float cx=bx+(blength-road_width)/2;
                       float cy=by+bheight/2;
                       float l1=blength-road_width;
                       float h1=bheight;
                       fill(bcolor[2]);
                       rect(cx-l1/6,cy-h1/4,l1/3,h1/2);
                       break;}}}
      case 4:{
             if(directon<2){
               fill(bcolor[1]);
               float cx = bx+blength/2;
               float cy = by+bheight/2;
               rect(cx-blength/2,cy-bheight/4,blength,bheight/2);
               fill(bcolor[2]);
               rect(cx-blength/4,cy-bheight/8,blength/2,bheight/4);}
             else{
               fill(bcolor[1]);
               float cx = bx+blength/2;
               float cy = by+bheight/2;
               rect(cx-blength/4,cy-bheight/2,blength/2,bheight);
               fill(bcolor[2]);
               rect(cx-blength/8,cy-bheight/4,blength/4,bheight/2);}
               break;}
    }
  }
  
  
}
