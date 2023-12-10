LIBRARY ieee;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY topo IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC
    );
END ENTITY topo;

ARCHITECTURE behavior OF topo IS
    COMPONENT fsm IS
        PORT (
            clk : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            flag_zero : IN STD_LOGIC;
            flag_negative : IN STD_LOGIC;
            decoder : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            count_load : OUT STD_LOGIC;
            enable_ula : OUT STD_LOGIC
        );
    END COMPONENT fsm;

    COMPONENT neander IS
        PORT (
            reset : IN STD_LOGIC;
            clk : IN STD_LOGIC;
            count_load : IN STD_LOGIC;
            en_ULA : IN STD_LOGIC;
            -- saidas
            Z : OUT STD_LOGIC;
            N : OUT STD_LOGIC;
            decoder : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT neander;

    SIGNAL count_load, enable_ula, flag_zero, flag_negative : STD_LOGIC := '0';
    SIGNAL decoder : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
    
BEGIN
    neander_inst : neander PORT MAP(
        clk => clk,
        reset => reset,
        count_load => count_load,
        en_ULA => enable_ula,
        Z => flag_zero,
        N => flag_negative,
        decoder => decoder
    );

    fsm_inst : fsm PORT MAP(
        clk => clk,
        reset => reset,
        flag_zero => flag_zero,
        flag_negative => flag_negative,
        decoder => decoder,
        count_load => count_load,
        enable_ula => enable_ula
    );
END ARCHITECTURE behavior;