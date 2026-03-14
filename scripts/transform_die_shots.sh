#!/bin/sh

# Get Gekkio's die shot from https://gekkio.fi/files/decapped-chips/Frankenscope/Nintendo_SGB-CPU_01/
# Get ogamespec's Photoshop (.psd) file from https://drive.google.com/drive/u/0/folders/1deuhwmRb-PVv-K7pEllSLKQda2ft94Mk

set -e

magick ../img_src/SGB-CPU_01_sm83_core_40x.jpg \
       -filter     triangle \
       -resize     16360x \
       -background white \
       -gravity    west \
       -extent     16384x16384 \
       ../img_src/gekkio_sgb_sm83_40x.png

magick ../img_src/DMG01B_Core_Fused.psd[0] \
       -filter     triangle \
       -background white \
       -compose    src-over \
       \( \
         -clone    0 \
         -alpha    transparent \
       \) \
       -swap 0 \
       +delete \
       ../img_src/DMG01B_Core_Fused.psd[1] \
       -flatten \
       -resize     20310x16844\! \
       -gravity    northwest \
       -crop       16384x15143+2720+890 \
       +repage \
       -gravity    center \
       -extent     16384x16384 \
       ../img_src/ogamespec_dmg_cpu_b_sm83.png

magick ../img_src/DMG01B_Core_Fused.psd[0] \
       -filter     triangle \
       -background white \
       -compose    src-over \
       \( \
         -clone    0 \
         -alpha    transparent \
       \) \
       -swap 0 \
       +delete \
       ../img_src/DMG01B_Core_Fused.psd[2] \
       ../img_src/DMG01B_Core_Fused.psd[3] \
       -flatten \
       -resize     20310x16844\! \
       -gravity    northwest \
       -crop       16384x15143+2720+890 \
       +repage \
       -gravity    center \
       -extent     16384x16384 \
       ../img_src/ogamespec_dmg_cpu_b_sm83_lapped.png

magick ../img_src/DMG01B_Core_Fused.psd[0] \
       -filter     triangle \
       -background transparent \
       -compose    src-over \
       \( \
         -clone    0 \
         -alpha    transparent \
       \) \
       -swap 0 \
       +delete \
       ../img_src/DMG01B_Core_Fused.psd[5] \
       ../img_src/DMG01B_Core_Fused.psd[6] \
       ../img_src/DMG01B_Core_Fused.psd[7] \
       ../img_src/DMG01B_Core_Fused.psd[8] \
       ../img_src/DMG01B_Core_Fused.psd[9] \
       ../img_src/DMG01B_Core_Fused.psd[10] \
       ../img_src/DMG01B_Core_Fused.psd[11] \
       ../img_src/DMG01B_Core_Fused.psd[12] \
       ../img_src/DMG01B_Core_Fused.psd[13] \
       ../img_src/DMG01B_Core_Fused.psd[14] \
       ../img_src/DMG01B_Core_Fused.psd[15] \
       -flatten \
       -resize     20310x16844\! \
       -gravity    northwest \
       -crop       16384x15143+2720+890 \
       +repage \
       -gravity    center \
       -extent     16384x16384 \
       ../img_src/ogamespec_topo.png
