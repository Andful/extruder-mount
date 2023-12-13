$fn=100;

difference() {
    union() {

        cylinder(h = 3.5, r = 4);
        translate([0, 0, 3.5]) cylinder(h = 4.5, r = 2.5);
    }
    cylinder(h = 2.5, r =3.5, $fn=6);
    cylinder(h = 9, r = 1.75);
}