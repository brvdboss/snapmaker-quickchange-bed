# Snapmaker-quickchange-bed
 Quick change bed for Snapmaker

The snapmaker 3in 1 3D printer has a 3d print function, cnc function and laser function.
Using these 3 features requires mounting of a different toolhead, but also mounting of different toolbeds. This requires 22 screws that need to be loosened, change bed and again reuse 22 screws (actually not all of them are used for the cnc & laser bed, but it feels like 50 screws).  Especially if you're doing it by hand. (Which I do after breaking a few inserts after using a powertool).

A second challenge is that the carriage of the snapmaker isn't necessarily "flat" (and/or parallell to the x-axis). Especially when 3d printing, the bed and carriage warp with the heat of the heated bed which creates additional annoyances.

To combat this problem I wanted to create a system that allows:
* to easily and quickly change the toolbeds
* provides a rigid and flat surface

The basic idea is to:
* use an MDF baseplate with strong magnets
* pre-mount all the toolbeds to another piece of MDF and have it snap on to the magnets
* require the leqst amount of tools possible to change toolbeds.

This idea has been discussed and pitched in the snapmaker forum: https://forum.snapmaker.com/t/idea-for-quick-switch-bed-feedback-requested/13937 and this repository contains the current solution (work in progress).  Different types of connecting the different plates have been discussed, but so far the magnet based solution seems the easiest. Both in usage and to implement.

The main advantages are:
* Easy to change buildplates, no more screwing around
* Rigid & flat surface (the base plat can be milled to be parallel with the x-axis)
* better insulation for the 3d print plate which should reduce heating times and provide a more stable base temperature. Also less heat transfer to the carriage which should reduce the warping, which is also countered by the MDF

The main disadvantages:
* with 18mm thick MDF you lose up to 36mm of travel on the z-axis. the "top plates"could be made with 10mm MDF as well, making it 26mm. 

## Magnets
Different connector types have been discussed (see forum link) but magnets is my current personal preference.  I'm using 4 pot-magnets (25mm) in diameter.  Using these I can lift the entire snapmaker device held into the air by just these magnets. As such, I think it's more than strong enough to keep the bed in place, even when doing cnc work, which puts the most stress on the bed.

To create a durable mount for the magnets a "pot" is 3d printed which fits the magnet snuggly and a "lid" that fits the metal counterdisk. These fit perfectly together to make the beds "snap" (putting the snap in snapmaker :)) together consistently in the same place and to avoid wearing out the mdf quickly. This seems to work reliably up till now.

In the base-board a cutout is foreseen so you can use a screwdriver (or something else that's long and strong enough) to use as a lever to separate the two plates.

## Some remarks
* This is still a work in progress and only limited field testing has been done, but so far I'm confident it works as expected.
* All designs are now made to be compatible with the A350.  Adjustments would be needed for the A250 and A150
* Everything is designed using openscad which results in stl files.  Some more steps are required to create manufacturing files (cnc)
* The goal is that everything can be created on the snapmaker device itself. (apart from the pot magnets obviously)
* If a nice grid is engraved on the cnc wasteboard this project uses all 3 functions of the device :)
