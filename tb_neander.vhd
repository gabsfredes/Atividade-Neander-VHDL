LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY tb_neander IS
END tb_neander;

ARCHITECTURE behavior OF tb_neander IS
    COMPONENT neander IS
        PORT (
            reset : IN STD_LOGIC;
            clk : IN STD_LOGIC;
            count_load : IN STD_LOGIC;
            en_ULA : IN STD_LOGIC;
            -- saidas
            Z : OUT STD_LOGIC;
            N : OUT STD_LOGIC;
            decoder : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL clk, reset, count_load, en_ULA, Z, N : STD_LOGIC;
    SIGNAL decoder : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    -- instanciando o componente (topo)
    
    DUT : ENTITY work.neander PORT MAP (clk => clk, reset => reset, count_load => count_load, en_ULA => en_ULA);
    -- clock process

    PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR 10 ns;
        clk <= '1';
        WAIT FOR 10 ns;
    END PROCESS;

    reset <= '0', '1' AFTER 10 ns; -- reset ativo em 10ns

END ARCHITECTURE;