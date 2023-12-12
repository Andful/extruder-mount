include <util/rounded_square.scad>
include <util/skrew.scad>
include <util/holes.scad>
include <util/notch.scad>
include <util/knob.scad>
include <global.scad>

difference() {
    union() {
        linear_extrude(5) rounded_square(plate_dimensions, plate_radius);
        intersection() {
            linear_extrude(100) rounded_square(plate_dimensions, plate_radius);
            translate([12.55, 7, 7.5]) rotate([0, 180, 0]) notch(12.8, 80, slope);
        }
        
    }
    translate([21.55, 25.8, 2]) cube([4, 4, 3]);
    r = 4;
    translate(hinge_center) linear_extrude(5)  union() {
        circle(r = (hinge_radius + hinge_clearance));
        translate([-hinge_radius - hinge_clearance, -10]) square([2*(hinge_radius + hinge_clearance), 10]);
    }; 
    translate([0, 0, 2]) holes() skrew();
}



