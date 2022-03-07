class cirkel extends geoform {
  
  public cirkel(PApplet app, PVector center, int size, color cc, color oc) {
    super(app, center, size, cc, oc);
  }
    
  public void draw() {    
    for( float p = 1.0; p > 0.0; p -= 0.0025 ) {
      float r = super.size*p;
      color c = lerpColor(super.cc,super.oc,p);
      super.app.stroke(c);
      super.app.circle(super.center.x,super.center.y,r);
    }
  }
}
