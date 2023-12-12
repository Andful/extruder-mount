
$fn = 100;

function s(i, dead_i) = max((i - dead_i)/($fn - dead_i), 0);
function a(i) = 360*s(i, dead_i = 0);
function r(i, min_radius, max_radius, dead_i) = min_radius + (max_radius - min_radius) * s(i, dead_i);
function knob_projection(min_radius, max_radius) = [
    for (i = [0 : 1 : $fn]) 
    [
        r(i, min_radius, max_radius) * cos(360*s(i)),
        r(i, min_radius, max_radius) * sin(360*s(i))
    ]
];

function flatten(l) = [ for (a = l) for (b = a) b ] ;

function knob_points(height, min_radius, max_radius, delta, hole, dead_i) = flatten([
    for (i = [0 : 1 : $fn]) 
    [
        [
            hole * cos(a(i)),
            hole * sin(a(i)),
            0
        ],
        [
            hole * cos(a(i)),
            hole * sin(a(i)),
            height
        ],
        [
            r(i, min_radius, max_radius, dead_i) * cos(a(i)),
            r(i, min_radius, max_radius, dead_i) * sin(a(i)),
            0
        ],
        [
            r(i, min_radius + delta, max_radius + delta, dead_i) * cos(a(i)),
            r(i, min_radius + delta, max_radius + delta, dead_i) * sin(a(i)),
            height
        ],
    ]
]);

function knob_indices() = concat(flatten([
    for (i = [0 : 1 : $fn - 1]) 
    [
        //Inside face
        [
            4*i, 4*i + 4, 4*i + 1
        ],
        [
            4*i + 1, 4*i + 4, 4*i + 5
        ],
        //Bottom face
        [
            4*i, 4*i + 2, 4*i + 4
        ],
        [
            4*i + 2, 4*i + 6 , 4*i + 4
        ],
        //Top face
        [
            4*i + 1, 4*i + 5, 4*i + 3
        ],
        [
            4*i + 3, 4*i + 5, 4*i + 7
        ],
        //Outside face
        [
            4*i + 2, 4*i + 3, 4*i + 6
        ],
        [
            4*i + 3, 4*i + 7, 4*i + 6
        ],
    ]
]),[[2,4*$fn + 2,3], [3,4*$fn + 2,4*$fn + 3]]);


module knob(height=3.75, min_radius=4, max_radius=12, slope = 45, hole=3.25, dead_angle=0) {
    dead_i = round($fn*dead_angle/360);
    delta = height * tan(slope);
    polyhedron(
        points = knob_points(height, min_radius, max_radius, delta, hole, dead_i),
        faces = knob_indices(),
        convexity=3
    );
}

