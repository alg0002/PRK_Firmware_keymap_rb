# Kasumigasane
# Adafruit kb2040

kbd = Keyboard.new
kbd.init_direct_pins(
  [  2,  3,  4,  5,  6,  7,  8,  9, 29, 28, 27, 26, 18, 20, 19, 10 ]
)

# default layer should be added at first
kbd.add_layer :default, %i(
  A1   B1   C1   D1
  A2   B2   C2   D2
  A3   B3   C3   D3
  A4   B4   C4   D4
)

kbd.define_mode_key :A1, [ Proc.new {kbd.macro 'A1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :A2, [ Proc.new {kbd.macro 'A2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :A3, [ Proc.new {kbd.macro 'A3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :A4, [ Proc.new {kbd.macro 'A4 ', nil}, nil, 300, nil ]
kbd.define_mode_key :B1, [ Proc.new {kbd.macro 'B1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :B2, [ Proc.new {kbd.macro 'B2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :B3, [ Proc.new {kbd.macro 'B3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :B4, [ Proc.new {kbd.macro 'B4 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C1, [ Proc.new {kbd.macro 'C1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C2, [ Proc.new {kbd.macro 'C2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C3, [ Proc.new {kbd.macro 'C3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C4, [ Proc.new {kbd.macro 'C4 ', nil}, nil, 300, nil ]
kbd.define_mode_key :D1, [ Proc.new {kbd.macro 'D1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :D2, [ Proc.new {kbd.macro 'D2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :D3, [ Proc.new {kbd.macro 'D3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :D4, [ Proc.new {kbd.macro 'D4 ', nil}, nil, 300, nil ]

rgb = RGB.new(
  1,    # pin number
  0,    # size of underglow pixel
  16,   # size of backlight pixel
  false # 32bit data will be sent to a pixel if true while 24bit if false
)
rgb.effect     = :breath
rgb.speed      = 31  # 1-31  / default: 22
rgb.hue        = 36  # 0-100 / default: 0
rgb.saturation = 83  # 0-100 / default: 100
rgb.max_value  = 10  # 1-31  / default: 13
kbd.append rgb

kbd.start!
