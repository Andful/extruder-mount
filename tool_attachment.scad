include <util/plate.scad>
include <util/skrew.scad>
include <util/holes.scad>
include <util/notch.scad>


difference() {
    translate([0, 0, 5]) linear_extrude(5) plate();
    intersection() {
        linear_extrude(100) plate();
        translate([11.55, 6, 7.5]) rotate([0, 180, 0]) notch(12.8, 80, 10);
    }      
}



