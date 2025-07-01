# Create the 50MHz input clock
create_clock -name clk -period 20.0 [get_ports i_clk]

# Set false paths through asynchronous reset if needed
# set_false_path -from [get_ports rst_n]

# Optional: set input and output delays if you're interfacing with external hardware
# These are conservative estimates and can be adjusted as needed

# Input delay for reset (relative to clk)
set_input_delay -clock clk 5.0 [get_ports rst_n]

# Output delays for 7-segment outputs
set_output_delay -clock clk 5.0 [get_ports {o_Seg_A o_Seg_B o_Seg_C o_Seg_D o_Seg_E o_Seg_F o_Seg_G}]
