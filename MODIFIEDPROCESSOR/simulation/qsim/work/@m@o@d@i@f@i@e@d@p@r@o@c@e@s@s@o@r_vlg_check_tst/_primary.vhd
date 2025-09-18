library verilog;
use verilog.vl_types.all;
entity MODIFIEDPROCESSOR_vlg_check_tst is
    port(
        neg1            : in     vl_logic_vector(0 to 6);
        neg2            : in     vl_logic_vector(0 to 6);
        r1              : in     vl_logic_vector(0 to 6);
        r2              : in     vl_logic_vector(0 to 6);
        student         : in     vl_logic_vector(0 to 6);
        sampler_rx      : in     vl_logic
    );
end MODIFIEDPROCESSOR_vlg_check_tst;
