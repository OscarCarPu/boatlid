circle_radius_hole = 2.5;
circle_radius_border_hole = 4.5;
circle_radius_lid = 10;
lid_separation = 16;
extrusion_height = 2;
round_height = 1;

difference() {
    union() {
        linear_extrude(extrusion_height) {
            hull() {
                circle(circle_radius_border_hole, $fn = 100);
                translate([lid_separation,0,0]) {
                    circle(circle_radius_lid,$fn=100);
                }
            }
        }
        translate([0, 0, extrusion_height - round_height]) {
            minkowski() {
                linear_extrude(round_height) {
                    hull() {
                        circle(circle_radius_border_hole - round_height, $fn = 100);
                        translate([lid_separation,0,0]) {
                            circle(circle_radius_lid - round_height, $fn=100);
                        }
                    }
                }
                sphere(r = round_height, $fn=50);
            }
        }
    }
    translate([0,0,-round_height]){
            cylinder(h = extrusion_height + round_height * 2, r= circle_radius_hole,$fn=100);
    }
}