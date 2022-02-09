# Keyboard  : sasami17 (SU120)
# Controller: Adafruit KB2040

# for KiCad

# Initialize a Keyboard ########################################################
kbd = Keyboard.new

# Initialize GPIO assign #######################################################
kbd.init_pins(
  [ 27, 26, 18, 10 ], # row0, row1,... respectively
  [  2,  3,  4,  5,  6 ]  # col0, col1,... respectively
)

# Initialize RGB ###############################################################
class MyRgb < RGB
  def to_raise_color
    @hue = 60
  end
  def to_default_color
    @hue = 300
  end
end
rgb = MyRgb.new(
  0,    # pin number
  5,    # size of underglow pixel
  0,    # size of backlight pixel
  false # 32bit data will be sent to a pixel if true while 24bit if false
)
rgb.effect     = :breath
rgb.speed      = 16  # 1-31  / default: 22
rgb.hue        = 300 # 0-100 / default: 0
rgb.saturation = 100 # 0-100 / default: 100
rgb.max_value  = 10  # 1-31  / default: 13

kbd.append rgb # `kbd` is an instance of Keyboard class that should be newed in advance

# Initialize rotary encoders ###################################################
# Rotary Encoder (D6)
encoder_d6 = RotaryEncoder.new(28, 29)
encoder_d6.clockwise do
  kbd.macro 'R', nil
end
encoder_d6.counterclockwise do
  kbd.macro 'r', nil
end
kbd.append encoder_d6

# Rotary Encoder (E6)
encoder_e6 = RotaryEncoder.new(9, 8)
encoder_e6.clockwise do
  kbd.send_key :KC_F2
end
encoder_e6.counterclockwise do
  kbd.send_key :KC_F1
end
kbd.append encoder_e6

# Define layers ################################################################
# A         B         C         D         E
# default layer should be added at first
kbd.add_layer :default, %i(
  TO_RAISE  KC_DEL    KC_ESC    LALT_3    LC_LS_A
  KC_BSPC   LSFT_UP   KC_R      KC_V      LC_LS_C
  LSFT_LEFT LSFT_DOWN LSFT_RGHT LSFT_X    LC_LS_L
  XXXXXXX   XXXXXXX   XXXXXXX   KC_4      KC_5
)
kbd.add_layer :raise, %i(
  TO_DEFLT  KC_DEL    KC_7      KC_8      KC_9
  KC_BSPC   XXXXXXX   KC_4      KC_5      KC_6
  KC_0      KC_DOT    KC_1      KC_2      KC_3
  XXXXXXX   XXXXXXX   XXXXXXX   KC_4      KC_5
)
kbd.add_layer :adjust, %i(
  KC_NO     KC_NO     KC_NO     KC_NO     KC_NO
  KC_NO     KC_NO     KC_NO     KC_NO     KC_NO
  KC_NO     KC_NO     KC_NO     KC_NO     KC_NO
  KC_NO     KC_NO     KC_NO     KC_NO     KC_NO
)
kbd.add_layer :lower, %i(
  KC_NO     KC_NO     KC_NO     KC_NO     KC_NO
  KC_NO     KC_NO     KC_NO     KC_NO     KC_NO
  KC_NO     KC_NO     KC_NO     KC_NO     KC_NO
  KC_NO     KC_NO     KC_NO     KC_NO     KC_NO
)

################################################################################
kbd.define_composite_key :LSFT_UP,   %i(KC_UP    KC_LSFT)
kbd.define_composite_key :LSFT_DOWN, %i(KC_DOWN  KC_LSFT)
kbd.define_composite_key :LSFT_LEFT, %i(KC_LEFT  KC_LSFT)
kbd.define_composite_key :LSFT_RGHT, %i(KC_RIGHT KC_LSFT)
kbd.define_composite_key :LSFT_X,    %i(KC_X     KC_LSFT)
kbd.define_composite_key :LALT_3,    %i(KC_3     KC_LALT)
kbd.define_composite_key :LC_LS_A,   %i(KC_LCTL  KC_LSFT  KC_A)
kbd.define_composite_key :LC_LS_C,   %i(KC_LCTL  KC_LSFT  KC_C)
kbd.define_composite_key :LC_LS_L,   %i(KC_LCTL  KC_LSFT  KC_L)
kbd.define_mode_key :TO_RAISE, [ Proc.new { rgb.to_raise_color   kbd.lock_layer(:raise)  }, nil, 300, nil ]
kbd.define_mode_key :TO_DEFLT, [ Proc.new { rgb.to_default_color kbd.lock_layer(:default)}, nil, 300, nil ]

# Start! #######################################################################
kbd.start!
