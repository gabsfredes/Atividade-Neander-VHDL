LIBRARY ieee;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY fsm IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        flag_zero : IN STD_LOGIC;
        flag_negative : IN STD_LOGIC;
        decoder : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        count_load : OUT STD_LOGIC;
        enable_ula : OUT STD_LOGIC
    );
END ENTITY fsm;

ARCHITECTURE behavior OF fsm IS
    -- declara os estados e inicia no inicial
    TYPE states IS (inicial, jumps, opera);
    SIGNAL state : states;
    SIGNAL next_state : states := inicial;

BEGIN
    PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            state <= inicial;
        ELSIF rising_edge(clk) THEN
            state <= next_state;
        END IF;
    END PROCESS;

    -- transições da fsm
    PROCESS (clk)
    BEGIN
        CASE state IS
            WHEN inicial =>
                -- se o decoder for 0000, 0001, 0010 ou 0011, vai para o estado de opera
                IF decoder = "0000" OR decoder = "0001" OR decoder = "0010" OR decoder = "0011" THEN
                    next_state <= opera;

                    ----------------------------------------
                    -- jumps
                    ----------------------------------------

                    -- se o decoder for 0100, jump normal (flag zero = 0 e flag negative = 0)
                ELSIF decoder = "0100" THEN
                    next_state <= jumps;
                    -- se o decoder for 0101, jump N, flag zero = 1
                ELSIF decoder = "0101" THEN
                    -- se flag zero = 1, vai para o estado de jumps se nao fica no estado inicial
                    IF flag_zero = '1' THEN
                        next_state <= jumps;
                    ELSE
                        next_state <= inicial;
                    END IF;
                ELSIF decoder = "0110" THEN
                    -- se flag zero = 0, vai para o estado de jumps se nao fica no estado inicial
                    IF flag_negative = '1' THEN
                        next_state <= jumps;
                    ELSE
                        next_state <= inicial;
                    END IF;
                ELSE
                    next_state <= inicial;
                END IF;

            WHEN opera =>
                -- se o decoder for 0000, 0001, 0010 ou 0011, vai para o estado de opera
                IF decoder = "0000" OR decoder = "0001" OR decoder = "0010" OR decoder = "0011" THEN
                    next_state <= opera;

                    ----------------------------------------
                    -- jumps
                    ----------------------------------------

                    -- se o decoder for 0100, jump normal (flag zero = 0 e flag negative = 0)
                ELSIF decoder = "0100" THEN
                    next_state <= jumps;
                    -- se o decoder for 0101, jump N, flag zero = 1
                ELSIF decoder = "0101" THEN
                    -- se flag zero = 1, vai para o estado de jumps se nao fica no estado inicial
                    IF flag_zero = '1' THEN
                        next_state <= jumps;
                    ELSE
                        next_state <= inicial;
                    END IF;
                ELSIF decoder = "0110" THEN
                    -- se flag zero = 0, vai para o estado de jumps se nao fica no estado inicial
                    IF flag_negative = '1' THEN
                        next_state <= jumps;
                    ELSE
                        next_state <= inicial;
                    END IF;
                ELSE
                    next_state <= inicial;
                END IF;
            WHEN OTHERS =>
                next_state <= inicial;
        END CASE;
    END PROCESS;

    -- saidas da fsm
    PROCESS (state)
    BEGIN
        CASE state IS
            WHEN inicial =>
                count_load <= '1';
                enable_ula <= '0';
            WHEN opera =>
                count_load <= '1';
                enable_ula <= '1';
            WHEN jumps =>
                count_load <= '0';
                enable_ula <= '0';
            WHEN OTHERS =>
                count_load <= '0';
                enable_ula <= '0';
        END CASE;
    END PROCESS;

END ARCHITECTURE behavior;