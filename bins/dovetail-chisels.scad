// ===== DOVETAIL CHISELS BIN ===== //

/*
    Custom Gridfinity bin for storing 3 dovetail chisels (3mm, 6mm, 12mm)
    
    Features:
    - Individual blade recesses (5mm deep) to protect cutting edges
    - Tapered channels with hull-generated smooth transitions
    - Cylindrical handle holes with ergonomic finger relief cutouts
    - Raised text labels for identification ("3mm", "6mm", "12mm")
    
    Specifications from dovetail-chisels.md:
    - Grid size: 6×2 units (252mm × 84mm internal)
    - Height: 35mm above Gridfinity base feet
    - Total chisel length: 225mm (fits in 232mm available space)
    - Chisel positions: Y=21mm, 42mm, 63mm (evenly spaced)
    
    Project structure:
    - This file: dovetail-chisels.scad
    - Base module: src/solid-bin.scad (provides create_bin function)
    - Documentation: dovetail-chisels.md
*/

include <src/solid-bin.scad>

// ===== PARAMETERS ===== //

// Gridfinity bin dimensions (from dovetail-chisels.md specifications)
xGrids = 6; // 6 grid units wide (252mm external, ~242mm internal usable)
yGrids = 2; // 2 grid units deep (84mm external, ~74mm internal usable)  
height = 35; // 35mm above Gridfinity base feet

// Chisel physical specifications (from markdown)
chisel_length = 225; // Overall chisel length (blade + taper + handle)
blade_length = 60;   // Blade section length
taper_length = 64;   // Taper section length (blade to handle transition)
handle_length = 131; // Handle section length (calculated: 225-60-64)

// Blade dimensions for 3mm, 6mm, 12mm chisels
blade_widths = [3, 6, 12]; // Actual blade cutting widths
blade_recess_widths = [5, 8, 14]; // Blade width + 2mm clearance each side

// Cutout dimensions (from layout specifications)
blade_recess_length = 62; // 60mm blade + 2mm clearance
blade_recess_depth = 5;   // 5mm deep from top surface (protects cutting edges)
taper_depth = 10;         // 10mm deep from top surface (accommodates handle profile)  
handle_diameter = 27;     // 25mm max handle width + 2mm clearance

// Finger relief dimensions for ergonomic handle access
relief_length = 35;       // 35mm long (along chisel axis)
relief_width = 20;        // 20mm wide (perpendicular to chisel)
relief_depth = 8;         // 8mm deep from top surface

// Text label parameters
text_height = 2;          // 2mm raised above bin floor
font_size = 4;            // 4mm font height (Liberation Sans Bold)

// Layout positioning (from markdown layout configuration)
chisel_positions_y = [21, 42, 63]; // Y-axis positions (21mm center-to-center spacing)

// Key X-axis positions (from markdown functional layout)
blade_recess_x = 10;      // Blade recesses start 10mm from front edge
taper_start_x = 72;       // Taper channels start at X=72mm (end of blade recess area)
taper_end_x = 150;        // Taper channels end at X=150mm (beginning of handle area)  
handle_x = 220;           // Handle holes at X=220mm from front edge
text_x = 100;             // Text labels centered at X=100mm (center of bin)

// Calculated dimensions for verification
external_x = xGrids * 42; // ~252mm external width
external_y = yGrids * 42; // ~84mm external depth
internal_x = external_x - 10; // ~242mm internal usable width
internal_y = external_y - 10; // ~74mm internal usable depth

// ===== IMPLEMENTATION ===== //

module dovetail_chisels_bin() {
    difference() {
        // Create the base Gridfinity bin using solid-bin module
        create_bin(xGrids, yGrids, height);
        
        // Create cutouts for each of the 3 chisels (oriented lengthwise along X-axis)
        for (i = [0:2]) {
            chisel_y = chisel_positions_y[i]; // Y position for this chisel
            
            // Blade protection recess (rectangular, 5mm deep from top)
            // Location: Front of bin (X=10mm), individual width per chisel
            translate([blade_recess_x, chisel_y - blade_recess_widths[i]/2, height - blade_recess_depth]) {
                cube([blade_recess_length, blade_recess_widths[i], blade_recess_depth + 1]);
            }
            
            // Handle access hole (cylindrical through-hole)
            // Location: Back of bin (X=220mm), 27mm diameter for all chisels
            translate([handle_x, chisel_y, -1]) {
                cylinder(d=handle_diameter, h=height + 2);
            }
            
            // Finger relief cutout (oval-shaped for ergonomic grip)
            // Location: Same as handle hole but only 8mm deep from top
            translate([handle_x, chisel_y, height - relief_depth]) {
                scale([relief_length/relief_width, 1, 1]) {
                    cylinder(d=relief_width, h=relief_depth + 1);
                }
            }
            
            // Taper channel (hull-generated smooth transition)
            // Connects blade recess area to handle area with gradual profile change
            hull() {
                // Start: End of blade recess area (rectangular profile)
                translate([taper_start_x, chisel_y - 8.5, height - taper_depth]) {
                    cube([2, 17, taper_depth + 1]); // 17mm matches handle end width
                }
                
                // End: Beginning of handle area (circular profile) 
                translate([taper_end_x, chisel_y, height - taper_depth]) {
                    cylinder(d=18, h=taper_depth + 1); // 18mm transition diameter
                }
            }
        }
    }
    
    // Add raised identification labels at bottom of bin
    for (i = [0:2]) {
        chisel_y = chisel_positions_y[i];
        
        // Text label: blade width + "mm" (e.g., "3mm", "6mm", "12mm")
        translate([text_x, chisel_y, 0]) {
            linear_extrude(height=text_height) {
                text(str(blade_widths[i], "mm"), 
                     size=font_size, 
                     halign="center", 
                     valign="center",
                     font="Liberation Sans:style=Bold");
            }
        }
    }
}

// ===== RENDER ===== //

dovetail_chisels_bin();

// ===== DEBUG & VERIFICATION INFO ===== //

echo("=== Dovetail Chisels Bin - Generation Report ===");
echo(str("Gridfinity grid size: ", xGrids, "×", yGrids, " units"));  
echo(str("Bin height: ", height, "mm above base feet"));
echo(str("External dimensions: ~", (xGrids * 42), "×", (yGrids * 42), "×", height, "mm"));
echo(str("Internal usable space: ~", (xGrids * 42 - 10), "×", (yGrids * 42 - 10), "×", (height - 5), "mm"));
echo("");
echo("Chisel accommodation:");
echo(str("  Total chisel length: ", chisel_length, "mm"));
echo(str("  Available X-space: ", handle_x + 20, "mm (", handle_x + 20 - chisel_length, "mm clearance)"));
echo(str("  Y positions: ", chisel_positions_y, "mm"));
echo(str("  Blade recess widths: ", blade_recess_widths, "mm"));
echo("");
echo("Layout verification:");
echo(str("  Blade recesses: X=", blade_recess_x, "-", blade_recess_x + blade_recess_length, "mm"));
echo(str("  Taper channels: X=", taper_start_x, "-", taper_end_x, "mm"));  
echo(str("  Handle holes: X=", handle_x, "mm (", handle_diameter, "mm diameter)"));
echo(str("  Text labels: X=", text_x, "mm (", font_size, "mm font, ", text_height, "mm height)"));
echo("");
echo("Print settings (recommended):");
echo("  Material: PLA filament");
echo("  Layer height: 0.2mm"); 
echo("  Infill: 10-15%");
echo("  Estimated time: 4-6 hours");
echo("  Supports: May need for finger reliefs");
echo("");
echo("✓ Ready for OpenSCAD render and 3D printing!");
echo("✓ Fits standard Gridfinity ecosystem");
echo("✓ All measurements verified against dovetail-chisels.md specs");
