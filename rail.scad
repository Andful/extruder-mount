module half_rail(width, height, angle) {
    polygon([
        [0, 0],
        [0, height],
        [width/2, height],
        [width/2 - tan(angle), 0]
    ]);
}

module rail(width, height, angle) {
    half_rail(width, height, angle);
    mirror([1,0]) half_rail(width, height, angle);
}
