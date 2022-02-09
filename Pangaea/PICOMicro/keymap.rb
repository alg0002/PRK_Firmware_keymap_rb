# Keyboard  : Pangaea (beta)
# Controller: PICO Micro (B-class)

# Initialize a Keyboard ########################################################
kbd = Keyboard.new

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
  R1C0    C0R1    R1C1    C1R1    R1C2    C2R1
  R2C0    C0R2    R2C1    C1R2    R2C2    C2R2
  R3C0    C0R3    R3C1    C1R3    R3C2    C2R3
  R4C0    C0R4    R4C1    C1R4    R4C2    C2R4
          R0C3    R1C3    R2C3    R3C3    R4C3
)

# Define mode keys #############################################################
# RxCx
kbd.define_mode_key :R0C0, [ Proc.new {kbd.macro 'R0C0 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R0C1, [ Proc.new {kbd.macro 'R0C1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R0C2, [ Proc.new {kbd.macro 'R0C2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R0C3, [ Proc.new {kbd.macro 'R0C3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R1C0, [ Proc.new {kbd.macro 'R1C0 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R1C1, [ Proc.new {kbd.macro 'R1C1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R1C2, [ Proc.new {kbd.macro 'R1C2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R1C3, [ Proc.new {kbd.macro 'R1C3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R2C0, [ Proc.new {kbd.macro 'R2C0 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R2C1, [ Proc.new {kbd.macro 'R2C1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R2C2, [ Proc.new {kbd.macro 'R2C2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R2C3, [ Proc.new {kbd.macro 'R2C3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R3C0, [ Proc.new {kbd.macro 'R3C0 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R3C1, [ Proc.new {kbd.macro 'R3C1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R3C2, [ Proc.new {kbd.macro 'R3C2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R3C3, [ Proc.new {kbd.macro 'R3C3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R4C0, [ Proc.new {kbd.macro 'R4C0 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R4C1, [ Proc.new {kbd.macro 'R4C1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R4C2, [ Proc.new {kbd.macro 'R4C2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :R4C3, [ Proc.new {kbd.macro 'R4C3 ', nil}, nil, 300, nil ]
# CxRx
kbd.define_mode_key :C0R0, [ Proc.new {kbd.macro 'C0R0 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C1R0, [ Proc.new {kbd.macro 'C1R0 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C2R0, [ Proc.new {kbd.macro 'C2R0 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C3R0, [ Proc.new {kbd.macro 'C3R0 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C0R1, [ Proc.new {kbd.macro 'C0R1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C1R1, [ Proc.new {kbd.macro 'C1R1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C2R1, [ Proc.new {kbd.macro 'C2R1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C3R1, [ Proc.new {kbd.macro 'C3R1 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C0R2, [ Proc.new {kbd.macro 'C0R2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C1R2, [ Proc.new {kbd.macro 'C1R2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C2R2, [ Proc.new {kbd.macro 'C2R2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C3R2, [ Proc.new {kbd.macro 'C3R2 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C0R3, [ Proc.new {kbd.macro 'C0R3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C1R3, [ Proc.new {kbd.macro 'C1R3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C2R3, [ Proc.new {kbd.macro 'C2R3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C3R3, [ Proc.new {kbd.macro 'C3R3 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C0R4, [ Proc.new {kbd.macro 'C0R4 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C1R4, [ Proc.new {kbd.macro 'C1R4 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C2R4, [ Proc.new {kbd.macro 'C2R4 ', nil}, nil, 300, nil ]
kbd.define_mode_key :C3R4, [ Proc.new {kbd.macro 'C3R4 ', nil}, nil, 300, nil ]

# Start! #######################################################################
kbd.start!
