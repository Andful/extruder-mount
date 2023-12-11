module plate(r=1) {
    minkowski() {
            circle(r);
            translate([r, r, 0]) square([24.6 - 2*r, 28.85 - 2*r]);
        }
}



