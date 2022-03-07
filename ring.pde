class ring extends geoform {
  
  public ring(PApplet app, PVector center, int size, color cc, color oc) {
    super(app, center, size, cc, oc);
  }
    
  public void draw() {    
    for( float p = 1.0; p > 0.5; p -= 0.01 ) {
      float r = super.size*p;
      color c = lerpColor(super.cc,super.oc,p);
      super.app.stroke(c);
      super.app.circle(super.center.x,super.center.y,r);
    }
    color inner = color(255-red(super.oc), 255-green(super.oc), 255-blue(super.oc));
    for( float p = 0.5; p > 0.0; p -= 0.01 ) {
      float r = super.size*p;
      super.app.stroke(inner);
      super.app.circle(super.center.x,super.center.y,r);
    }    
  }
}
