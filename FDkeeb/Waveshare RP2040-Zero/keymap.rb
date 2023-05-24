# FDkeeb
# Author: alg
# Board : RP2040Zero

kbd = Keyboard.new

kbd.init_direct_pins(
  [  29 ]
)

kbd.add_layer :default, %i(
  SAVE
)

kbd.define_composite_key :SAVE, %i(KC_LCTL KC_S)

rgb = RGB.new(
  0,
  0,
  1,
  true
)
rgb.effect     = :breath
rgb.speed      = 22
rgb.hue        = 0
rgb.saturation = 0
rgb.value      = 13
kbd.append rgb

kbd.start!
