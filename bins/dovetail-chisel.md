# Dovetail Chisel Specification

This document describes the dimensions and features of a dovetail chisel, organized by component. All measurements are in millimeters (mm).

---


## Blade
- **Width:** _Parameter in SCAD file_: 3mm, 6mm, or 12mm (selectable)
- **Length:** 58mm

## Socket
- **Length:** 65mm
- **Blade End Thickness:** 8.27mm (where blade enters socket)
- **Handle End Thickness:** 16mm (where socket meets handle)

## Handle
- **Total Length:** 98.5mm (includes ring)
- **Ring End Thickness:** 20.5mm (diameter at ring end)
- **Midpoint Thickness:** 21.5mm (diameter at midpoint)
- **Socket End Thickness:** 20.5mm (diameter at socket end)

## Ring
- **Length:** 11mm
- **Thickness:** 22mm (diameter)

---

## Orientation & Alignment
- All parts of the chisel should be consistently oriented (either all lying down or all standing up) in the model.
- The blade should be lying down (X axis).
- The center of the blade must align with the center of the socket.
- The center of the socket must align with the center of the handle.


### Notes
- All dimensions are intended for reference in design and modeling (e.g., OpenSCAD).


---

## SCAD Generation Instructions

To generate the SCAD files from this specification, follow these steps:

1. **Delete old files:**
	- Remove `./dovetail-chisel.scad` if it exists.
	- Remove `./src/dovetail-chisel.scad` if it exists.

2. **Create new files:**
	- `./dovetail-chisel.scad`: This is the top-level file. Set the `blade_width` parameter to 3, 6, or 12. It imports and calls the module from `./src/dovetail-chisel.scad`.
	- `./src/dovetail-chisel.scad`: This file defines the `dovetail_chisel(blade_width)` module, using all dimensions from this specification. The blade width is passed as a parameter.

3. **Alignment and orientation:**
	- All parts must be consistently oriented (lying down along the X axis).
	- The center of the blade must align with the center of the socket.
	- The center of the socket must align with the center of the handle.

This workflow ensures the SCAD files are always generated from the latest markdown specification, with no legacy code or history. The structure allows easy selection of blade width and keeps the model organized for future extension.

