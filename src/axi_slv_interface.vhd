

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity axi_slv_interface is
    generic(
        DATA_WIDTH : integer := 16
    );
    port(
        clk : IN STD_LOGIC;

        axis_tvalid  : IN STD_LOGIC;
        axis_tdata : IN STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);

        axis_rec_data : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
        axis_rec_valid : OUT STD_LOGIC
    );
end axi_slv_interface;

architecture Behavioral of axi_slv_interface is

begin


end Behavioral;
