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
- The blade should be lying down (X axis), and the center of the blade must be aligned to the center of the socket.


### Notes
- All dimensions are intended for reference in design and modeling (e.g., OpenSCAD).


---

## SCAD Generation Instructions

When asked to "generate scad from #file:dovetail-chisel.md", the following files will be created:

- `./dovetail-chisel.scad`: Top-level file. Set `blade_width` to 3, 6, or 12. This file calls the module in `./src/dovetail-chisel.scad`.
- `./src/dovetail-chisel.scad`: Contains the `dovetail_chisel(blade_width)` module, using all dimensions from this specification. The blade width is passed as a parameter.

This structure allows easy selection of blade width and keeps the model organized for future extension.

