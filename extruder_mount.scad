include <mount.scad>
include <notch.scad>


$fn=100;

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




difference() {
    union() {
        linear_extrude(9) {
            minkowski() {
                circle(1);
                square([22.6, 26.85]);
            }
        }
        fixture(10.85);
    }
    translate([-1, 9.5, 5]) notch();
        
    holes() {
        translate([0, 0, 2]) skrew();
    }
    translate([20.55,24.8,2]) cube([4, 4, 7]);
    translate([-1, 8.10, 5]) cube([4, 20, 4]);
}

