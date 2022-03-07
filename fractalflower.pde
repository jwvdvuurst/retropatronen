class fractalflower extends geoform {
  private ArrayList<geoform> forms;

  public fractalflower(PApplet app, PVector center, int size, color cc, color oc, int level) {
    super(app, center, size, cc, oc);

    forms = new ArrayList<geoform>();

    int radius = round(size / 2);

    forms.add( new ring(app, center, radius, cc, oc) );

    if (level > 1) {
      int newradius = round(radius / 4);
      forms.add( new fractalflower(app, new PVector(center.x, center.y-radius-newradius), newradius, oc, cc, level-1) );
      forms.add( new fractalflower(app, new PVector(center.x+radius+newradius, center.y), newradius, oc, cc, level-1) );
      forms.add( new fractalflower(app, new PVector(center.x, center.y+radius+newradius), newradius, oc, cc, level-1) );
      forms.add( new fractalflower(app, new PVector(center.x-radius-newradius, center.y), newradius, oc, cc, level-1) );
    }
  }

  public void draw() {
    for ( geoform c : forms ) {
      c.draw();
    }
  }
}
