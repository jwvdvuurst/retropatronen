


ArrayList<geoform> forms;

color bg;
int type = 0;
int size;

void setup() {
  size(800,800);
}  

void create() {
  forms = new ArrayList<geoform>();
  
  size = round(random(200))+100;
  float perc = (100+random(100))/100;
    
  int nx = floor((width / (size*perc)));
  int ny = floor((height / (size*perc)));
  
  float ox = width - (nx*(size*perc));
  float oy = height - (ny*(size*perc));
  
  float startx = ox / 2; 
  float starty = oy / 2;
  
  while (startx < 0) { startx += 10; }
  while (starty < 0) { starty += 10; }
  
  float x = startx;
  float y = starty;
    
  println( "size: "+size+" start ["+x+","+y+"] ");  
  
  float cr = random(255);
  float cg = random(255);
  float cb = random(255);
    
  float or = round(cg+random(64))%255;
  float og = round(cb+random(64))%255;
  float ob = round(cr+random(64))%255;  
  
  float avr = 255-(cr + or)/2;
  float avg = 255-(cg + og)/2;
  float avb = 255-(cb + ob)/2;
  
  bg = color(avr, avg, avb);

 
  background(bg);
  
  while( y < height ) {
    while( x < width ) {   
      
      float r1 = cr + (128/width)*x;
      float g1 = cg;
      float b1 = cb + (128/height)*y;
      
      float r2 = or - (128/height)*y;
      float g2 = og - (128/width)*x;
      float b2 = ob;

      switch(type) {
        case 0: forms.add( new vierkant(this, new PVector(x,y), size, color(r1, g1, b1), color(r2,g2,b2) ) ); break;
        case 1: forms.add( new cirkel(this, new PVector(x,y), size, color(r1, g1, b1), color(r2,g2,b2) ) ); break;
        case 2: forms.add( new flower( this, new PVector(x,y), size, color(r1, g1, b1), color(r2,g2,b2) ) ); break;
        case 3: switch( round(x) % 2 ) {
          case 0: forms.add( new cirkel(this, new PVector(x,y), size, color(r1, g1, b1), color(r2,g2,b2) ) ); break;
          case 1: forms.add( new flower( this, new PVector(x,y), size, color(r1, g1, b1), color(r2,g2,b2) ) ); break;
        }; break;
        case 4: switch( round(y) % 2 ) {
          case 0: forms.add( new vierkant(this, new PVector(x,y), size, color(r1, g1, b1), color(r2,g2,b2) ) ); break;
          case 1: forms.add( new cirkel(this, new PVector(x,y), size, color(r1, g1, b1), color(r2,g2,b2) ) ); break;
        }; break;
        case 5: switch( round(x+y) % 3 ) {
          case 0: forms.add( new vierkant(this, new PVector(x,y), size, color(r1, g1, b1), color(r2,g2,b2) ) ); break;
          case 1: forms.add( new cirkel(this, new PVector(x,y), size, color(r1, g1, b1), color(r2,g2,b2) ) ); break;
          case 2: forms.add( new flower( this, new PVector(x,y), size, color(r1, g1, b1), color(r2,g2,b2) ) ); break;
        }; break;
      }
      
      x += size*perc;
    }
    
    x = startx;
    y += size*perc;    
  }  
}

void draw() {
  background(0);  

  create();  
  
  for( geoform f : forms ) {
    f.draw();
  }
  
  saveFrame("Patroon-"+type+"-"+size+"-######.png");
  
  type++;
  if (type > 5) type=0;
}
