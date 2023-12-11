M = [ [ 1  , 0  , -0.5  , 0   ],
      [ 0  , 1  , 0  , 0   ],  // The "0.7" is the skew value; pushed along the y axis as z changes.
      [ 0  , 0  , 1  , 0   ],
      [ 0  , 0  , 0  , 1   ] ] ;

module notch(male = false, height=4) {
    intersection() {
        multmatrix(M) linear_extrude(height) scale([23, 15]) polygon([[0, 0], [1, 0.5], [0, 1]]);
        if (male) translate([3, 0, 0]) rotate([0, atan(1/3.75), 0]) cube([30, 20, 100]);
    }
}

