// Parameters
$diameter_inside = 1.4; // Inside diameter in mm
$diameter_outside = 2.8; // Outside diameter in mm
$height = 0.4; // Height of the disk in mm
$hole_diameter = 1.4; // Diameter of the hole
$fn = 32; // Number of fragments for rendering circles and cylinders

// Create the disk
difference() {
    cylinder($height, $diameter_outside / 2, $diameter_outside / 2, $fn, $center = true); // Outside cylinder
    translate([0, 0, -$height]) { // Shift the inside cylinder down by the height
        cylinder($height + 0.1, $diameter_inside / 2, $diameter_inside / 2, $fn, $center = true); // Inside cylinder
    }
    
    // Create the hole in the center
    translate([0, 0, -$height / 2]) {
        cylinder($height + 1, $hole_diameter / 2, $hole_diameter / 2, $fn, $center = true); // Hole cylinder
    }

    // Create the cube to subtract
    difference() {
    translate([-1 , 0, 0]) {
        cube([1.4, 0.7, 1.4], center = true);}
        
    }
}