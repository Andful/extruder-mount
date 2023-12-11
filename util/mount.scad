module mount() {
    difference() {
        plate();
        holes() {
            circle(1.75);
        }
    }
}

module plate() {
    minkowski() {
            circle(1);
            square([22.6, 26.85]);
        }
}

module holes() {
    translate([4.05,2.8,0]) children();
    translate([2.55,11.1,0]) children();
    translate([20.55,11.1,0]) children();
    translate([20.55,24.8,0]) children();
    translate([2.55,22.9,0]) children();
}



