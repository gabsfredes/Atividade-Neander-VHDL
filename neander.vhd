LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_textio.ALL;

ENTITY neander IS
    PORT (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        -- saidas
        Z : OUT STD_LOGIC;
        N : OUT STD_LOGIC;
        decoder : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    )
END neander;

ARCHITECTURE behavior OF neanderis
    -- memoria do neander
    TYPE valores IS ARRAY (0 TO 15) OF STD_LOGIC_VECTOR(7 DOWNTO 0); -- 16 posicoes de 8 bits

    -- leitura do arquivo com a memoria a ser lida e trabalhada
    SIGNAL memoria : valores;
    FILE arquivo : TEXT;
    VARIABLE linha : LINE;
    file_open(arquivo, "memoria.txt", READ_MODE);

    FOR i IN 0 TO 15 LOOP
        readline(arquivo, linha);
        READ(linha, memoria(i));
    END LOOP;

    file_close(arquivo);

    ----------------------------------------------

    -- MUX e operações

    SIGNAL MUX : STD_LOGIC_VECTOR(3 DOWNTO 0);
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
    SOMA <= RDM(3 DOWNTO 0) + ACC;
    SUB <= RDM(3 DOWNTO 0) - ACC;
    MULT <= RDM(3 DOWNTO 0) * ACC;

    -- mux
    -- o uso dos bits 4 e 5 do RDM é para indicar qual operação será feita, conforme visualizado no logisim
    MUX <= "0000" & RDM(3 DOWNTO 0) WHEN (RDM(5) = '0' AND RDM(4) = '0') ELSE -- load
        "0000" & SUM(3 DOWNTO 0) WHEN (RDM(5) = '0' AND RDM(4) = '1') ELSE -- soma
        "0000" & SUB(3 DOWNTO 0) WHEN (RDM(5) = '1' AND RDM(4) = '0') ELSE -- subtração
        "0000" & mult(7 DOWNTO 4) WHEN (RDM(5) = '1' AND RDM(4) = '1'); -- multiplicaação

    -- flags
    flagZ <= '1' WHEN (ACC = "0000") ELSE
        '0';
    flagN <= '1' WHEN (ACC(3) = '1') ELSE
        '0';

    PROCESS (clk, reset)
    BEGIN
        -- zera tudo pra não ter problema de lixo
        IF reset = '0' THEN
            PC <= (OTHERS => '0');
            ACC <= (OTHERS => '0');
            RDM <= (OTHERS => '0');
            Z <= '0';
            N <= '0';
            decoder <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            IF count_load = '1' THEN
                PC <= PC + 1;
                RDM <= memoria(to_integer(unsigned(PC)));
                decoder <= RDM;
                (7 DOWNTO 4); -- os 4 bits mais significativos do RDM são o decoder
            ELSE
                PC <= RDM(3 DOWNTO 0); -- os 4 bits menos significativos do RDM são o PC
                RDM <= memoria(to_integer(unsigned(PC)));
                decoder <= RDM(7 DOWNTO 4);
            END IF;
            IF en_ULA = '1' THEN
                AXX <= MUX(3 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;