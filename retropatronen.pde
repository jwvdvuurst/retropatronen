


ArrayList<geoform> forms;

color bg;
int type = 0;
int size;

void setup() {
  size(800, 800);
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

  while (startx < 0) {
    startx += 10;
  }
  while (starty < 0) {
    starty += 10;
  }

  float x = startx;
  float y = starty;

  println( "type: "+type+" size: "+size+" start ["+x+","+y+"]  Frame: "+frameCount);

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

  while ( y < height ) {
    while ( x < width ) {

      float r1 = cr + (128/width)*x;
      float g1 = cg;
      float b1 = cb + (128/height)*y;

      float r2 = or - (128/height)*y;
      float g2 = og - (128/width)*x;
      float b2 = ob;

      switch(type) {
      case 0:
        forms.add( new vierkant(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
        break;
      case 1:
        forms.add( new cirkel(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
        break;
      case 2:
        forms.add( new flower( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
        break;
      case 3:
        forms.add( new ring( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
        break;
      case 4:
        switch( round(x) % 2 ) {
        case 0:
          forms.add( new cirkel(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new flower( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        };
        break;
      case 5:
        switch( round(y) % 2 ) {
        case 0:
          forms.add( new vierkant(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new cirkel(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        };
        break;
      case 6:
        switch( round(x+y) % 3 ) {
        case 0:
          forms.add( new ring(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new cirkel(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 2:
          forms.add( new flower( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        };
        break;
      case 7:
        switch( round(x) % 2 ) {
        case 0:
          forms.add( new ring(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new flower( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        };
        break;
      case 8:
        switch( round(y) % 2 ) {
        case 0:
          forms.add( new ring(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new cirkel(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        };
        break;
      case 9:
        switch( round(x+y) % 3 ) {
        case 0:
          forms.add( new ring(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new cirkel(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 2:
          forms.add( new flower( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        };
        break;
      case 10:
        switch( round(x+y)%2 ) {
        case 0:
          forms.add( new flower( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new ringflower( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        };
        break;
      case 11:
        forms.add( new cirkel(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
        break;
      case 12:
        forms.add( new fractalflower( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2), 4 ) );
        break;
      case 13:
        forms.add( new ring( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
        break;
      case 14:
        switch( round(x) % 2 ) {
        case 0:
          forms.add( new flower(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new fractalflower( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2), 4 ) );
          break;
        };
        break;
      case 15:
        switch( round(y) % 2 ) {
        case 0:
          forms.add( new vierkant(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new cirkel(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        };
        break;
      case 16:
        switch( round(x+y) % 3 ) {
        case 0:
          forms.add( new vierkant(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new cirkel(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 2:
          forms.add( new fractalflower( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2), 4 ) );
          break;
        };
        break;
      case 17:
        switch( round(x) % 2 ) {
        case 0:
          forms.add( new ringflower(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new fractalflower( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2), 4 ) );
          break;
        };
        break;
      case 18:
        switch( round(y) % 2 ) {
        case 0:
          forms.add( new ring(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new cirkel(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        };
        break;
      case 19:
        switch( round(x+y) % 3 ) {
        case 0:
          forms.add( new ring(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new flower(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 2:
          forms.add( new ring( this, new PVector(x, y), size, color(r2, g2, b2), color(r1, g1, b1) ) );
          break;
        };
        break;
      case 20:
        switch( round(x+y)%2 ) {
        case 0:
          forms.add( new flower( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new ringflower( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        };
        break;
      case 21:
        forms.add( new fractalflower( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2), 6 ) );
        break;
      case 22:
        switch( round(x+y) % 3 ) {
        case 0:
          forms.add( new ring(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new ring( this, new PVector(x, y), size, color(r2, g2, b2), color(r1, g1, b1) ) );
          break;
        case 2:
          forms.add( new ring(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        };
        break;
      case 23:
        switch( round(x+y) % 3 ) {
        case 0:
          forms.add( new vierkant(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new vierkant( this, new PVector(x, y), size, color(r2, g2, b2), color(r1, g1, b1) ) );
          break;
        case 2:
          forms.add( new vierkant(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        };
        break;
      case 24:
        switch( round(x+y)%2 ) {
        case 0:
          forms.add( new ringflower( this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new ringflower( this, new PVector(x, y), size, color(r2, g1, b2), color(r1, g2, b1) ) );
          break;
        };
        break;
      case 25:
        switch( round(x+y) % 3 ) {
        case 0:
          forms.add( new cirkel(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new cirkel( this, new PVector(x, y), size, color(r2, g2, b2), color(r1, g1, b1) ) );
          break;
        case 2:
          forms.add( new cirkel(this, new PVector(x, y), size, color(r1, g2, b1), color(r2, g1, b2) ) );
          break;
        };
        break;
      case 26:
        switch( round(x+y)%8 ) {
        case 0:
          forms.add( new ring(this, new PVector(x, y), size, color(r1, g1, b1), color(r2, g2, b2) ) );
          break;
        case 1:
          forms.add( new ring(this, new PVector(x, y), size, color(r1, g1, b2), color(r2, g2, b1) ) );
          break;
        case 2:
          forms.add( new ring(this, new PVector(x, y), size, color(r1, g2, b1), color(r2, g1, b2) ) );
          break;
        case 3:
          forms.add( new ring(this, new PVector(x, y), size, color(r1, g2, b2), color(r2, g1, b1) ) );
          break;
        case 4:
          forms.add( new ring(this, new PVector(x, y), size, color(r2, g1, b1), color(r1, g2, b2) ) );
          break;
        case 5:
          forms.add( new ring(this, new PVector(x, y), size, color(r2, g1, b2), color(r1, g2, b1) ) );
          break;
        case 6:
          forms.add( new ring(this, new PVector(x, y), size, color(r2, g2, b1), color(r1, g1, b2) ) );
          break;
        case 7:
          forms.add( new ring(this, new PVector(x, y), size, color(r2, g2, b2), color(r1, g1, b1) ) );
          break;
        }
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

  for ( geoform f : forms ) {
    f.draw();
  }

  saveFrame("Patroon-"+type+"-"+size+"-"+width+"x"+height+"-######.png");

  if (type++ > 25) type=0;
}
