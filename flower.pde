class flower extends geoform {
  private ArrayList<cirkel> cirkels;
  
  public flower(PApplet app, PVector center, int size, color cc, color oc) {
    super(app, center, size, cc, oc);
    
    cirkels = new ArrayList<cirkel>();
    
    int radius = round(size / 2);
    
    cirkels.add( new cirkel(app, center, radius, cc, oc) );
    
    int newradius = round(radius / 4);
    cirkels.add( new cirkel(app, new PVector(center.x, center.y-radius-newradius), newradius, oc, cc) );
    cirkels.add( new cirkel(app, new PVector(center.x+radius+newradius, center.y), newradius, oc, cc) );
    cirkels.add( new cirkel(app, new PVector(center.x, center.y+radius+newradius), newradius, oc, cc) );
    cirkels.add( new cirkel(app, new PVector(center.x-radius-newradius, center.y), newradius, oc, cc) );            
  }
  
  public void draw() {
    for( cirkel c : cirkels ) {
      c.draw();
    }
  }
}
