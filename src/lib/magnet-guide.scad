$fn=360;


magnetd=25.6; //diameter of magnet
magneth=7; //height of magnet
magnetbusd=8;//diameter of the threaded bus
magnetbush=8;//height of the threaded bus 
plated=27.2; //diameter of plate
plateh=3; //height of metal plate

conesmalld=32; //small diameter of cone
conelarged=36; //large diameter of cone
bottomh=0.96; //height of layer between wood and magnet/plate

bottomd=40; //diameter of the holdingcup

tollerance=0.6;


//translate([0,40,0]) onesidedcup();
//demoExploded();
//demoCombined();


module demoExploded() {
    difference() {
        union() {
            twosidedbottom();
            translate([0,0,0+10]) magnet();
            translate([0,0,magneth+20]) plate();
            translate([0,0,10+30]) mirror([0,0,1]) twosidedtop();
        }
        translate([0,0,-50]) cube(100);
    }
}

module demoCombined() {
    difference() {
        union() {
            twosidedbottom();
            translate([0,0,0]) magnet();
            translate([0,0,magneth]) plate();
            translate([0,0,magneth+plateh+bottomh]) mirror([0,0,1]) twosidedtop();
        }
        translate([0,0,-50]) cube(100);
    }
}

module onesidedcup() {
    difference() {
        translate([0,0,-bottomh]) cylinder(h=8,d=35);
        translate([0,0,6]) cylinder(h=bottomh,d1=28,d2=30);
        cylinder(h=magneth,d=magnetd);
        translate([0,0,-3]) cylinder(h=15,d=magnetbusd+tollerance);
    }
}



//magnetside looks lide a receiving cup
module twosidedbottom() {
    difference() {
        translate([0,0,-bottomh]) cylinder(h=(bottomh+magneth+plateh+bottomh),d=bottomd);
        translate([0,0,magneth]) cylinder(h=bottomh+plateh,d1=conesmalld,d2=conelarged);
        cylinder(h=magneth,d=magnetd);
        translate([0,0,-(bottomh+plateh)]) cylinder(h=15,d=magnetbusd+tollerance);
    }
}


//topside looks like a top down hill
//we add the tollerance to this one
module twosidedtop() {
    difference() {
        cylinder(h=bottomh+plateh,d1=conelarged-tollerance,d2=conesmalld-tollerance);
        translate([0,0,bottomh]) cylinder(h=plateh,d=plated);
        translate([0,0,-(bottomh+plateh)]) cylinder(h=15,d=magnetbusd+tollerance);
    }
}

module plate(){
    difference() {
        cylinder(h=plateh,d=plated);
        translate([0,0,-(bottomh+plateh)]) cylinder(h=15,d=magnetbusd+tollerance);
    }
}

module magnet() {
    union() {
        cylinder(h=magneth,d=magnetd);
        translate([0,0,-8]) cylinder(h=8,d=magnetbusd);
        
    }
}