THICK=2;

module hullie() {
    hull() 
        import("nexus7.stl");

}

module side(x,y,z) {
    difference() {
        hullie();
        translate([x,y-0.01,z-0.01])
            hullie();
    }
}

module hole(delta) {
    rotate([-23+90,0,0])
    translate([-100,11.9+delta,-15.5+delta])
        cube([200,16-2*delta,11-2*delta]);
}


module holder() {
    intersection() {
        hullie();
        difference() {
            hole(-1.087*THICK); // 1/cos(23)
            minkowski() {
                hole(2);
                rotate([0,90,0])
                    cylinder(0.01, r=2, $fn=20);
            }
        }
    }
}


module weh() {
    intersection() {
        side(THICK,0,0);
        translate([-1000,0,0])
            cube([1000,1000,1000]);
    }
}

import("nexus7.stl");

difference() {
  union() {
    weh();
    mirror([1,0,0])
        weh();
    side(0,-THICK,-THICK);
  }
  hole(0);
}

holder(); 
