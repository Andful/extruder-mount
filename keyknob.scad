include <util/knob.scad>
include <global.scad>

$fn = 100;

height = 2.5;
module keyknob() {
    union() {
        
        translate([0, 0, height]) 
        scale([1, 1, -1])
            knob(
                height=height,
                min_radius=3.5,
                max_radius=9,
                hole=hinge_radius + hinge_clearance,
                slope=slope,
                dead_angle=90
            );
        translate([hinge_radius + hinge_clearance, -3, 0]) cube([20, 3, height]);
    }
}

keyknob();
