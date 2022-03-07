class ringflower extends geoform {
  private ArrayList<ring> rings;
  
  public ringflower(PApplet app, PVector center, int size, color cc, color oc) {
    super(app, center, size, cc, oc);
    
    rings = new ArrayList<ring>();
    
    int radius = round(size / 2);
    
    rings.add( new ring(app, center, radius, cc, oc) );
    
    int newradius = round(radius / 4);
    rings.add( new ring(app, new PVector(center.x, center.y-radius-newradius), newradius, oc, cc) );
    rings.add( new ring(app, new PVector(center.x+radius+newradius, center.y), newradius, oc, cc) );
    rings.add( new ring(app, new PVector(center.x, center.y+radius+newradius), newradius, oc, cc) );
    rings.add( new ring(app, new PVector(center.x-radius-newradius, center.y), newradius, oc, cc) );            
  }
  
  public void draw() {
    for( ring c : rings ) {
      c.draw();
    }
  }
}
