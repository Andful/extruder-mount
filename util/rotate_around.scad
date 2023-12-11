module rotate_around(r, c) {
    translate(c) rotate(r) translate(-c) children();
}