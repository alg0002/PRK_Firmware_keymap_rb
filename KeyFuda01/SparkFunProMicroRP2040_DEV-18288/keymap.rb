# Keyboard  : KeyFuda01
# Controller: SparkFun Pro Micro RP2040 (DEV-18288)

# Initialize a Keyboard ########################################################
kbd = Keyboard.new

# Initialize GPIO assign #######################################################
# [SW01=P9]  [SW06=P4]   [SW11=P0 ]  [SW16=P29]
# [SW02=P8]  [SW07=P3]   [SW12=P23] ┌--------┐
# [SW03=P7]  [SW08=P2]   [SW13=P20] └SW17=P28┘
# [SW04=P6]  [SW09=P1]   [SW14=P22] ┌--------┐
# [SW05=P5]  [SW10=P21]  [SW15=P26] └SW18=P27┘
kbd.init_direct_pins(
  [ 9,  4,  0,  29,
    8,  3, 23,
    7,  2, 20,  28,
    6,  1, 22,
    5, 21, 26,  27 ]
)

# Define layers ################################################################
# default layer should be added at first
kbd.add_layer :default, %i(
  KC_NUMLOCK KC_KP_SLASH KC_KP_ASTERISK KC_KP_MINUS
  KC_KP_7    KC_KP_8     KC_KP_9
  KC_KP_4    KC_KP_5     KC_KP_6        KC_KP_PLUS
  KC_KP_1    KC_KP_2     KC_KP_3
  KC_KP_0    KC_KP_0     KC_KP_DOT      KC_KP_ENTER
)

# Start! #######################################################################
kbd.start!
