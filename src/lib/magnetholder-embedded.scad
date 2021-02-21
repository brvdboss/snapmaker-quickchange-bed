dia=4;
thick=1;

$fn=60;




difference(){
    union() {
        triangleA(t=thick,d=dia);
        //translate([0,0,thick]) triangleA(t=3,d=15);
    }
    translate([15.25-4,11-2+3.5,0]) cylinder(h=thick*2,d=10);
    translate([2.5,18.5,0]) cylinder(h=thick*2,d=8);
}


module triangleA(t=6,d=4) {
    hull() {
        //The cutouts are have rounded inner corners, diameter 4mm
        cylinder(h=t,d=d);
        translate([0,38-(2*dia)/2,0]) cylinder(h=t,d=d); //(take of twice the radius or 1 time the diameter)
        translate([8.95-2,15.25-2,0]) cylinder(h=t,d=d);
   }
}

