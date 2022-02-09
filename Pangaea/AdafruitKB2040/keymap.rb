# Keyboard  : Pangaea (beta)
# Controller: Adafruit KB2040

# Initialize a Keyboard ########################################################
kbd = Keyboard.new
kbd.split = true # This should happen before Keyboard#init_pins.
kbd.uart_pin = 1
kbd.set_anchor(:left)

# Initialize GPIO assign #######################################################
row0 = 8
row1 = 9
row2 = 29
row3 = 28
row4 = 27
col0 = 4
col1 = 5
col2 = 6
col3 = 7
kbd.init_matrix_pins(
  [
    [ [row1, col0], [col0, row1], [row1, col1], [col1, row1], [row1, col2], [col2, row1] ],
    [ [row2, col0], [col0, row2], [row2, col1], [col1, row2], [row2, col2], [col2, row2] ],
    [ [row3, col0], [col0, row3], [row3, col1], [col1, row3], [row3, col2], [col2, row3] ],
    [ [row4, col0], [col0, row4], [row4, col1], [col1, row4], [row4, col2], [col2, row4] ],
    [ [row0, col3], [row1, col3], [row2, col3], [row3, col3], [row4, col3] ]
  ]
)

# Define layers ################################################################
# default layer should be added at first
kbd.add_layer :default, %i(
  KC_ESC   KC_F2    KC_F3    KC_F4    KC_F5    KC_F6      KC_F7    KC_F8    KC_F9    KC_F10   KC_F11    KC_F12
  KC_TAB   KC_Q     KC_W     KC_E     KC_R     KC_T       KC_Y     KC_U     KC_I     KC_O     KC_P      KC_LBRC
  KC_MINUS KC_A     KC_S     KC_D     KC_F     KC_G       KC_H     KC_J     KC_K     KC_L     KC_SCOLON KC_QUOT
  KC_CAPS  KC_Z     KC_X     KC_C     KC_V     KC_B       KC_N     KC_M     KC_COMMA KC_DOT   KC_SLASH  KC_INT1
  KC_LALT  MU_LSFT  ENT_LCTL SPC_LAY1 KC_LGUI  XXXXXXX    XXXXXXX  APP_LAY2 SPC_LAY1 ENT_RCTL HE_RSFT   KC_RALT
)
kbd.add_layer :layer1, %i(
  KC_F1    KC_F2    KC_F3    KC_F4    KC_F5    KC_F6      KC_F7    KC_PSCREEN KC_F9  KC_F10   KC_F11    KC_INS
  KC_TAB   KC_COLON KC_MINUS KC_ASTER KC_SLASH KC_UNDS    KC_HOME  KC_PGDOWN KC_PGUP KC_END   KC_RBRC   KC_BSLS
  KC_TAB   KC_1     KC_2     KC_3     KC_4     KC_5       KC_LEFT  KC_DOWN  KC_UP    KC_RIGHT KC_EQUAL  KC_INT3
  KC_DOT   KC_6     KC_7     KC_8     KC_9     KC_0       MACRO0   MACRO1   MACRO2   MACRO3   MACRO4    MACRO5
  KC_LALT  MU_LSFT  KC_BSPC  XXXXXXX  KC_LGUI  XXXXXXX    XXXXXXX  XXXXXXX  XXXXXXX  KC_DEL   HE_RSFT   XXXXXXX
)
kbd.add_layer :layer2, %i(
  KC_2     KC_F2    KC_F3    KC_F4    KC_F5    KC_F6      KC_F7    KC_F8    KC_F9    KC_F10   KC_F11    KC_F12
  KC_TAB   KC_Q     KC_W     KC_E     KC_R     KC_T       KC_Y     KC_U     KC_I     KC_O     KC_P      KC_LBRC
  KC_MINUS KC_A     KC_S     KC_D     KC_F     KC_G       KC_H     KC_J     KC_K     KC_L     KC_SCOLON KC_QUOT
  KC_CAPS  KC_Z     KC_X     KC_C     KC_V     KC_B       KC_N     KC_M     KC_COMMA KC_DOT   KC_SLASH  KC_INT1
  KC_LALT  MU_LSFT  KC_3     KC_3     KC_LGUI  XXXXXXX XXXXXXX     XXXXXXX  KC_3     KC_3     KC_3      KC_RALT
)

# Define mode keys #############################################################
kbd.define_mode_key :MU_LSFT, [ :KC_MHEN,        :KC_LSFT, 150, 150 ]
kbd.define_mode_key :ENT_LCTL,[ :KC_ENTER,       :KC_LCTL, 150, 150 ]
kbd.define_mode_key :SPC_LAY1,[ :KC_SPACE,       :layer1,  150, 150 ]
kbd.define_mode_key :APP_LAY2,[ :KC_APPLICATION, :layer2,  150, 150 ]
kbd.define_mode_key :ENT_RCTL,[ :KC_ENTER,       :KC_RCTL, 150, 150 ]
kbd.define_mode_key :HE_RSFT, [ :KC_HENK,        :KC_RSFT, 150, 150 ]
kbd.define_mode_key :MACRO0,  [ Proc.new {kbd.macro '}|', nil}, nil, 300, nil ]
kbd.define_mode_key :MACRO1,  [ Proc.new {kbd.macro ']\', nil}, nil, 300, nil ]
kbd.define_mode_key :MACRO2,  [ Proc.new {kbd.macro '*(', nil}, nil, 300, nil ]
kbd.define_mode_key :MACRO3,  [ Proc.new {kbd.macro '@@', nil}, nil, 300, nil ]
kbd.define_mode_key :MACRO4,  [ Proc.new {kbd.macro '{{', nil}, nil, 300, nil ]
kbd.define_mode_key :MACRO5,  [ Proc.new {kbd.macro '&&', nil}, nil, 300, nil ]


# Start! #######################################################################
kbd.start!
