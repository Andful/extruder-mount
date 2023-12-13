include <global.scad>
include <util/holes.scad>
include <util/notch.scad>
include <util/rounded_square.scad>

module tool_attachment() {
  difference() {
    translate([ 0, 0, 5 ]) linear_extrude(5)
        rounded_square(plate_dimensions, plate_radius);
    translate([ 0, 0, 5 ]) cube([ plate_dimensions.x, 10, 3 ]);
    intersection() {
      linear_extrude(100) rounded_square(plate_dimensions, plate_radius);
      translate(notch_position) rotate([ 0, 180, 0 ])
          notch(notch_base, notch_height, slope, extended_base = 0.5);
    }
  }
  l = 3;
  translate([ hinge_center.x, hinge_center.y, l ])
      cylinder(h = 8 - l, r = hinge_radius);
}
