# Pin assignments for the Top module driving a 7-segment display

set io_pins { \
    "i_clk"         R20 "3.3-V LVTTL" \
    "rst_n"         P11 "1.2-V" \
    "o_Seg_A"       V19 "1.2-V" \
    "o_Seg_B"       V18 "1.2-V" \
    "o_Seg_C"       V17 "1.2-V" \
    "o_Seg_D"       W18 "1.2-V" \
    "o_Seg_E"       Y20 "1.2-V" \
    "o_Seg_F"       Y19 "1.2-V" \
    "o_Seg_G"       Y18 "1.2-V" \
}

foreach { signal pin iostd } ${io_pins} {
    set_location_assignment PIN_${pin} -to ${signal}
    set_instance_assignment -name IO_STANDARD "${iostd}" -to ${signal}
}
