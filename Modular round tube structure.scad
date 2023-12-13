use <threads-library-by-cuiso-v1.scad>;

// Parameters
$outer_diameter_tube_1 = 24; // Outer diameter of tube 1 in mm
$thickness = 32; // Thickness of the hemisphere in mm
$hole_radius = $outer_diameter_tube_1 / 2; // Radius of the hole (largest tube)
$hole_length = $thickness * 2; // Length of the hole to pierce the sphere
$plane_thickness = 0.2; // Thickness of the separating planes
$screw_diameter = 6; // Diameter of the screw for the holes
$screw_lenght = 2 * sqrt(pow($thickness, 2) - pow($outer_diameter_tube_1, 2));

// Create the hemisphere
difference() {
    // Create the complete hemisphere
    sphere($thickness, $fn = 50); // Create a sphere of specified thickness

    // Create holes for tube 1
    translate([0, $hole_radius, -$hole_length]) {
        rotate([0, 0, 90]) {
            thread_for_screw(length = 2 * $hole_length, $hole_radius, diameter = 2*$hole_radius);
        }
    }

    // Create holes for tube 2
    translate([-$hole_length, -$hole_radius , 0]) {
        rotate([0, 90, 0]) {
            thread_for_screw(length = 2 * $hole_length, $hole_radius, diameter = 2*$hole_radius);
        }
    }

    // Create thin parallel plane holes to separate the design into three parts
    translate([0, $hole_radius - $screw_diameter/2, 0]) {
        cube([2 * $thickness, $plane_thickness, 2 * $thickness], center = true);
        translate([0, -2*$hole_radius +$screw_diameter, 0]) {
            cube([2 * $thickness, $plane_thickness, 2 * $thickness], center = true);
        }
    }

    // Add screw bolt holes for 4.7mm screws at each corner

            translate([$hole_radius + $screw_diameter / 2, -$screw_lenght+3*$screw_diameter, $hole_radius + $screw_diameter / 2]) {
                rotate([0, 90, 90]) {
                    thread_for_screw(diameter = $screw_diameter, length = $screw_lenght+2*$screw_diameter);
                }
                }

            translate([$hole_radius + $screw_diameter / 2, -$screw_lenght+3*$screw_diameter, -$hole_radius - $screw_diameter / 2]) {
                rotate([0, 90, 90]) {
                    thread_for_screw(diameter = $screw_diameter, length = $screw_lenght+2*$screw_diameter);
                }
                }


            translate([- $hole_radius - $screw_diameter / 2, -$screw_lenght+3*$screw_diameter, -$hole_radius - $screw_diameter / 2]) {
                rotate([0, 90, 90]) {
                    thread_for_screw(diameter = $screw_diameter, length = $screw_lenght+2*$screw_diameter);
                }
                }

            translate([- $hole_radius - $screw_diameter / 2, -$screw_lenght+3*$screw_diameter, $hole_radius + $screw_diameter / 2]) {
                rotate([0, 90, 90]) {
                    thread_for_screw(diameter = $screw_diameter, length = $screw_lenght+2*$screw_diameter);
                }
            }
            

}
