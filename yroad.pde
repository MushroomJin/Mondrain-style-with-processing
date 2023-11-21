class yroad{
  //parameters
  float loc;
  float start,end;
  
  yroad(float locin,float startin,float endin){
    loc=locin;
    start=startin;
    end=endin;
  }
  
  yroad(){
   if(yroad_num<yroad_max){
    if(yroad_num==0){
      loc = random(0,width-road_width);
      yroad_num++;
      start = 0;
      end = height;
    }
    else{
      if(build_num==0){
        boolean cross_flag = true;
        while(cross_flag){
          se();
          loc = random(0,height-road_width);
          cross_flag = false;
          for(int i=0;i<yroad_num;i++){
            yroad temy = new yroad(loc,start,end);
            if(crossing(Yrs.get(i),temy)){cross_flag=true;break;}}
          if(tem_index1!=-1){
            yroad temy = new yroad(loc,start,end);
            if(crossing(Xrs.get(tem_index1),temy)){}else{cross_flag=true;}}
          if(tem_index2!=xroad_num){
            yroad temy = new yroad(loc,start,end);
            if(crossing(Xrs.get(tem_index2),temy)){}else{cross_flag=true;}}
        }
        yroad_num++;
      }
      else{
        boolean cross_flag = true;
        while(cross_flag){
          se();
          loc = random(0,height-road_width);
          cross_flag = false;
          for(int i=0;i<build_num;i++){
            yroad temy = new yroad(loc,start,end);
            if(crossing(temy,builds.get(i))){cross_flag=true;break;}}
          for(int i=0;i<yroad_num;i++){
            yroad temy = new yroad(loc,start,end);
            if(crossing(Yrs.get(i),temy)){cross_flag=true;break;}}
          if(tem_index1!=-1){
            yroad temy = new yroad(loc,start,end);
            if(crossing(Xrs.get(tem_index1),temy)){}else{cross_flag=true;}}
          if(tem_index2!=xroad_num){
            yroad temy = new yroad(loc,start,end);
            if(crossing(Xrs.get(tem_index2),temy)){}else{cross_flag=true;}}
        }
        yroad_num++;
      }
    }
   }
   makecars();
  }
  
  
  void show(){
    noStroke();
    fill(road_color);
    if(start<end){
      rect(loc,start,road_width,end-start);}
    else{
      rect(loc,end,road_width,start-end);}
  }
  
  
  void se(){
   tem_index1 = -1;
   tem_index2 = xroad_num;
   if(xroad_num>2){
     if(random(0,100)<crossend_pop){
       int start_index = floor(random(-1,xroad_num-0.0001));
       if(start_index==-1){start = 0;}
       else{start = Xrs.get(start_index).loc+road_width-0.0001;}
       int end_index = floor(random(start_index+1,xroad_num+0.9999));
       if(end_index==xroad_num){end = width;}
       else{end = Xrs.get(end_index).loc+0.0001;}
       tem_index1 = start_index;
       tem_index2 = end_index;
     }
     else{
       start = 0;
       end = height;
     }
   }
   else
   {
     start = 0;
     end = height;
   }
  }
  
  void makecars(){
    float gone=0;
    float distance = end-start;
    while(gone<distance){
      gone += random(road_width,road_width*5);
      Cars.add(new car(gone,loc,loc,start,end-road_width));
    }
  }
  
}
