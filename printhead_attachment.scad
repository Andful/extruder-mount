include <util/plate.scad>
include <util/skrew.scad>
include <util/holes.scad>
include <util/notch.scad>
include <util/knob.scad>
include <global.scad>

difference() {
    union() {
        linear_extrude(5) plate(plate_radious);
        intersection() {
            linear_extrude(100) plate(plate_radious);
            translate([12.55, 7, 7.5]) rotate([0, 180, 0]) notch(12.8, 80, slope);
        }
        
    }
    translate([21.55, 25.8, 2]) cube([4, 4, 3]);
    r = 4;
    translate([hinge_center[0], 3]) linear_extrude(5)  union() {
        circle(r = r);
        translate([-r, -10]) square([2*r, 10]);
    }; 
    translate([0, 0, 2]) holes() skrew();
}



