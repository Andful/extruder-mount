include <../tool_attachment.scad>
include <../global.scad>
include <../util/rounded_square.scad>

module nut_hole() {
    translate([0, 0, 0]) group() {
        cylinder(h = 2.5, r =3.5, $fn=6);
        cylinder(h = 9, r = 1.75);
    }
}

module hole() {
    wall = 6;
    difference() {
        intersection() {
            cube([wall, plate_dimensions.y, 13]);
            linear_extrude(100) rounded_square(plate_dimensions, plate_radius); 
        }
        translate([0, plate_dimensions.y / 2, 4.7 * sqrt(3) / 2]) rotate([90, 0, 0]) rotate([0, 90, 0]) cylinder(h = 5, r = 4.7, $fn = 6);
        //translate([wall/2, plate_dimensions.y/2, 4.7 * sqrt(3)]) rotate([0, 0, 30]) nut_hole();
    }
}

translate([0, 0, -10]) tool_attachment();
hole();
translate([plate_dimensions.x, plate_dimensions.y, 0]) rotate([0, 0, 180]) hole(); 


