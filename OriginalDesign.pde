int hratio = 10;
boolean directionup = true;
ArrayList<mrectangle> rectarray = new ArrayList<mrectangle>();
void setup(){
frameRate(90);
size(1200,600);
int x = 0;
int offset = 0;
boolean direction = true;
int index = 0;
boolean colordirection = true;
while(x < 45){
rectarray.add(new mrectangle(offset,50,50*x - 550,direction,0,index,colordirection));
rectarray.add(new mrectangle(offset,50,50*x - 50 ,direction,100,index,colordirection));
rectarray.add(new mrectangle(offset,50,50*x - 550,direction,200,index,colordirection));
rectarray.add(new mrectangle(offset,50,50*x - 50 ,direction,300,index,colordirection));
rectarray.add(new mrectangle(offset,50,50*x - 550,direction,400,index,colordirection));
rectarray.add(new mrectangle(offset,50,50*x - 50,direction,500,index,colordirection));
x = x+1;
if(direction){
offset = offset + 10;
if(offset >= 100){
direction = false;
}
} else{
  offset = offset - 10;
if(offset <= 0){
direction = true;
}
}
if(colordirection){
index = index + 1;
if(index >= 24){
colordirection = false;
}
} else{
  index = index - 1;
int y = 0;
if(index <= 1){
colordirection = true;
}
}
}
}
void draw(){
  background(137);
  for(mrectangle arect : rectarray){
  arect.move();
  arect.display();
  }
}
class mrectangle{
  int[] colorarrayr = {0,255,255,255,255,255,255,255,255,255,255,127,127,0,0  ,0,0   ,0,0  ,37,37 ,75,75,112,112,148,148};
  int[] colorarrayg = {0,0,0  ,64,64 ,127,127,191,191,255,255,255,255,255,255,127,127 ,0,0  ,0,0  ,0,0 ,0,0,0,0};
  int[] colorarrayb = {0,0,0  ,0,0  ,0,0  ,0,0  ,0,0  ,0,0  ,0,0  ,127,127,255,255,190,190,130,130,170,170,211,211};
  int index;
  boolean colortype;
  int offset;
  int spacing;
  int x;
  boolean up;
  int y;
  int colorchange = 0;
mrectangle(int a, int b, int c, boolean d, int e, int f,boolean g){
   offset = a;
   spacing = b;
   x = c;
   up = d;
   y = e;
   index = f;
   colortype = g;
  rect(x,y + offset/2, spacing, 100-offset);
}
void move(){
  if(up){
  offset = offset + 1;
  if(offset >= 100){
  up = false;  
  }
  } else{
  offset = offset - 1;
  if(offset <= 0){
  up = true;
  }
  }
  
}
void display(){
  if(colorchange > 3){
  if(colortype){
  index = index + 1;
  if(index >= 24){
  colortype = false;
  }
  }else{
  index = index - 1;
  if(index <= 1){
  colortype = true;
  }
  }
  colorchange = 0;
  } else{
  colorchange = colorchange + 1;
  }
  fill(colorarrayr[index],colorarrayg[index],colorarrayb[index]);
  rect(x,y + offset/2, spacing, 100-offset);
}
}
