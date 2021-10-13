float tetha = 0;
int circlesnumX = 5, circlesnumY = 5, x = 0, y =0;
float size = 1;
float details = 100;
float startspeedX = 1, startspeedY = 5;
boolean showspeed = true;

void setup() {
 background(0, 0, 0);   
 size(1280,1280);
 frameRate(144);
}

void draw() {
 background(0);
 tetha += 0.01;
 x = 1;
 y = 1;
 while (x < circlesnumX+1) { //Cercles X
  stroke(255);
  fill(0);
  ellipse((150 + 150 * x) * size,100 * size,100 * size,100 * size);
  line(((sin(tetha * (x + startspeedX))*50) + 150 + 150 * x) * size,0,((sin(tetha * (x + startspeedX))*50)+150 + 150 * x) * size,height);
  fill(255);
  ellipse(((sin(tetha * (x + startspeedX))*50) + 150 + 150 * x) * size, ((cos(tetha * (x + startspeedX))*50) + 100) * size,10 * size,10 * size);
  x++;
 }
 
 while (y < circlesnumY + 1) { //Cercles Y
  stroke(255);
  fill(0);
  ellipse(150 * size, (100 + 150 * y) * size, 100 * size, 100 * size);
  line(0,((cos(tetha * (y + startspeedY))*50) + 100 + 150 * y) * size, width, ((cos(tetha * (y + startspeedY))*50) + 100 + 150 * y) * size);
  fill(255);
  ellipse(((sin(tetha * (y + startspeedY))*50) + 150) * size,((cos(tetha * (y + startspeedY))*50) + 100 + 150 * y) * size,10 * size,10 * size);
  y++;
 }
 
 x = 1;
 while (x < circlesnumX + 1) {
    y = 1;
  while (y < circlesnumY + 1) {
    stroke(255);
    ellipse((sin(tetha * (x + startspeedX)) * 50 + 150 + 150 * x) * size, (cos(tetha * (y + startspeedY)) * 50 + 100 + 150 * y) * size, 10 * size, 10 * size);
    
    for (int i = 0; i < details; i++) { //Traçage des trajectoires
      if (showspeed == true) {
        stroke(abs(cos((tetha + i/details * TWO_PI) * (x + startspeedX))) * 255, abs(sin((tetha + i/details * TWO_PI) * (x + startspeedX))) * 255, 0);
      } else {
        stroke(255);
      }
      line((sin((tetha + i/details * TWO_PI) * (x + startspeedX)) * 50 + 150 + 150 * x) * size, (cos((tetha + i/details * TWO_PI) * (y + startspeedY)) * 50 + 100 + 150 * y) * size,
      (sin((tetha + (i + 1)/details * TWO_PI) * (x + startspeedX)) * 50 + 150 + 150 * x) * size, (cos((tetha + (i + 1)/details * TWO_PI) * (y + startspeedY)) * 50 + 100 + 150 * y) * size);
    }
    y++;
  }
  x++;
 }
}
