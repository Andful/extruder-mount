include <util/rounded_square.scad>
include <util/skrew.scad>
include <util/holes.scad>
include <util/notch.scad>
include <global.scad>

h = 2*(plate_dimensions[0] - hinge_center[0]);

difference() {
    translate([0, 0, 5]) linear_extrude(5) rounded_square([h, plate_dimensions[1]], plate_radius);
    translate([0, 0, 5]) cube([h, 10, 2.5]);
    intersection() {
        linear_extrude(100) rounded_square(plate_dimensions, plate_radius);
        translate([11.55, 6, 7.5]) rotate([0, 180, 0]) notch(12.8, 80, 10);
    }      
}

translate([h/2, hinge_center[1]]) cylinder(h = 7.5, r = hinge_radius);



