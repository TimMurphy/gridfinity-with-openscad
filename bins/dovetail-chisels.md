# Dovetail Chisels Holder

A custom Gridfinity bin designed to hold 3 dovetail chisels (3mm, 6mm, and 12mm) with ergonomic cutouts for easy access and secure storage.

## Project Structure
```
bins/
├── dovetail-chisels.scad    # Main chisel bin implementation
├── dovetail-chisels.md      # This documentation file
└── src/
    └── solid-bin.scad           # Base bin creation module
```

## Chisel Specifications

### Physical Dimensions
- **Chisel blade widths**: 3mm, 6mm, 12mm
- **Overall chisel length**: 225mm total
- **Quantity**: 3 chisels (one of each size)

### Component Breakdown
#### Blade Section (Cutting End)
- **Length**: 60mm
- **Widths**: 3mm, 6mm, 12mm (at cutting edge)
- **Storage requirement**: Blades lie flat in 5mm deep recesses to protect cutting edges

#### Taper Section (Blade to Handle Transition)
- **Length**: 64mm
- **Handle end width**: 17mm
- **Blade end width**: 8.3mm  
- **Profile**: Linear taper connecting handle to blade

#### Handle Section
- **Length**: 131mm (calculated: 225 - 60 - 64mm)
- **Maximum width**: 25mm (at grip area)
- **Minimum width**: 20mm
- **Cross-section**: Round profile
- **Grip area**: Ergonomic finger relief needed for removal

## Gridfinity Bin Specifications

### Design Features

#### Blade Protection Recesses
- **Depth**: 5mm deep from top surface
- **Purpose**: Protects cutting edges, prevents blade damage

#### Handle Access Holes
- **Type**: Cylindrical through-holes with finger reliefs
- **Finger relief**: Oval cutout 35mm×20mm×8mm deep for grip
- **Purpose**: Easy chisel insertion/removal

#### Taper Channels
- **Function**: Connects blade recesses to handle holes
- **Cross-section**: Circular

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
