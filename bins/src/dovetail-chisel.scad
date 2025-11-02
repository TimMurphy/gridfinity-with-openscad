// src/dovetail-chisel.scad
// Dovetail Chisel Module
// All dimensions in millimeters (mm)

// ---- Parameters ----
// blade_width is passed in from the parent file
// Other dimensions are fixed per specification

blade_length = 58;
blade_thickness = 5;
socket_length = 65;
socket_blade_end_thickness = 8.27;
socket_handle_end_thickness = 16;
handle_length = 98.5; // includes ring
handle_ring_end_thickness = 20.5;
handle_mid_thickness = 21.5;
handle_socket_end_thickness = 20.5;
ring_length = 11;
ring_thickness = 22;

module dovetail_chisel(blade_width) {
    // Blade (lying down along X, centered to socket)
    translate([0, -blade_width/2, -blade_thickness/2])
        cube([blade_length, blade_width, blade_thickness], center=false);

    // Socket (lying down along X, center aligned to blade and handle)
    translate([
        blade_length,
        0,
        0
    ])
        hull() {
            rotate([0,90,0])
                cylinder(h=socket_length, r=socket_blade_end_thickness/2, $fn=64);
            translate([socket_length,0,0])
                rotate([0,90,0])
                    cylinder(h=1, r=socket_handle_end_thickness/2, $fn=64);
        }

    // Handle (lying down along X, center aligned to socket)
    translate([
        blade_length+socket_length,
        0,
        0
    ])
        hull() {
            rotate([0,90,0])
                cylinder(h=1, r=handle_socket_end_thickness/2, $fn=64);
            translate([handle_length/2,0,0])
                rotate([0,90,0])
                    cylinder(h=1, r=handle_mid_thickness/2, $fn=64);
            translate([handle_length,0,0])
                rotate([0,90,0])
                    cylinder(h=1, r=handle_ring_end_thickness/2, $fn=64);
        }

    // Ring (lying down along X, center aligned to handle)
    translate([
        blade_length+socket_length+handle_length,
        0,
        0
    ])
        rotate([0,90,0])
            cylinder(h=ring_length, r=ring_thickness/2, $fn=64);
}
