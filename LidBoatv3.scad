circle_radius_hole = 2.5;
circle_radius_border_hole = 4.5;
circle_radius_lid = 10;
lid_separation = 16;
extrusion_height = 2;
round_height = 1;
text_size = 2.5;
text_height = 2;
text_font = "P052:style=Regular";
spacing = 0.5;

text_offset_aurora = -1.5;
text_offset_tonito = 4;
text_rotation_angle = 90;

fn_circle = 100;
fn_sphere = 50;
fn_text = 32;

difference() {
    union() {
        linear_extrude(extrusion_height) {
            hull() {
                circle(circle_radius_border_hole, $fn = fn_circle);
                translate([lid_separation,0,0]) {
                    circle(circle_radius_lid,$fn=fn_circle);
                }
            }
        }
        translate([0, 0, extrusion_height - round_height]) {
            minkowski() {
                linear_extrude(round_height) {
                    hull() {
                        circle(circle_radius_border_hole - round_height, $fn = fn_circle);
                        translate([lid_separation,0,0]) {
                            circle(circle_radius_lid - round_height, $fn=fn_circle);
                        }
                    }
                }
                sphere(r = round_height, $fn=fn_sphere);
            }
        }

        union() {
            translate([lid_separation, 0, extrusion_height]) {
                translate([text_offset_aurora, 0, 0]) {
                    rotate([0, 0, text_rotation_angle]) {
                        linear_extrude(height = text_height) {
                            text("Aurora", size = text_size, font = text_font, halign = "center", valign = "bottom", $fn = fn_text);
                        }
                    }
                }
            }

            translate([lid_separation, 0, extrusion_height]) {
                translate([text_offset_tonito, 0, 0]) {
                    rotate([0, 0, text_rotation_angle]) {
                        linear_extrude(height = text_height) {
                            text("Toñito", size = text_size, font = text_font, halign = "center", valign = "bottom", $fn = fn_text);
                        }
                    }
                }
            }
        }
    }
    translate([0,0,-round_height]){
        cylinder(h = extrusion_height + round_height * 2, r= circle_radius_hole,$fn=fn_circle);
    }
}