LIBRARY ieee;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_neander IS
END ENTITY tb_neander;

ARCHITECTURE behavior OF tb_neander IS
    COMPONENT topo IS
        PORT (
            clk : IN STD_LOGIC;
            reset : IN STD_LOGIC
        );
    END COMPONENT topo;

    SIGNAL clk : STD_LOGIC;
    SIGNAL reset : STD_LOGIC;

BEGIN
    arquivo : topo
    PORT MAP(
        clk => clk,
        reset => reset
    );

    clk_gen : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR 10 ns;
        clk <= '1';
        WAIT FOR 10 ns;
    END PROCESS clk_gen;

    reset <= '1', '0' AFTER 10 ns;
END ARCHITECTURE behavior;