include <util/rounded_square.scad>
include <util/holes.scad>
include <util/notch.scad>
include <global.scad>


module tool_attachment() {
    difference() {
        translate([0, 0, 5]) linear_extrude(5) rounded_square(plate_dimensions, plate_radius);
        translate([0, 0, 5]) cube([hinge_center[0], 10, 3]);
        intersection() {
            linear_extrude(100) rounded_square(plate_dimensions, plate_radius);
            translate(notch_position) rotate([0, 180, 0]) notch(notch_base, notch_height, slope, extended_base=0.5);
        }      
    }
    l = 3;
    translate([hinge_center[0], hinge_center[1], l]) cylinder(h = 8 - l, r = hinge_radius);
}
