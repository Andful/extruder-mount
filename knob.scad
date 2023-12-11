
$fn = 100;

function s(i) = i/$fn;
function r(i, min_radius, max_radius) = min_radius + (max_radius - min_radius) * s(i);

function flatten(l) = [ for (a = l) for (b = a) b ] ;

function knob_projection(height, min_radius, max_radius, delta, hole) = flatten([
    for (i = [0 : 1 : $fn]) 
    [
        [
            hole * cos(360*s(i)),
            hole * sin(360*s(i)),
            0
        ],
        [
            hole * cos(360*s(i)),
            hole * sin(360*s(i)),
            height
        ],
        [
            r(i, min_radius, max_radius) * cos(360*s(i)),
            r(i, min_radius, max_radius) * sin(360*s(i)),
            0
        ],
        [
            r(i, min_radius + delta, max_radius + delta) * cos(360*s(i)),
            r(i, min_radius + delta, max_radius + delta) * sin(360*s(i)),
            height
        ],
    ]
]);

function knob_projection_indices() = concat(flatten([
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

polyhedron(
    points = knob_projection(3.75, 4, 12, 1, 3.25),
    faces = knob_projection_indices(),
    convexity=2
);
