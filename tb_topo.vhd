LIBRARY ieee;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
 
ENTITY tb_topo IS
END ENTITY tb_topo;

ARCHITECTURE rtl OF tb_topo IS
    COMPONENT topo IS
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC
        );
    END COMPONENT topo;

    SIGNAL clk : STD_LOGIC;
    SIGNAL rst : STD_LOGIC;

BEGIN
    uut : topo
    PORT MAP(
        clk => clk,
        rst => rst
    );

    clk_gen : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR 10 ns;
        clk <= '1';
        WAIT FOR 10 ns;
    END PROCESS clk_gen;

    -- rst_gen : process
    -- begin
    --     rst <= '1';
    --     wait for 20 ns;
    --     rst <= '0';
    --     wait;
    -- end process rst_gen;
END ARCHITECTURE rtl;