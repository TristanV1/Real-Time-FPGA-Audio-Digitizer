library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
entity axi_slv_interface is
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
end axi_slv_interface;

architecture Behavioral of axi_slv_interface is

    signal tdata_latch : std_logic_vector(DATA_WIDTH - 1 downto 0);

begin

    axis_rec_data <= tdata_latch;

    process (clk) begin
        if (rising_edge(clk)) then
            if (rst_n = '0') then
                tdata_latch    <= (others => '0');
                axis_rec_ready <= '0';
                axis_rec_valid <= '0';
            else
                axis_rec_ready <= '1';

                if (axis_tvalid = '1') then
                    tdata_latch    <= axis_tdata;
                    axis_rec_valid <= '1';
                else
                    axis_rec_valid <= '0';
                end if;

            end if;

        end if;
    end process;

end Behavioral;
