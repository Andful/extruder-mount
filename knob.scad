include <util/knob.scad>
include <global.scad>

$fn = 100;
height = 2;

translate([0, 0, height]) 
scale([1, 1, -1])
    knob(
        height=height,
        min_radius=5,
        max_radius=10,
        hole=3,
        slope=slope,
        dead_angle=120
    );

translate([3, -3, 0]) cube([20, 3, height]);
