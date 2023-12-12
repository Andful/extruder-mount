include <keyknob.scad>
include <printhead_attachment.scad>
include <tool_attachment.scad>

$fn=50;

d = plate_dimensions[0] - 2*hinge_center[0];

l = 2.5;
color(alpha=0.5) translate([d, l, 5]) translate(hinge_center)  keyknob();
color(alpha=1) translate([d, 0, 0]) printhead_attachment();
color(alpha=0.5) translate([0, l, 0])  tool_attachment();