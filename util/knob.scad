function flatten(l) = [ for (a = l) for (b = a) b ] ;

function s(i, dead_i) = max((i - dead_i)/($fn - dead_i), 0);
function a(i) = 360*s(i, dead_i = 0);
function r(i, min_radius, max_radius, dead_i) = min_radius + (max_radius - min_radius) * s(i, dead_i);

module knob(height=3.75, min_radius=4, max_radius=12, slope = 45, hole=3.25, dead_angle=0) {
    dead_i = round($fn*dead_angle/360);
    delta = height * tan(slope);
    for (i = [0:$fn-1]) {
        polyhedron(
            points = flatten([
                for (j = [i : i + 1]) 
                [
                    [
                        hole * cos(a(j)),
                        hole * sin(a(j)),
                        0
                    ],
                    [
                        hole * cos(a(j)),
                        hole * sin(a(j)),
                        height
                    ],
                    [
                        r(j, min_radius, max_radius, dead_i) * cos(a(j)),
                        r(j, min_radius, max_radius, dead_i) * sin(a(j)),
                        0
                    ],
                    [
                        r(j, min_radius + delta, max_radius + delta, dead_i) * cos(a(j)),
                        r(j, min_radius + delta, max_radius + delta, dead_i) * sin(a(j)),
                        height
                    ],
                ]
            ]),
            faces = [
                //Inside face
                [0,4,1],
                [1,4,5],
                //Bottom face
                [0,2,4],
                [2, 6, 4],
                //Top face
                [1,5,3],
                [3,5,7],
                //Outside face
                [2,3,6],
                [3, 7, 6],
                //Right face
                [6,7,4],
                [7,5,4],
                //Left face
                [2,1, 3],
                [1,2,0]]
                );

    }
}

