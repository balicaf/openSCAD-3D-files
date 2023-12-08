use <threads-library-by-cuiso-v1.scad>;

// Parameters
$outer_diameter_tube_1 = 25.6; // Outer diameter of tube 1 in mm
$thickness = 30; // Thickness of the hemisphere in mm
$hole_radius = $outer_diameter_tube_1 / 2; // Radius of the hole (largest tube)
$hole_length = $thickness * 2; // Length of the hole to pierce the sphere
$plane_thickness = 0.5; // Thickness of the separating planes
$screw_diameter = 4.7; // Diameter of the screw for the holes

// Create the hemisphere
difference() {
    // Create the complete hemisphere
    sphere($thickness, $fn = 100); // Create a sphere of specified thickness

    // Create holes for tube 1
    translate([0, 1 * $hole_radius, -$hole_length]) {
        rotate([0, 0, 90]) {
            cylinder(2 * $hole_length, $hole_radius, $hole_radius, $fn = 100);
        }
    }

    // Create holes for tube 2
    translate([-$hole_length, -1 * $hole_radius, 0]) {
        rotate([0, 90, 0]) {
            cylinder(2 * $hole_length, $hole_radius, $hole_radius, $fn = 100);
        }
    }

    // Create thin parallel plane holes to separate the design into three parts
    translate([0, $hole_radius, 0]) {
        cube([2 * $thickness, $plane_thickness, 2 * $thickness], center = true);
        translate([0, -2*$hole_radius, 0]) {
            cube([2 * $thickness, $plane_thickness, 2 * $thickness], center = true);
        }
    }

    // Add screw bolt holes for 4.7mm screws at each corner
    for (i = [1 : 4]) {
        if (i == 1) {
            translate([$hole_radius + $screw_diameter / 2, -$thickness - $screw_diameter, $hole_radius + $screw_diameter / 2]) {
                rotate([0, 90, 90]) {
                    thread_for_screw_fullparm(diameter = $screw_diameter, length = 3 * $thickness, pitch = 2);
                }
            }
        } else if (i == 2) {
            translate([$hole_radius + $screw_diameter / 2, -$thickness - $screw_diameter, -$hole_radius - $screw_diameter / 2]) {
                rotate([0, 90, 90]) {
                    thread_for_screw_fullparm(diameter = $screw_diameter, length = 3 * $thickness, pitch = 2);
                }
            }
        } else if (i == 3) {
            translate([- $hole_radius - $screw_diameter / 2, -$thickness - $screw_diameter, -$hole_radius - $screw_diameter / 2]) {
                rotate([0, 90, 90]) {
                    thread_for_screw_fullparm(diameter = $screw_diameter, length = 3 * $thickness, pitch = 2);
                }
            }
        } else {
            translate([- $hole_radius - $screw_diameter / 2, -$thickness - $screw_diameter, $hole_radius + $screw_diameter / 2]) {
                rotate([0, 90, 90]) {
                    thread_for_screw_fullparm(diameter = $screw_diameter, length = 3 * $thickness, pitch = 2);
                }
            }
        }
    }
}
