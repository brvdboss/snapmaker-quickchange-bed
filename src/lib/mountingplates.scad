//$fn=360;

$fn=64;

//parameters for inserts
flangeh=1+1; //1mm + 1mm "space"
flanged=8;
threadd=5;

//parameters for mountinghole
mountflangeh=5;
mountflanged=8;
mountholed=4.5;

//parameters for inserts
insertflange=10;
insertflanged=3;
insertholed=5.5;


//insertcounts
insertcx=11;
insertcy=12;
insertspace=30;

//parameters for boardsize
boardx=330;
boardy=360;
boardz=18;

//size of carriagebolt
cbhf=20; //diameter of head
cbhd=5; //depth/height of head
cbls=8;// side of locking square
cbld=5;//depth of locking square
cbd=8.2;//M8



//translate([boardx/2,boardy/2,750*(1-$t)+boardz*2+boardz/10]) mountingholes();
//translate ([0,0,600*(1-$t)+boardz+boardz/10]) topplate();
//translate ([0,0,450*(1-$t)+boardz]) carriageboltgrid();
//translate([0,0,300*(1-$t)+boardz]) printtopboard();
//translate([400,0,300*(1-$t)+boardz]) lasertopboard();
//translate([400*2,0,300*(1-$t)+boardz]) cnctopboard();
//translate ([0,0,150*(1-$t)+boardz/2]) connectioncrossgrid();
//translate ([0,0,0*(1-$t)]) customwasteboard();
//nutwasher();
//magnetholder();
//magnetholdergrid();
//magnetholdergridtopside();

//translate([boardx/2,boardy/2,boardz+2]) scale([3.5,3.5,1]) import(file = "carriage.svg", center = true);
//printtopboard();
//customwasteboardmagnetsonly();

//basic wasteboard with inserts and mounting holes cut out
module allholewasteboard() {
    sx=(boardx-(insertcx-1)*insertspace)/2;
    sy=(boardy-(insertcy-1)*insertspace)/2;
    difference() {
        cube([boardx,boardy,boardz]);
        translate([sx,sy,0])
            wasteboardinserts();
        translate([boardx/2,boardy/2,0])
            mountingholes();
        translate([0,0,boardz/2]) connectioncrossgrid();
        carriageboltgrid();
        
    }
}


//simulation of topplate like 3d printplate
module topplate() {
    sx=(boardx-(insertcx-1)*insertspace)/2;
    sy=(boardy-(insertcy-1)*insertspace)/2;
    difference() {
        cube([boardx,boardy,boardz/10]);
        translate([boardx/2,boardy/2,0])
            mountingholes();
    }
    
}

//cnc wasteboard with inserts
module wasteboard() {
    sx=(boardx-(insertcx-1)*insertspace)/2;
    sy=(boardy-(insertcy-1)*insertspace)/2;
    difference() {
        cube([boardx,boardy,boardz]);
        translate([sx,sy,0])
            wasteboardinserts();
        translate([boardx/2,boardy/2,0])
            mountingholes();
    }
}


//bottom mount plate on which to mount other plates.
module customwasteboard() {
    sx=(boardx-(insertcx-1)*insertspace)/2;
    sy=(boardy-(insertcy-1)*insertspace)/2;
    difference() {
        cube([boardx,boardy,boardz]);
        translate([boardx/2,boardy/2,0])
            mountingholes();
        //translate([0,0,boardz]) carriageboltgrid();
        //carriageboltnutgrid();
        //translate([0,0,boardz/2]) connectioncrossgrid();
        //boardhandlecutouts();
        //we assume there is up to 2mm that needs to be milled away
        //to flatten the board. Hence we already go 2mm lower.
        //quick and dirty way to implement this, shift everything down
        //and remove again.
        /*translate([0,0,-2]) {
            translate([boardx/2,boardy/2,0])
            mountingholes();
            translate([0,0,boardz]) carriageboltgrid();
            carriageboltnutgrid();
            translate([0,0,boardz/2]) connectioncrossgrid();
            boardhandlecutouts();
        }*/
        magnetholdergrid();
    }    
}


//bottom plate with necessary holes for magnets
module customwasteboardmagnetsonly() {
    difference() {
        cube([boardx,boardy,boardz]);
        magnetholdergrid();
        
    }    
}

//basic topboard
module topboard() {
    difference(){
        cube([boardx,boardy,boardz]);
        //carriageboltgrid();
        //translate([0,0,0]) connectioncrossgrid();
        magnetholdergridtopside();
    }
}

module printtopboard() {
    difference() {
        topboard();
        translate([boardx/2,boardy/2,0])
            mountingholesinserts();
        translate([boardx/2,boardy/2,boardz-3+1.5])
            cube([40,60,2], center=true);
    }
}

module lasertopboard() {
    difference() {
        topboard();
        translate([boardx/2,boardy/2,0])
            mountingholesinserts();
    }
}

module cnctopboard() {
    sx=(boardx-(insertcx-1)*insertspace)/2;
    sy=(boardy-(insertcy-1)*insertspace)/2;

    difference() {
        topboard();
        translate([sx,sy,0])
            wasteboardinserts();
    }
}


//single cutout for mountinghole to connect to the carriage
module mountinghole() {
    union() {
        translate([0,0,boardz-mountflangeh]) cylinder(h=mountflangeh,d=mountflanged);
        cylinder(h=boardz,d=mountholed);
    }
}

//cutout pattern for mounting holes
//see jpeg
//as those measurements are based from the center, I'll use that as the center as well
module mountingholes() {
//outer square, start bottom left, work my way around clockwise
    //this one isn't included in the original board, 2 holes overlap with the insert-holes
    translate([-150,-160,0]) mountinghole();
    translate([-150,0,0]) mountinghole();
    translate([-150,160,0]) mountinghole();
    translate([0,160,0]) mountinghole();
    translate([150,160,0]) mountinghole();
    translate([150,0,0]) mountinghole();
    translate([150,-160,0]) mountinghole();
    translate([0,-160,0]) mountinghole();
    
//second square, start bottom left, work my way around clockwise
    translate([-117,-127,0]) mountinghole();
    translate([-117,-51,0]) mountinghole();
    translate([-117,51,0]) mountinghole();
    translate([-117,127,0]) mountinghole();
    translate([0,127,0]) mountinghole();
    translate([117,127,0]) mountinghole();
    translate([117,51,0]) mountinghole();
    translate([117,-51,0]) mountinghole();
    translate([117,-127,0]) mountinghole();
    translate([0,-127,0]) mountinghole();
    
//inner smallest square
//again these overlap with some of the insertholes on the original board (they left out the insert holes there
    translate([-45,-51,0]) mountinghole();
    translate([-45,51,0]) mountinghole();
    translate([45,51,0]) mountinghole();
    translate([45,-51,0]) mountinghole();
}

//mountingholes created as inserts, basically mirror along z-axis
module mountingholesinserts() {
    translate([0,0,boardz]) mirror([0,0,1]) mountingholes();
}


//single cutout for insert
module wasteboardinsert() {
    union() {
        cylinder(h=flangeh,d=flanged);
        cylinder(h=boardz,d=threadd);
    }
}

//pattern of cutouts for mounting holes
//one every x cm, a times b square
module wasteboardinserts() {
    for(i=[0:insertspace:(insertcx-1)*insertspace]) {
        for(j=[0:insertspace:(insertcy-1)*insertspace]) {
            translate([i,j,0]) wasteboardinsert();
        }
    }
}

//proposed "snap fit" cross to connecto two plates. Probably not the most robust as it will get loose quickly in mdf
module connectioncross(){
    translate([0,0,9]) 
    rotate([0,0,45]) {
        cube([20,5,18], center=true);
        rotate([0,0,90]) cube([20,5,18], center=true);
    }
}

//Arrange these in a grid formation
module connectioncrossgrid() {
    cx=60; //clearance from side x-axis
    cy=75; //clearance from side y-axis
    translate([cx,cy,0]) connectioncross();
    translate([cx,boardy-cy,0]) connectioncross();
    translate([boardx-cx,boardy-cy,0]) connectioncross();
    translate([boardx-cx,cy,0]) connectioncross();
}

//dimensions of a carriagebolt to be used to cut these out
module carriagebolt() {
    union() {
        translate([0,0,boardz-cbhd])cylinder(h=cbhd,d=cbhf); //head
        translate([0,0,-boardz*1.5]) cylinder(h=boardz*2.5,d=cbd); //shaft
        translate([-cbls/2,-cbls/2,boardz-cbhd-cbld]) cube([cbls,cbls,cbld]); //locking square
    }
}

//set of carriagebolts that can be used to cut them out of a board
module carriageboltgrid() {
    cx=30; //clearance from side x-axis
    cy=80; //clearance from side y-axis
    translate([cx,cy,0]) carriagebolt();
    translate([cx,boardy-cy,0]) carriagebolt();
    translate([boardx-cx,boardy-cy,0]) carriagebolt();
    translate([boardx-cx,cy,0]) carriagebolt();
}

//nut and washer for tightening the carriagebolts in place
module nutwasher() {
    washerd=28;
    washerh=2;
    nutd=16;
    nuth=6.5;
    union() {
        translate([0,0,boardz-washerh])cylinder(h=washerh,d=washerd); //washer
        translate([0,0,boardz-washerh-nuth]) cylinder(h=nuth,d=nutd); //nut
    }
}

//set of washers+nuts that can be used to cut them out of the board
//these are used to connect tightent the carriabge bolts in place on the mountingboards
module carriageboltnutgrid() {
    cx=30; //clearance from side x-axis
    cy=80; //clearance from side y-axis
    translate([cx,cy,0]) nutwasher();
    translate([cx,boardy-cy,0]) nutwasher();
    translate([boardx-cx,boardy-cy,0]) nutwasher();
    translate([boardx-cx,cy,0]) nutwasher();
}

//cutout in the bottom board to "grab" on to to pull the top board off.
module handle() {
    hull() {
        translate([-25,0,0]) cube(boardz, center=true);
        translate([25,0,0]) cube(boardz, center=true);
    }
}

//provide multiple handles across all 4 sides on the board
module boardhandlecutouts() {
    translate([0,0,boardz/2+5]) {
        translate([boardx/4,0,0]) handle();
        translate([boardx/4*3,0,0]) handle();
        translate([0,boardy/4,0]) rotate([0,0,90]) handle();
        translate([0,boardy/4*3,0]) rotate([0,0,90]) handle();
        translate([boardx/4,boardy,0]) handle();
        translate([boardx/4*3,boardy,0]) handle();
        translate([boardx,boardy/4,0]) rotate([0,0,90]) handle();
        translate([boardx,boardy/4*3,0]) rotate([0,0,90]) handle();
    }
}

//hole to contain the magnetholder
module magnetholder() {
    cylinder(boardz,d=40+1);
    translate([0,0,-boardz]) cylinder(boardz,d=9);
}

//arrange th magnets in a grid around the board.
module magnetholdergrid() {
    cx=80; //clearance from side x-axis
    cy=30; //clearance from side y-axis
    translate([0,0,boardz-12.2]) {    
        translate([cx,cy,0]) magnetholder();
        translate([cx,boardy-cy,0]) magnetholder();
        translate([boardx-cx,boardy-cy,0]) magnetholder();
        translate([boardx-cx,cy,0]) magnetholder();
    }
    //hole to help lift the board using a screwdriver or something similar
    translate([boardx/2-20,0,boardz-10]) cube([10,80,10]);
    
}


module magnetholdertop() {
    fh = 6; //height of washer + nut
    fd = 22; //diameter of washer
    union() {
        cylinder(h=boardz,d=mountholed);
        translate([0,0,boardz-fh]) cylinder(h=fh,d=fd);
    }
    
}

//cutouts for to connect the metal discs the magnets connect to.
module magnetholdergridtopside() {
    cx=80; //clearance from side x-axis
    cy=30; //clearance from side y-axis

        translate([cx,cy,0]) magnetholdertop();
        translate([cx,boardy-cy,0]) magnetholdertop();
        translate([boardx-cx,boardy-cy,0]) magnetholdertop();
        translate([boardx-cx,cy,0]) magnetholdertop();
}
