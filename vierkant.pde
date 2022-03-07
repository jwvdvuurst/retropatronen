class vierkant extends geoform {
  
  public vierkant(PApplet app, PVector center, int size, color cc, color oc) {
    super(app, center, size, cc, oc);
  }
    
  public void draw() {
    float sx = super.center.x - (super.size/2);
    float sy = super.center.y - (super.size/2);
        
    for( float py = 0.0; py <= 1.0; py += 0.0025 ) {
      for( float px = 0.0; px <= 1.0; px += 0.0025 ) {
        float x = sx + (super.size*px);
        float y = sy + (super.size*py);
        
        //if (x < 0) { x += width; };
        //if (x > width) { x -= width; };
        //if (y < 0) { y += height; };
        //if (y > height) { y -= height; };
        
        float dx = abs(px - 0.5);
        float dy = abs(py - 0.5);
        
        float dist = (dx*dx + dy*dy)*2;
        
        super.app.stroke( lerpColor(super.cc,super.oc,dist) );
        
        super.app.point(x,y);
      }
    }
  }
}
