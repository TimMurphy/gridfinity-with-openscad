// dovetail-chisel.scad
// Top-level file to select blade width and render dovetail chisel
// Usage: Set blade_width to 3, 6, or 12

// Select blade width here
blade_width = 6; // [3, 6, 12]

// Import the chisel module
use <src/dovetail-chisel.scad>;

dovetail_chisel(blade_width);
