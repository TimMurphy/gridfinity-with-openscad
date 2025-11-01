include <../../../gridfinity-rebuilt-openscad/src/core/standard.scad>
use <../../../gridfinity-rebuilt-openscad/src/core/gridfinity-rebuilt-utility.scad>
use <../../../gridfinity-rebuilt-openscad/src/core/gridfinity-rebuilt-holes.scad>
use <../../../gridfinity-rebuilt-openscad/src/core/bin.scad>
use <../../../gridfinity-rebuilt-openscad/src/core/cutouts.scad>
use <../../../gridfinity-rebuilt-openscad/src/helpers/generic-helpers.scad>
use <../../../gridfinity-rebuilt-openscad/src/helpers/grid.scad>
use <../../../gridfinity-rebuilt-openscad/src/helpers/grid_element.scad>
use <../../../gridfinity-rebuilt-openscad/src/helpers/generic-helpers.scad>

// ===== MODULE FOR SIMPLE BIN CREATION ===== //

// Create a simple bin with just 3 parameters
// xGrids: number of bases along x-axis (must be >= 1)
// yGrids: number of bases along y-axis (must be >= 1) 
// height: height in millimeters above the bin feet (must be >= 3)
module create_bin(xGrids, yGrids, height) {
    // Validate parameters
    assert(xGrids >= 1, "xGrids must be at least 1");
    assert(yGrids >= 1, "yGrids must be at least 1");
    assert(height > 3, "height must be greater than 3");
    
    // Create bin with simplified parameters
    bin_simple = new_bin(
        grid_size = [xGrids, yGrids],
        height_mm = height,
        fill_height = 0, // Use default
        include_lip = false, // Default to no lip for simplicity
        hole_options = bundle_hole_options(false, false, false, false, false, false), // No holes by default
        only_corners = false,
        thumbscrew = false,
        grid_dimensions = GRID_DIMENSIONS_MM
    );
    
    // Render the bin as a solid container (no compartments)
    bin_render(bin_simple);
}
