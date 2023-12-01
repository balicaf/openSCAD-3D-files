// Parameters
$outer_diameter_tube_1 = 5; // Outer diameter of tube 1 in mm
$thickness = 10; // Thickness of the hemisphere in mm
$hole_radius = $outer_diameter_tube_1  / 2; // Radius of the hole (largest tube)
$hole_length = $thickness * 2; // Length of the hole to pierce the sphere

// Create the hemisphere
difference() {
    sphere($thickness, $fn = 100); // Create a sphere of specified thickness

    // Create holes for tube 1
    translate([0, 1.5*$hole_radius, -$hole_length]) {
        rotate([0, 0, 90]) {
            cylinder(2 * $hole_length, $hole_radius + 1, $hole_radius + 1, $fn = 100);
        }
    }

    // Create holes for tube 2
    translate([-$hole_length, -1.5*$hole_radius, 0]) {
        rotate([0, 90, 0]) {
            cylinder(2 * $hole_length, $hole_radius + 1, $hole_radius + 1, $fn = 100);
        }
    }
}