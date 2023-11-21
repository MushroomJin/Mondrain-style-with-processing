class xroad{
  //parameters
  float loc;
  float start,end;
  
  xroad(float locin,float startin,float endin){
    loc=locin;
    start=startin;
    end=endin;
  }
  
  xroad(){
   if(xroad_num<xroad_max){
    if(xroad_num==0){
      loc = random(0,height-road_width);
      xroad_num++;
      start = 0;
      end = width;
    }
    else{
      if(build_num==0){
        boolean cross_flag = true;
        while(cross_flag){
          se();
          loc = random(0,height-road_width);
          cross_flag = false;
          for(int i=0;i<xroad_num;i++){
            xroad temx = new xroad(loc,start,end);
            if(crossing(Xrs.get(i),temx)){cross_flag=true;break;}}
          if(tem_index1!=-1){
            xroad temx = new xroad(loc,start,end);
            if(crossing(temx,Yrs.get(tem_index1))){}else{cross_flag=true;}}
          if(tem_index2!=yroad_num){
            xroad temx = new xroad(loc,start,end);
            if(crossing(temx,Yrs.get(tem_index2))){}else{cross_flag=true;}}
        }
        xroad_num++;
      }
      else{
        boolean cross_flag = true;
        while(cross_flag){
          se();
          loc = random(0,height-road_width);
          cross_flag = false;
          for(int i=0;i<build_num;i++){
            xroad temx = new xroad(loc,start,end);
            if(crossing(temx,builds.get(i))){cross_flag=true;break;}}
          for(int i=0;i<xroad_num;i++){
            xroad temx = new xroad(loc,start,end);
            if(crossing(Xrs.get(i),temx)){cross_flag=true;break;}}
          if(tem_index1!=-1){
            xroad temx = new xroad(loc,start,end);
            if(crossing(temx,Yrs.get(tem_index1))){}else{cross_flag=true;}}
          if(tem_index2!=yroad_num){
            xroad temx = new xroad(loc,start,end);
            if(crossing(temx,Yrs.get(tem_index2))){}else{cross_flag=true;}}
        }
        xroad_num++;
      }
    }
   }
   makecars();
  }
  
  
  void show(){
    noStroke();
    fill(road_color);
    if(start<end){
      rect(start,loc,end-start,road_width);}
    else{
      rect(end,loc,start-end,road_width);}
  }
  
  void se(){
   tem_index1 = -1;
   tem_index2 = yroad_num;
   if(yroad_num>2){
     if(random(0,100)<crossend_pop){
       int start_index = floor(random(-1,yroad_num-0.0001));
       if(start_index==-1){start = 0;}
       else{start = Yrs.get(start_index).loc+road_width-0.0001;}
       int end_index = floor(random(start_index+1,yroad_num+0.9999));
       if(end_index==yroad_num){end = width;}
       else{end = Yrs.get(end_index).loc+0.0001;}
       tem_index1 = start_index;
       tem_index2 = end_index;
     }
     else{
       start = 0;
       end = width;
     }
   }
   else
   {
     start = 0;
     end = width;
   }
  }
  
  void makecars(){
    float gone=0;
    float distance = end-start;
    while(gone<distance){
      gone += random(road_width,road_width*5);
      Cars.add(new car(gone,start,end-road_width,loc,loc));
    }
  }
  
}
