#!/bin/sh

# Input pictures are:
#  ../img_src/gekkio_sgb_sm83_40x.png:             16384x16384 pixels
#  ../img_src/ogamespec_dmg_cpu_b_sm83.png:        16384x16384 pixels
#  ../img_src/ogamespec_dmg_cpu_b_sm83_lapped.png: 16384x16384 pixels
#  ../img_src/ogamespec_topo.png:                  16384x16384 pixels
#  ../img_src/sm83_cells.png:                      16384x16384 pixels
#  ../img_src/sm83_wires.png:                      16384x16384 pixels
#  ../img_src/sm83_labels.png:                     16384x16384 pixels
#  ../img_src/sm83_floorplan.png:                  16384x16384 pixels
#
# This should produce:
#  gekkio_sgb_sm83_40x             with zoom level 0...6
#  ogamespec_dmg_cpu_b_sm83        with zoom level 0...6
#  ogamespec_dmg_cpu_b_sm83_lapped with zoom level 0...6
#  ogamespec_topo                  with zoom level 0...6
#  cells                           with zoom level 0...6
#  wires                           with zoom level 0...6
#  labels                          with zoom level 0...6
#  floorplan                       with zoom level 0...6

set -e
TILE_SZ=256
DST_EXT=.jpg ./gen_tiles.sh ../img_src/gekkio_sgb_sm83_40x.png ../map/gekkio_sgb_sm83_40x $TILE_SZ
DST_EXT=.jpg ./gen_tiles.sh ../img_src/ogamespec_dmg_cpu_b_sm83.png ../map/ogamespec_dmg_cpu_b_sm83 $TILE_SZ 85
DST_EXT=.jpg ./gen_tiles.sh ../img_src/ogamespec_dmg_cpu_b_sm83_lapped.png ../map/ogamespec_dmg_cpu_b_sm83_lapped $TILE_SZ
./gen_tiles.sh ../img_src/ogamespec_topo.png ../map/ogamespec_topo $TILE_SZ
./gen_tiles.sh ../img_src/sm83_cells.png ../map/cells $TILE_SZ
./gen_tiles.sh ../img_src/sm83_wires.png ../map/wires $TILE_SZ
./gen_tiles.sh ../img_src/sm83_labels.png ../map/labels $TILE_SZ
./gen_tiles.sh ../img_src/sm83_floorplan.png ../map/floorplan $TILE_SZ
