include <../lib/mountingplates.scad>

translate([boardx/2,boardy/2,750*(1-$t)+boardz*2+boardz/10])
            mountingholes();
translate ([0,0,600*(1-$t)+boardz+boardz/10]) topplate();
//translate ([0,0,450*(1-$t)+boardz]) carriageboltgrid();
translate([0,0,300*(1-$t)+boardz]) printtopboard();
translate([400,0,300*(1-$t)+boardz]) lasertopboard();
translate([400*2,0,300*(1-$t)+boardz]) cnctopboard();
//translate ([0,0,150*(1-$t)+boardz/2]) connectioncrossgrid();
translate ([0,0,0*(1-$t)]) customwasteboard();