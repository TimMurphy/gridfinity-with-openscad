# Dovetail Chisels Holder

A custom Gridfinity bin designed to hold 3 dovetail chisels (3mm, 6mm, and 12mm) with ergonomic cutouts for easy access and secure storage.

## Project Structure
```
bins/
├── dovetail-chisel.md          # Specification for a dovetail chisel
├── dovetail-chisel.scad        # Generated SCAD file from dovetail-chisel.md
├── dovetail-chisels-bin.md     # This specification file
├── dovetail-chisels-bin.scad   # Generated SCAD file from dovetail-chisels-bin.md
└── src/
    ├── dovetail-chisel.scad    # Generated SCAD file from dovetail-chisel.md
    └── solid-bin.scad          # Base bin creation module
```


## Chisel Specifications

See dovetail-chisel.md, dovetail-chisel.scad & src/dovetail-chisel.scad

## Gridfinity Bin Specifications

The bin is to hold 3 dovetail chisels (3mm, 6mm & 12mm) side by side with an even gap between chisels and sides.

### Design Features

#### Bin Length Calculation

- Minimum Length is
    - 5mm top gap
    - Chisel length
    - 5mm gap
    - Size text
    - 5mm bottom gap

- Actual bin length is the first multiple of 42mm (Gridfinity unit) greater than minimum length

- The difference between actual bin length and minimum bin length it evenly distributed to top gap and bottom gap.

#### Bin Width Calculation

- The gap from the widest part of a chisel to a side is 5mm
- The minimum gap between the widest part of chisels is 5mm
- Minimum bin width = (chisel1_max_width + chisel2_max_width + chisel3_max_width) + (2 * side_gap) + (2 * inter_chisel_gap)
- Actual bin width is the first multiple of 42mm (Gridfinity unit) greater than minimum bin width
- The gap between the sides and each chisel is evenly distributed for the actual bin width

#### Blade Protection Recesses
- **Depth**: 5mm deep from top surface
- **Purpose**: Protects cutting edges, prevents blade damage

#### Handle Access Holes
- **Finger relief**: Oval cutout 35mm×20mm×8mm deep for grip
- **Purpose**: Easy chisel insertion/removal

#### Identification Labels
- **Text**: "3mm", "6mm", "12mm" for each chisel slot
- **Style**: Raised 2mm above bin floor
- **Material**: Integrated into print (no separate labeling needed)

## Layout Configuration

## 3D Printing Guide

### Recommended Print Settings
- **Material**: PLA filament (PETG acceptable for higher durability)
- **Layer height**: 0.2mm for good surface finish
- **Infill**: 10-15% (low strength requirements, focus on surface quality)
- **Print speed**: 50-60mm/s for good quality
- **Nozzle temperature**: 210°C PLA / 240°C PETG
- **Bed temperature**: 60°C PLA / 70°C PETG

## Usage Instructions

### Loading Chisels
1. **Identify correct slot** using raised size labels ("3mm", "6mm", "12mm")
2. **Insert blade first** into front recess (protects cutting edge)
3. **Lower handle** into back hole through taper channel
4. **Press down gently** until chisel sits flush in recesses

### Removing Chisels
1. **Use finger relief** oval cutouts to grip handle
2. **Lift straight up** - taper channels guide smooth removal
3. **Blade automatically clears** recess as handle lifts

### Organization Benefits
- **Blade protection**: Cutting edges never contact hard surfaces
- **Easy identification**: Clear size labeling prevents mix-ups
- **Modular storage**: Integrates with standard Gridfinity grid system
- **Workshop efficiency**: Quick visual inventory of available tools

## SCAD file generation

Put calculation in the .scad file, not the result.

Wrong
```openscad
xOffset = 10
```

Right
```openscad
x = 2
chisel = 8
xOffset = x + chisel
```

## OpenSCAD Usage Note

When including the base bin module in your OpenSCAD file, use:

```openscad
include <src/solid-bin.scad>
```

Use create_bin(xGrids, yGrids, height) to create the Gridfinity bin. Height is in mm above the Gridfinity feet.
