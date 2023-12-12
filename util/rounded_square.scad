module rounded_square(dimensions, r=1) {
    minkowski() {
            circle(r);
            translate([r, r, 0]) square(dimensions - [2*r, 2*r]);
        }
}
