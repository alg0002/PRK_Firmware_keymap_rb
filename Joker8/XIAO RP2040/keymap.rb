puts 'Keyboard  : Joker8'
puts 'Controller: XIAO RP2040'

GPIO_OUT = 1
HIGH = 1
LED_POWER_PIN = 11
LED_PIN = 12

gpio_init(LED_POWER_PIN)
gpio_set_dir(LED_POWER_PIN, GPIO_OUT)
gpio_put(LED_POWER_PIN, HIGH)

kbd = Keyboard.new
kbd.init_direct_pins(
  [ 3, 4, 2, 29, 6, 7, 0, 1 ]
)
kbd.add_layer :default, %i(
            KC_A KC_B KC_C
  KC_D KC_E KC_F KC_G KC_H
)

rgb  = RGB.new(
  LED_PIN,
  1,
  0,
  false
)
rgb.effect     = :static
rgb.speed      = 16  # 1-31  / default: 22
rgb.hue        = 240 # 0-359 / default: 0
rgb.saturation = 100 # 0-100 / default: 100
rgb.value      = 1   # 1-31  / default: 13
kbd.append rgb

kbd.start!