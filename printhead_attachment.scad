include <global.scad>
include <util/holes.scad>
include <util/notch.scad>
include <util/rounded_square.scad>
include <util/screw.scad>

module printhead_attachment() {
  difference() {
    union() {
      linear_extrude(5) rounded_square(plate_dimensions, plate_radius);
      intersection() {
        linear_extrude(100) rounded_square(plate_dimensions, plate_radius);
        translate(notch_position) rotate([ 0, 180, 0 ])
            notch(notch_base, notch_height, slope);
      }
    }
    translate([ 21.55, 25.8, 2 ]) cube([ 4, 4, 3 ]);

    translate([ 0, 3 ]) translate(hinge_center) linear_extrude(5) union() {
      circle(r = (hinge_radius + hinge_clearance));
      translate([ -hinge_radius - hinge_clearance, -10 ])
          square([ 2 * (hinge_radius + hinge_clearance), 10 ]);
    };
    translate([ -0.5, 0, 2 ]) holes() screw();
  }
}
