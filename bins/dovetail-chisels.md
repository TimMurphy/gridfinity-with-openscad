# Dovetail Chisels Holder

A custom Gridfinity bin designed to hold 3 dovetail chisels (3mm, 6mm, and 12mm) with ergonomic cutouts for easy access and secure storage.

## Chisel Specifications

### Set Details
- **Chisel blade widths**: 3mm, 6mm, 12mm
- **Overall chisel length**: 225mm
- **Quantity**: 3 chisels

### Blade Section
- **Length**: 60mm
- **Widths**: 3mm, 6mm, 12mm (at cutting edge)
- **Storage requirement**: Blades should lie flat in a 5mm deep recess to protect cutting edges

### Taper Section (Blade to Handle Transition)
- **Length**: 64mm
- **Handle end width**: 17mm
- **Blade end width**: 8.3mm
- **Profile**: Linear taper connecting handle to blade

### Handle Section
- **Length**: 131mm (calculated: 225 - 60 - 64mm)
- **Top section**: 25mm width × 11mm length, then tapers to 20mm width
- **Bottom section**: 20mm width
- **Midpoint width**: 21.5mm
- **Profile**: Round cross-section

## Bin Design Requirements

### Gridfinity Dimensions
- **Grid size**: 6×2 units (6 units wide × 2 units deep)
- **Internal dimensions**: ~252mm × 84mm (42mm per grid unit minus walls)
- **Height**: 35mm above bin feet
- **Reason**: Accommodates 225mm chisel length (252mm internal) with clearance

### Cutout Design

#### Blade Storage Area
- **Type**: Flat recessed area, 5mm deep
- **Dimensions**: 
  - Length: 62mm (60mm blade + 2mm clearance)
  - Width per chisel: 
    - 3mm chisel: 5mm wide recess (3mm + 2mm clearance)
    - 6mm chisel: 8mm wide recess (6mm + 2mm clearance)  
    - 12mm chisel: 14mm wide recess (12mm + 2mm clearance)
- **Position**: One end of each chisel slot (aligned with grid)
- **Purpose**: Protects cutting edges, prevents movement

#### Handle Cutouts
- **Type**: Cylindrical holes with ergonomic finger relief
- **Diameter**: 27mm (accommodates 25mm max handle width + clearance)
- **Depth**: Through-hole or 30mm deep minimum
- **Finger relief**: 
  - Oval cutout at handle midpoint: 35mm × 20mm × 8mm deep
  - Purpose: Easy finger and thumb grip for removal

#### Taper Section Accommodation
- **Type**: Tapered channel connecting blade recess to handle hole
- **Profile**: Matches chisel taper (17mm to 8.3mm over 64mm length)
- **Depth**: 10mm to accommodate cylindrical handle profile
- **Cross-section**: Gradually transitions from rectangular (blade area) to circular (handle area)

#### Labels
- **Text**: Each chisel slot labeled with blade width ("3mm", "6mm", "12mm")
- **Position**: Bottom of each chisel slot, centered
- **Font**: Sans-serif, bold, 2mm height for visibility
- **Purpose**: Quick identification and organization

### Layout Configuration

#### Individual Chisel Slot Layout
```
[Blade Recess] ----[Taper Channel]---- [Handle Hole with Relief]
     (5mm deep)        (10mm deep)         (Through or 30mm)
|<--- 62mm --->|<------ 64mm ----->|<------- 99mm ------->|
                Total length: 225mm
```

#### Overall Bin Layout (Top View)
```
Grid Units:  1    2    3    4    5    6
           |----|----|----|----|----|----|
Row 1:     [    3mm Chisel Slot        ] } 28mm spacing
           |                            |
Row 2:     [    6mm Chisel Slot        ] } 28mm spacing  
           |                            |
Row 3:     [   12mm Chisel Slot        ]
           |----|----|----|----|----|----|
```

### Spacing Between Chisels
- **Center-to-center distance**: 28mm (accommodates 2 grid units width)
- **Reason**: Provides adequate clearance for handles while fitting 3 chisels in 2×6 grid
- **Alignment**: Each chisel centered in its 28mm wide lane

## Technical Implementation Details

### OpenSCAD Parameters for create_bin()
- **xGrids**: 6 (6 grid units wide)
- **yGrids**: 2 (2 grid units deep)  
- **height**: 35 (35mm above bin feet)

### Custom Cutouts Required
1. **Blade recesses**: 3 rectangular cutouts, varying widths, 5mm deep
2. **Handle holes**: 3 circular holes, 27mm diameter, through-holes
3. **Taper channels**: 3 connecting channels with gradual taper
4. **Finger reliefs**: 3 oval cutouts, 35×20×8mm
5. **Text labels**: Raised text "3mm", "6mm", "12mm"

### Cutout Positioning (from front-left corner)
- **3mm chisel**: X=14mm, Y=14mm (centered in first 28mm lane)
- **6mm chisel**: X=42mm, Y=14mm (centered in second 28mm lane)  
- **12mm chisel**: X=70mm, Y=14mm (centered in third 28mm lane)

## Manufacturing Notes
- **Material**: Standard PLA filament
- **Layer height**: 0.2mm recommended for smooth surfaces
- **Infill**: 5% - strength is not required
- **Support**: May be needed for finger relief overhangs and text labels
- **Print orientation**: Bin laying down
- **Post-processing**: Light sanding of contact surfaces recommended

## Usage
1. Blades rest in shallow recesses (cutting edge protected)
2. Handles accessible via finger relief cutouts
3. Tapered sections guide proper alignment
4. Fits standard Gridfinity ecosystem for modular organization
