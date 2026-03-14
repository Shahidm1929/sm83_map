Game Boy SM83 CPU Leaflet Map
=============================

Web-based map of the Game Boy's SM83 CPU core with overlays.

Made with [Leaflet](https://leafletjs.com/), [Leaflet-Minimap](https://github.com/Norkart/Leaflet-MiniMap/),
[Leaflet-Nanoscale](https://github.com/whitequark/Leaflet.Nanoscale/) and
[Leaflet-PolylineMeasure](https://github.com/ppete2/Leaflet.PolylineMeasure).


Live version of the map
-----------------------

You can use the latest version of the map [here](http://iceboy.a-singer.de/sm83_map/).

![map overview](map_overview.png)


Getting the images and generating the tiles
-------------------------------------------

The source images that are needed to create the tile layers for the map are not part of this repository. The die shots
have to be downloaded and the transparent overlays can either be generated from netslists or downloaded as explained
below.

First, create a folder named `img_src` in this repositories top level directory, so we can put the source images
in there. The scripts in the `script` folder take the source images from there.

Download Gekkio's die shot (`SGB-CPU_01_sm83_core_40x.jpg`) from
[here](https://gekkio.fi/files/decapped-chips/Frankenscope/Nintendo_SGB-CPU_01/) and ogamespec's Photoshop file
(`DMG01B_Core_Fused.psd`) from the Google drive
[here](https://drive.google.com/drive/u/0/folders/1deuhwmRb-PVv-K7pEllSLKQda2ft94Mk) and put them both into the
`img_src` folder (or symlink them from there).

You can download the latest overlay images from [here](https://iceboy.a-singer.de/sm83_map/img_src/)
or you can generate them by yourself. Either way, place the images into the `img_src` folder as well. To generate them
yourself, you need the netlists from the [dmg-schematics](https://github.com/msinger/dmg-schematics) repository and
the conversion tool from [here](https://github.com/msinger/nlconv). Build the conversion tool (nlconv.exe) like described
[here](https://github.com/msinger/nlconv/blob/master/INSTALL). You need to have `mono` installed. Then change into the
`netlist` directory of the dmg-schematics repository and run `make sm83-cells sm83-floorplan sm83-labels sm83-wires`.
This generates four PNG files: `sm83-cells.png`, `sm83-floorplan.png`, `sm83-labels.png` and `sm83-wires.png`. Copy
them into your `img_src` directory.

You should now have the following source image files:
```
img_src/DMG01B_Core_Fused.psd
img_src/SGB-CPU_01_sm83_core_40x.jpg
img_src/sm83-cells.png
img_src/sm83-floorplan.png
img_src/sm83-labels.png
img_src/sm83-wires.png
```

Now change into the `scripts` directory and run the script that applies some transformations to the die shots:
```
cd scripts
./transform_die_shots.sh
```

The scripts require ImageMagick! to be installed. After running the transformation, your `img_src` directory
should look like this:
```
img_src/DMG01B_Core_Fused.psd
img_src/gekkio_sgb_sm83_40x.png
img_src/ogamespec_dmg_cpu_b_sm83.png
img_src/ogamespec_dmg_cpu_b_sm83_lapped.png
img_src/ogamespec_topo.png
img_src/SGB-CPU_01_sm83_core_40x.jpg
img_src/sm83-cells.png
img_src/sm83-floorplan.png
img_src/sm83-labels.png
img_src/sm83-wires.png
```

The original two die shot files from Gekkio and ogamespec are no longer required now. The newly generated die shots
(`gekkio_sgb_sm83_40x.png`, `ogamespec_dmg_cpu_b_sm83.png` and `ogamespec_dmg_cpu_b_sm83_lapped.png`) and ogamespec's
topology overlay (`ogamespec_topo.png`) have the same size as the other PNG overlays and are aligned with them.

While your working directory is still the `scripts` directory, run the last script that converts all images to tiles:
```
./gen_all.sh
```

The tiles will be output into the `map` directory. Now you should be able to open the `index.html` file
in a browser to use the map. You can delete the `img_src` directory now to save space.
