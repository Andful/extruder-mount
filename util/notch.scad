include <rotate_around.scad>

module notch(base, height, slope) {
    hypotenuse = sqrt(pow(base/2, 2) + pow(height, 2));
    angle = atan(base/(2*height));
    intersection() {
        rotate_around([0, 0, angle], [base/2, 0, 0]) rotate_around([0, -slope, 0], [base/2, 0, 0]) translate([-base/2, 0, 0])  cube([base, hypotenuse, 100]);
        rotate_around([0, 0, -angle], [-base/2, 0, 0]) rotate_around([0, slope, 0], [-base/2, 0, 0]) translate([-base/2, 0, 0])  cube([base, hypotenuse, 100]);
        rotate([-slope, 0, 0]) translate([-base/2, 0, 0]) cube([base, height, 100]);
        translate([-base/2, 0, 0]) cube([base, height, 100]);
    }
}