include <util/mount.scad>
include <util/notch.scad>


$fn=500;

//translate([16.5, 6.5, -23.5]) rotate([0, 270, 0]) import(file = "sprite extruder.stl");
module skrew() {
    cylinder(h = 10, r = 3);
    translate([0, 0, -10]) cylinder(h = 10, r = 1.75);
}
module fixture(r) {
    difference() {
        linear_extrude(5) hull() union() {
            translate([-8, 17, 0])circle(r);
            translate([-8, 17, 0]) translate([0, -r, 0]) square([r, 2*r]);
            minkowski() {
                circle(1);
                square([22.6, 26.85]);
            }
        }
        translate([-8, 17, 0]) translate([0, 0, 3]) rotate([180]) skrew();
        translate([-8, 17, 0]) translate([0, 0, 4.95]) cylinder(h = 1, r = 3);
    }
}




    union() {
        translate([0, 0, 5]) linear_extrude(4) {
            minkowski() {
                circle(1);
                square([22.6, 26.85]);
            }
        }
        translate([-1, 9.5, 0]) notch(male=true, height = 5);
    }


