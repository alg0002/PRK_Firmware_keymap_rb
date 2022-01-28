# Shotgun Cherry Pie
# Rapsberry Pi Pico

kbd = Keyboard.new

kbd.init_pins(
  [ 9, 10, 11, 12, 14 ], # row0, row1,... respectively
  [ 5, 4, 2, 3 ] # col0, col1,... respectively
)

kbd.add_layer :default, %i[
  RGB_TOG  KC_9     KC_6     KC_3
  RGB_TOG  KC_8     KC_5     KC_2
  RGB_TOG  KC_7     KC_4     KC_1
  RGB_TOG  KC_PGUP  KC_PGDN  KC_DOT
  RGB_TOG  KC_HOME  KC_END   KC_0
]

encoder_1 = RotaryEncoder.new(27, 28)
encoder_1.clockwise do
  kbd.send_key :RGB_SPI
end
encoder_1.counterclockwise do
  kbd.send_key :RGB_SPD
end
kbd.append encoder_1

encoder_2 = RotaryEncoder.new(26, 22)
encoder_2.clockwise do
  kbd.send_key :RGB_VAI
end
encoder_2.counterclockwise do
  kbd.send_key :RGB_VAD
end
kbd.append encoder_2

encoder_3 = RotaryEncoder.new(21, 20)
encoder_3.clockwise do
  kbd.send_key :RGB_SAI
end
encoder_3.counterclockwise do
  kbd.send_key :RGB_SAD
end
kbd.append encoder_3

encoder_4 = RotaryEncoder.new(19, 18)
encoder_4.clockwise do
  kbd.send_key :RGB_HUI
end
encoder_4.counterclockwise do
  kbd.send_key :RGB_HUD
end
kbd.append encoder_4

encoder_5 = RotaryEncoder.new(17, 16)
encoder_5.clockwise do
  kbd.send_key :RGB_MOD
end
encoder_5.counterclockwise do
  kbd.send_key :RGB_RMOD
end
kbd.append encoder_5

rgb = RGB.new(
  0,
  28,
  0,
  false
)
rgb.effect = :swirl
kbd.append rgb

kbd.start!
