include <util/rounded_square.scad>
include <util/screw.scad>
include <util/holes.scad>
include <util/notch.scad>
include <global.scad>

module printhead_attachment() {
    difference() {
        union() {
            linear_extrude(5) rounded_square(plate_dimensions, plate_radius);
            intersection() {
                linear_extrude(100) rounded_square(plate_dimensions, plate_radius);
                translate([hinge_center[0], notch_position[1], notch_position[2]]) rotate([0, 180, 0]) notch(notch_base, notch_height, slope);
            }
            
        }
        translate([21.55, 25.8, 2]) cube([4, 4, 3]);

        translate([0, 3]) translate(hinge_center) linear_extrude(5)  union() {
            circle(r = (hinge_radius + hinge_clearance));
            translate([-hinge_radius - hinge_clearance, -10]) square([2*(hinge_radius + hinge_clearance), 10]);
        }; 
        translate([0, 0, 2]) holes() screw();
    }
}



