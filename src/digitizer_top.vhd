library ieee;
use IEEE.std_logic_1164.all;
entity digitizer_top is
    port (
        clk_100m : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        vp : in STD_LOGIC;
        vn : in STD_LOGIC;
        avg_out : out STD_LOGIC_VECTOR(15 DOWNTO 0)
        --xadc_valid : out STD_LOGIC
    );
end entity digitizer_top;
architecture Behavioral of digitizer_top is

    component xadc_wiz_0
        port (

            m_axis_tvalid : out std_logic;
            m_axis_tready : in std_logic;
            m_axis_tdata  : out std_logic_vector(15 downto 0);
            m_axis_tid    : out std_logic_vector(4 downto 0);
            m_axis_aclk   : in std_logic;
            s_axis_aclk   : in std_logic;
            m_axis_resetn : in std_logic;

            vp_in       : in std_logic;
            vn_in       : in std_logic;
            vauxp6 : IN STD_LOGIC;
            vauxn6 : IN STD_LOGIC;
            
            channel_out : out std_logic_vector(4 downto 0);
            eoc_out     : out std_logic;
            alarm_out   : out std_logic;
            eos_out     : out std_logic;
            busy_out    : out std_logic
        );
    end component xadc_wiz_0;

    component axi_slv_interface is
        generic (
            DATA_WIDTH : integer := 16
        );
        port (
            clk   : in std_logic;
            rst_n : in std_logic;

            axis_tvalid : in std_logic;
            axis_tdata  : in std_logic_vector(DATA_WIDTH - 1 downto 0);

            axis_rec_data  : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            axis_rec_ready : out std_logic;
            axis_rec_valid : out std_logic
        );
    end component axi_slv_interface;

    component normalizer is
        generic(
            DATA_WIDTH : integer := 16;
            AVG_LENGTH : integer := 128; -- Depth of the average
            SAMPLING_FREQ_MHZ : integer := 1 -- Sampling frequency of raw data in MHz based on 100MHz input clk
        );
        port (
            clk_100m : in STD_LOGIC;
            rst_n : in STD_LOGIC;
            raw_data : in STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
            avg_data : out STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
            avg_data_valid : out STD_LOGIC
        );
    end component normalizer;


    signal axis_tvalid : STD_LOGIC;
    signal axis_tready : STD_LOGIC;
    signal axis_tid : STD_LOGIC_VECTOR(4 DOWNTO 0);
    signal axis_tdata : STD_LOGIC_VECTOR(15 DOWNTO 0);
    signal xadc_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
    signal avg_data_valid : STD_LOGIC;

    signal rst_n : STD_LOGIC;

begin

    rst_n <= not rst;


    xadc_inst : xadc_wiz_0
    port map
    (
        m_axis_aclk   => clk_100m,
        s_axis_aclk   => clk_100m,

        m_axis_tvalid => axis_tvalid,
        m_axis_tready => axis_tready,
        m_axis_tdata  => axis_tdata,
        m_axis_tid    => open,

        m_axis_resetn => rst_n,
        vp_in         => '0',
        vn_in         => '0',
        vauxp6 => vp,
        vauxn6 => vn,

        channel_out   => open,
        eoc_out       => open,
        alarm_out     => open,
        eos_out       => open,
        busy_out      => open
    );

    axi_slv_interface_inst : axi_slv_interface
    generic map(
        DATA_WIDTH => 16
    )
    port map(
        clk   => clk_100m,
        rst_n => rst_n,

        axis_tvalid  => axis_tvalid,
        axis_tdata   => axis_tdata,

        axis_rec_data  => xadc_out,
        axis_rec_ready => axis_tready,
        axis_rec_valid => open
    );

    normalizer_inst : normalizer
     generic map(
        DATA_WIDTH => 16,
        AVG_LENGTH => 128,
        SAMPLING_FREQ_MHZ => 1
    )
     port map(
        clk_100m => clk_100m,
        rst_n => rst_n,
        raw_data => xadc_out,
        avg_data => avg_out,
        avg_data_valid => avg_data_valid
    );
    

end Behavioral;