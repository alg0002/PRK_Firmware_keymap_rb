# SQU4REkb-6
# Rapsberry Pi Pico

kbd = Keyboard.new
kbd.split = true # This should happen before Keyboard#init_pins.
kbd.split_style = :right_side_flipped_split
kbd.uart_pin = 1
kbd.mutual_uart_at_my_own_risk = true
kbd.set_anchor(:left)

kbd.init_pins(
  [ 10, 11, 12, 13, 14, 15 ], # row
  [ 21, 20, 19, 18, 17, 16 ]  # col
)

# default layer should be added at first
kbd.add_layer :default, %i(
  A1   B1   C1   D1   E1   F1      A1   B1   C1   D1   E1   F1
  A2   B2   C2   D2   E2   F2      A2   B2   C2   D2   E2   F2
  A3   B3   C3   D3   E3   F3      A3   B3   C3   D3   E3   F3
  A4   B4   C4   D4   E4   F4      A4   B4   C4   D4   E4   F4
  A5   B5   C5   D5   E5   F5      A5   B5   C5   D5   E5   F5
  A6   B6   C6   D6   E6   F6      A6   B6   C6   D6   E6   F6
)

kbd.define_mode_key :A1, [ Proc.new {kbd.macro 'A1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :A2, [ Proc.new {kbd.macro 'A2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :A3, [ Proc.new {kbd.macro 'A3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :A4, [ Proc.new {kbd.macro 'A4 ', nil}, nil, 300, nil ]
kbd.define_mode_key :A5, [ Proc.new {kbd.macro 'A5 ', nil}, nil, 300, nil ]
kbd.define_mode_key :A6, [ Proc.new {kbd.macro 'A6 ', nil}, nil, 300, nil ]
kbd.define_mode_key :B1, [ Proc.new {kbd.macro 'B1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :B2, [ Proc.new {kbd.macro 'B2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :B3, [ Proc.new {kbd.macro 'B3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :B4, [ Proc.new {kbd.macro 'B4 ', nil}, nil, 300, nil ]
kbd.define_mode_key :B5, [ Proc.new {kbd.macro 'B5 ', nil}, nil, 300, nil ]
kbd.define_mode_key :B6, [ Proc.new {kbd.macro 'B6 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C1, [ Proc.new {kbd.macro 'C1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C2, [ Proc.new {kbd.macro 'C2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C3, [ Proc.new {kbd.macro 'C3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C4, [ Proc.new {kbd.macro 'C4 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C5, [ Proc.new {kbd.macro 'C5 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C6, [ Proc.new {kbd.macro 'C6 ', nil}, nil, 300, nil ]
kbd.define_mode_key :D1, [ Proc.new {kbd.macro 'D1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :D2, [ Proc.new {kbd.macro 'D2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :D3, [ Proc.new {kbd.macro 'D3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :D4, [ Proc.new {kbd.macro 'D4 ', nil}, nil, 300, nil ]
kbd.define_mode_key :D5, [ Proc.new {kbd.macro 'D5 ', nil}, nil, 300, nil ]
kbd.define_mode_key :D6, [ Proc.new {kbd.macro 'D6 ', nil}, nil, 300, nil ]
kbd.define_mode_key :E1, [ Proc.new {kbd.macro 'E1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :E2, [ Proc.new {kbd.macro 'E2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :E3, [ Proc.new {kbd.macro 'E3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :E4, [ Proc.new {kbd.macro 'E4 ', nil}, nil, 300, nil ]
kbd.define_mode_key :E5, [ Proc.new {kbd.macro 'E5 ', nil}, nil, 300, nil ]
kbd.define_mode_key :E6, [ Proc.new {kbd.macro 'E6 ', nil}, nil, 300, nil ]
kbd.define_mode_key :F1, [ Proc.new {kbd.macro 'F1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :F2, [ Proc.new {kbd.macro 'F2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :F3, [ Proc.new {kbd.macro 'F3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :F4, [ Proc.new {kbd.macro 'F4 ', nil}, nil, 300, nil ]
kbd.define_mode_key :F5, [ Proc.new {kbd.macro 'F5 ', nil}, nil, 300, nil ]
kbd.define_mode_key :F6, [ Proc.new {kbd.macro 'F6 ', nil}, nil, 300, nil ]

encoder_L1 = RotaryEncoder.new(2, 3)
encoder_L1.clockwise do
  kbd.send_key :KC_A
end
encoder_L1.counterclockwise do
  kbd.send_key :KC_B
end
kbd.append encoder_L1

encoder_L2 = RotaryEncoder.new(4, 5)
encoder_L2.clockwise do
  kbd.send_key :KC_C
end
encoder_L2.counterclockwise do
  kbd.send_key :KC_D
end
kbd.append encoder_L2

encoder_L3 = RotaryEncoder.new(6, 7)
encoder_L3.clockwise do
  kbd.send_key :KC_E
end
encoder_L3.counterclockwise do
  kbd.send_key :KC_F
end
kbd.append encoder_L3

encoder_L4 = RotaryEncoder.new(8, 9)
encoder_L4.clockwise do
  kbd.send_key :KC_G
end
encoder_L4.counterclockwise do
  kbd.send_key :KC_H
end
kbd.append encoder_L4



rgb = RGB.new(
  0,    # pin number
  0,    # size of underglow pixel
  12,    # size of backlight pixel
  false # 32bit data will be sent to a pixel if true while 24bit if false
)
rgb.effect     = :breath
rgb.speed      = 31  # 1-31  / default: 22
rgb.hue        = 10  # 0-100 / default: 0
rgb.saturation = 100 # 0-100 / default: 100
rgb.max_value  = 10  # 1-31  / default: 13
kbd.append rgb

kbd.start!
