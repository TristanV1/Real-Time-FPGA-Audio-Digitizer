----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2025 09:44:43 PM
-- Design Name: 
-- Module Name: normalizer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.MATH_REAL.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity normalizer is
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
end normalizer;

architecture Behavioral of normalizer is

    constant AVG_DIVIDE : integer := integer(ceil(log2(real(avg_length))));

    constant SAMPLING_COUNTS : integer := integer(real(100/(SAMPLING_FREQ_MHZ))); -- Converts sampling freq to counts to drive sampler
    --constant SAMPLING_COUNTER_WIDTH : integer := integer(ceil(log2(real(SAMPLING_COUNTS))));
    
    signal sampling_pulse : STD_LOGIC;
    signal avg_done : STD_LOGIC;

    signal avg_accumulator_latch :  STD_LOGIC_VECTOR((DATA_WIDTH + AVG_DIVIDE)-1 DOWNTO 0) := (others => '0');

begin

    sampler_proc : process(clk_100m)
        variable sampling_counter : integer range 0 to SAMPLING_COUNTS-1;
    begin
        if(rising_edge(clk_100m)) then
            if(rst_n = '0') then
                sampling_counter := 0;
            else
                if(sampling_counter >= SAMPLING_COUNTS-1) then
                    sampling_counter := 0;
                    sampling_pulse <= '1';
                else 
                    sampling_counter := sampling_counter + 1;
                    sampling_pulse <= '0';
                end if;
            end if;
        end if;
    end process;

    sample_tracker_proc : process(clk_100m) 
        variable num_samples : integer range 0 to AVG_LENGTH-1;
    begin
        if(rising_edge(clk_100m)) then
            if(rst_n = '0') then
                num_samples := 0;
            else
                if(num_samples >= AVG_LENGTH-1) then
                    num_samples := 0;
                    avg_done <= '1';
                else 
                    if(sampling_pulse = '1') then
                        num_samples := num_samples + 1;
                        avg_done <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;

    shift_buffer_proc : process(clk_100m)
        variable accumulator_buffer : STD_LOGIC_VECTOR((DATA_WIDTH + AVG_DIVIDE)-1 DOWNTO 0) := (others => '0');
    begin
        if(rising_edge(clk_100m)) then
            if(rst_n = '0' or avg_done = '1') then
                accumulator_buffer := (others => '0');
                avg_accumulator_latch <= accumulator_buffer;
            else
                if(sampling_pulse = '1') then
                    accumulator_buffer := accumulator_buffer + raw_data;
                end if;    
            end if;
        end if;
    end process;

    output_avg_proc : process(clk_100m)
        variable i_avg_data : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0) := (others => '0');
    begin 
        if(rising_edge(clk_100m)) then
            if(rst_n = '0') then
                i_avg_data := (others => '0');
                avg_data <= (others => '0');
                avg_data_valid <= '0';
            else
                i_avg_data := avg_accumulator_latch((DATA_WIDTH + AVG_DIVIDE)-1 DOWNTO AVG_DIVIDE); --Right shift by log2(average size)
                avg_data <= i_avg_data;
                avg_data_valid <= '1';
            end if;
        end if;
    end process;


end Behavioral;
