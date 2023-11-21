import controlP5.*;

//graphic changable parameters
int xroad_max         = 8;
int yroad_max         = 8;
int build_max         = 14;
int max_random        = 1;
float road_width      = 15;
float build_large     = 200;
color bgc             = #FFFCE8;
int show_speed        = 1000;
float road_dis        = road_width*3;
float crossend_pop    = 100;//%
float speed           = 0;
float speed_fix       = 3;

//storage
ArrayList<car> Cars;
ArrayList<xroad> Xrs;
ArrayList<yroad> Yrs;
ArrayList<building> builds;
int xroad_num = 0;
int yroad_num = 0;
int build_num = 0;
int car_num =0;
color road_color = #F0DA30;
int tem_index1,tem_index2;
color[] colors;

ControlP5 cp5;
Button but;
boolean button_state=false;



void setup(){
  size(800,800);
  colors = new color[4];
  colors[0] = #FA5B8D;
  colors[1] = #EFE1F7;
  colors[2] = #F08141;
  colors[3] = #8EC5FF;
  
  cp5 = new ControlP5(this);
  but = cp5.addButton("button_start");
  but.setPosition(20,20).setSize(100,40);
  but.setLabel("START");
  but.setColorBackground(#FF9843);
  but.setColorActive(#FFC85A);
  but.setColorForeground(#FFC85A);
  
  
  xroad_max += floor(random(0-max_random,max_random+0.99999));
  print("x_max = ");
  println(xroad_max);
  yroad_max += floor(random(0-max_random,max_random+0.99999));
  print("y_max = ");
  println(yroad_max);
  build_max += floor(random(0-max_random,max_random+0.99999));
  print("build_max = ");
  println(build_max);
  builds = new ArrayList<building>();
  Xrs = new ArrayList<xroad>();
  Yrs = new ArrayList<yroad>();
  Cars = new ArrayList<car>();
  for(int i=0;i<min(xroad_max,yroad_max);i++){
    Xrs.add(new xroad());
    Yrs.add(new yroad());
  }
  for(int i=min(xroad_max,yroad_max);i<max(xroad_max,yroad_max);i++){
    if(xroad_max>yroad_max){Xrs.add(new xroad());}
    if(yroad_max>xroad_max){Yrs.add(new yroad());}
  }
  for(int i=0;i<build_max;i++){
    builds.add(new building());
  }
}

void draw(){
  background(bgc);
  check_button();
  
  for(int i=0;i<xroad_num;i++){
    Xrs.get(i).show();
  }
  for(int i=0;i<yroad_num;i++){
    Yrs.get(i).show();
  }
  for(int i=0;i<build_num;i++){
    builds.get(i).show();
  }
  for(int i=0;i<car_num;i++){
    Cars.get(i).move();
    Cars.get(i).show();
  }
  surface.setTitle(frameRate+"");
  saveFrame("frames/####.tif");
}

void check_button(){
  boolean new_state=but.getBooleanValue();
  if(new_state!=button_state){
    if(new_state){
      println("start");
      but.setColorBackground(#4399FF);
      but.setColorActive(#A5CEFF);
      but.setColorForeground(#A5CEFF);
      but.setLabel("PAUSE");
      speed = speed_fix;}
    else{
      println("pause");
      but.setColorBackground(#FF9843);
      but.setColorActive(#FFC85A);
      but.setColorForeground(#FFC85A);
      but.setLabel("START");
      speed = 0;}
    button_state=new_state;
  }
}
