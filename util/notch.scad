include <rotate_around.scad>

M = 1000;  // A big number

module notch(base, height, slope, extended_base = 0) {
  hypotenuse = sqrt(pow(base / 2, 2) + pow(height, 2));
  angle = atan(base / (2 * height));
  intersection() {
    rotate_around([ 0, 0, angle ], [ base / 2, 0, 0 ])
        rotate_around([ 0, -slope, 0 ], [ base / 2, 0, 0 ])
            translate([ base / 2 - M, -M / 2, -M / 2 ]) cube([ M, M, M ]);
    rotate_around([ 0, 0, -angle ], [ -base / 2, 0, 0 ])
        rotate_around([ 0, slope, 0 ], [ -base / 2, 0, 0 ])
            translate([ -base / 2, -M / 2, -M / 2 ]) cube([ M, M, M ]);
    rotate([ -slope, 0, 0 ]) translate([ base / 2 - M / 2, 0, -M / 2 ])
        cube([ M, height, M ]);
    translate([ base / 2 - M / 2, -M / 2, -extended_base ]) cube([ M, M, 100 ]);
  }
}