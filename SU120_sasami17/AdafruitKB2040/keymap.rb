# Keyboard  : sasami17 (SU120)
# Controller: Adafruit KB2040

# Initialize a Keyboard ########################################################
kbd = Keyboard.new

# Initialize GPIO assign #######################################################
kbd.init_pins(
  [ 27, 26, 18, 10 ], # row0, row1,... respectively
  [  2,  3,  4,  5,  6 ]  # col0, col1,... respectively
)

# Initialize RGB ###############################################################
class MyRgb < RGB
  def toggle_color
  	if @hue == 300
  	  @hue = 60
  	else
  	  @hue = 300
  	end
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
  kbd.send_key :KC_A
end
encoder_d6.counterclockwise do
  kbd.send_key :KC_B
end
kbd.append encoder_d6

# Rotary Encoder (E6)
encoder_e6 = RotaryEncoder.new(9, 8)
encoder_e6.clockwise do
  kbd.send_key :KC_C
end
encoder_e6.counterclockwise do
  kbd.send_key :KC_D
end
kbd.append encoder_e6

# Define layers ################################################################
# A         B         C         D         E
# default layer should be added at first
kbd.add_layer :default, %i(
  KC_Q      KC_W      KC_E      KC_R      KC_T
  KC_A      KC_S      KC_D      KC_F      KC_G
  TGLCOLOR  RGB_SPI   RGB_SPD   RGB_HUI   RGB_HUD
  XXXXXXX   XXXXXXX   XXXXXXX   KC_4      KC_5
)
kbd.add_layer :raise, %i(
  KC_1      KC_2      KC_3      KC_4      KC_5
  KC_6      KC_7      KC_8      KC_9      KC_0
  XXXXXXX   KC_X      KC_C      KC_V      KC_B
  KC_SPC    KC_SPC    KC_SPC    KC_4      KC_5
)
kbd.add_layer :adjust, %i(
  KC_Q      KC_W      KC_E      KC_R      KC_T
  KC_A      KC_S      KC_D      KC_F      KC_G
  KC_Z      KC_X      KC_C      KC_V      KC_B
  KC_SPC    KC_SPC    KC_SPC    KC_4      KC_5
)
kbd.add_layer :lower, %i(
  KC_Q      KC_W      KC_E      KC_R      KC_T
  KC_A      KC_S      KC_D      KC_F      KC_G
  KC_Z      KC_X      KC_C      KC_V      KC_B
  KC_SPC    KC_SPC    KC_SPC    KC_4      KC_5
)

################################################################################
kbd.define_mode_key :TGLCOLOR, [ Proc.new { rgb.toggle_color }, :raise, 300, nil ]

# Start! #######################################################################
kbd.start!
