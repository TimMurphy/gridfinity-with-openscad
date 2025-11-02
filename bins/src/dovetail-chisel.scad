// src/dovetail-chisel.scad
// Dovetail Chisel Module
// All dimensions in millimeters (mm)

// ---- Parameters ----
// blade_width is passed in from the parent file
// Other dimensions are fixed per specification

blade_length = 58;
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
    // Blade
    translate([0,0,0])
        cube([blade_width, blade_length, socket_blade_end_thickness], center=false);
    // Socket
    translate([0,0,blade_length])
        hull() {
            cylinder(h=socket_length, r=socket_blade_end_thickness/2, $fn=64);
            translate([0,0,socket_length])
                cylinder(h=1, r=socket_handle_end_thickness/2, $fn=64);
        }
    // Handle
    translate([0,0,blade_length+socket_length])
        hull() {
            cylinder(h=1, r=handle_socket_end_thickness/2, $fn=64);
            translate([0,0,handle_length/2])
                cylinder(h=1, r=handle_mid_thickness/2, $fn=64);
            translate([0,0,handle_length])
                cylinder(h=1, r=handle_ring_end_thickness/2, $fn=64);
        }
    // Ring
    translate([0,0,blade_length+socket_length+handle_length])
        cylinder(h=ring_length, r=ring_thickness/2, $fn=64);
}
