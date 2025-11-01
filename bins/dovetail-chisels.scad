// ===== DOVETAIL CHISELS BIN ===== //

/*
    Gridfinity bin for storing dovetail chisels
    Uses the simplified create_bin module from solid-bin.scad
*/

include <./src/solid-bin.scad>

// ===== PARAMETERS ===== //

// Bin dimensions for dovetail chisels
// Adjust these parameters as needed for your chisel collection
xGrids = 1; // Number of grid units along x-axis (must be >= 1)
yGrids = 1; // Number of grid units along y-axis (must be >= 1)
height = 30; // Height in millimeters above the bin feet

// ===== IMPLEMENTATION ===== //

// Create the bin using the simplified interface
create_bin(xGrids, yGrids, height);
