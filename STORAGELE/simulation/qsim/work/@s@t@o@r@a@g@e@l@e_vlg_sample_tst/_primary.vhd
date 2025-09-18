library verilog;
use verilog.vl_types.all;
entity STORAGELE_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        res             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end STORAGELE_vlg_sample_tst;
