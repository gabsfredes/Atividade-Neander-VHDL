LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY neander IS
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
END neander;

ARCHITECTURE behavior OF neander IS
    -- memoria do neander
    TYPE valores IS ARRAY (0 TO 15) OF STD_LOGIC_VECTOR(7 DOWNTO 0);--vetor de 16 posições de 8 bits

    -- alterar aqui a memória, infelizmente não consegui implementar com leitura do arquivo
    SIGNAL memoria : valores := (0 => "00000001",
    1 => "00011010",
    2 => "00100001",
    3 => "01000000",
    4 => "00000000",
    5 => "00000000",
    6 => "00000000",
    7 => "00000000",
    8 => "00000000",
    9 => "00000000",
    10 => "00000000",
    11 => "00000000",
    12 => "00000000",
    13 => "00000000",
    14 => "00000000",
    15 => "00000000"
    );

    ----------------------------------------------

    -- MUX e operações

    SIGNAL MUX : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL SOMA : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL SUB : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL MULT : STD_LOGIC_VECTOR(7 DOWNTO 0);

    -- registradores

    SIGNAL PC : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL ACC : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL RDM : STD_LOGIC_VECTOR(7 DOWNTO 0); -- registrador de memoria
    SIGNAL flagZ : STD_LOGIC; -- flag se ACC = 0
    SIGNAL flagN : STD_LOGIC; -- flag se ACC < 0
    ----------------------------------------------
BEGIN
    -- implementações das operações
    SOMA <= ACC + RDM(3 DOWNTO 0);
    SUB <= ACC - RDM(3 DOWNTO 0);
    MULT <= ACC * RDM(3 DOWNTO 0);

    -- mux
    -- o uso dos bits 4 e 5 do RDM é para indicar qual operação será feita, conforme visualizado no logisim
    MUX <= "0000" & RDM(3 DOWNTO 0) WHEN (RDM(5) = '0' AND RDM(4) = '0') ELSE -- load
        "0000" & SOMA(3 DOWNTO 0) WHEN (RDM(5) = '0' AND RDM(4) = '1') ELSE -- soma
        "0000" & SUB(3 DOWNTO 0) WHEN (RDM(5) = '1' AND RDM(4) = '0') ELSE -- subtração
        MULT WHEN (RDM(5) = '1' AND RDM(4) = '1'); -- multiplicaação

    -- flags
    flagZ <= '1' WHEN (ACC = "0000") ELSE
        '0';
    flagN <= '1' WHEN (ACC(3) = '1') ELSE
        '0';

    -- saidas
    Z <= flagZ;
    N <= flagN;
    PROCESS (clk, reset)
    BEGIN
        -- zera tudo pra não ter problema de lixo
        IF reset = '1' THEN
            PC <= (OTHERS => '0');
            ACC <= (OTHERS => '0');
            RDM <= (OTHERS => '0');
            Z <= '0';
            N <= '0';
            decoder <= (OTHERS => '0');

        ELSIF rising_edge(clk) THEN
            IF count_load = '1' THEN
                PC <= PC + "0001";
                RDM <= memoria(conv_integer(unsigned(PC)));
                decoder <= RDM(7 DOWNTO 4); -- os 4 bits mais significativos do RDM são o decoder
            ELSE
                PC <= RDM(3 DOWNTO 0); -- os 4 bits menos significativos do RDM são o PC
                RDM <= memoria(conv_integer(unsigned(PC)));
                decoder <= RDM(7 DOWNTO 4);
            END IF;
            IF en_ULA = '1' THEN
                ACC <= MUX(3 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;