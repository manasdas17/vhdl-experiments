
package GOL is
  constant width: integer := 4;
  constant height: integer := 4;
  type field_matrix is array(0 to width, 0 to height) of integer range 0 to 1;
end package GOL;

use work.GOL.all;

entity gol_field is
  generic (
    initial_state : field_matrix;
  );
  port (
    curr_state: inout field_matrix;
    step: in integer range 0 to 1;
  );
end gol_field;

architecture arch of gol_field is
  component cell
    generic (
      start_alive : integer range 0 to 1;
    );
    port (
      step, upper, left, right, lower, ul, ur, ll, lr: in integer range 0 to 1;
      alive : inout integer range 0 to 1;
    );
  end component;
begin
outer:
  for i in 0 to width generate
    begin
      inner:
        for j in 0 to height generate
          begin
            ul:
              if (i = 0 and j = 0) generate 
              cell: entity work.cell
              generic map
              (start_alive => initial_state(i, j))
              port map
              (step => step,
               ul => 0,
               upper => 0,
               ur => 0,
               left => 0,
               right => curr_state(i + 1, j),
               ll => 0,
               lower => curr_state(i, j + 1),
               lr => curr_state(i + 1, j + 1),
               alive => curr_state(i, j));
            end generate ul;
            upper:
              if (i > 0 and i < width and j = 0) generate 
              cell: entity work.cell
              generic map
              (start_alive => initial_state(i, j))
              port map
              (step => step,
               ul => 0,
               upper => 0,
               ur => 0,
               left => curr_state(i - 1, j),
               right => curr_state(i + 1, j),
               ll => curr_state(i - 1, j + 1),
               lower => curr_state(i, j + 1),
               lr => curr_state(i + 1, j + 1),
               alive => curr_state(i, j));
            end generate upper;
            ur:
              if (i = width and j = 0) generate 
              cell: entity work.cell
              generic map
              (start_alive => initial_state(i, j))
              port map
              (step => step,
               ul => 0,
               upper => 0,
               ur => 0,
               left => curr_state(i - 1, j),
               right => 0,
               ll => curr_state(i - 1, j + 1),
               lower => curr_state(i, j + 1),
               lr => 0,
               alive => curr_state(i, j));
            end generate ur;
            left:
              if (i = 0 and j > 0 and j < height) generate 
              cell: entity work.cell
              generic map
              (start_alive => initial_state(i, j))
              port map
              (step => step,
               ul => 0,
               upper => curr_state(i, j - 1),
               ur => curr_state(i + 1, j - 1),
               left => 0,
               right => curr_state(i + 1, j),
               ll => 0,
               lower => curr_state(i, j + 1),
               lr => curr_state(i + 1, j + 1),
               alive => curr_state(i, j));
            end generate left;
            middle:
              if (i > 0 and i < width and j > 0 and j < height) generate 
              cell: entity work.cell
              generic map
              (start_alive => initial_state(i, j))
              port map
              (step => step,
               ul => curr_state(i - 1, j - 1),
               upper => curr_state(i, j - 1),
               ur => curr_state(i + 1, j - 1),
               left => curr_state(i - 1, j),
               right => curr_state(i + 1, j),
               ll => curr_state(i - 1, j + 1),
               lower => curr_state(i, j + 1),
               lr => curr_state(i + 1, j + 1),
               alive => curr_state(i, j));
            end generate middle;
            right:
              if (i = width and j > 0 and j < height) generate 
              cell: entity work.cell
              generic map
              (start_alive => initial_state(i, j))
              port map
              (step => step,
               ul => curr_state(i - 1, j - 1),
               upper => curr_state(i, j - 1),
               ur => 0,
               left => curr_state(i - 1, j),
               right => 0,
               ll => curr_state(i - 1, j + 1),
               lower => curr_state(i, j + 1),
               lr => 0,
               alive => curr_state(i, j));
            end generate right;
            ll:
              if (i = 0 and j = height) generate 
              cell: entity work.cell
              generic map
              (start_alive => initial_state(i, j))
              port map
              (step => step,
               ul => 0,
               upper => curr_state(i, j - 1),
               ur => curr_state(i + 1, j - 1),
               left => 0,
               right => curr_state(i + 1, j),
               ll => 0,
               lower => 0,
               lr => 0,
               alive => curr_state(i, j));
            end generate ll;
            lower:
              if (i > 0 and i < width and j = height) generate 
              cell: entity work.cell
              generic map
              (start_alive => initial_state(i, j))
              port map
              (step => step,
               ul => curr_state(i - 1, j - 1),
               upper => curr_state(i, j - 1),
               ur => curr_state(i + 1, j - 1),
               left => curr_state(i - 1, j),
               right => curr_state(i + 1, j),
               ll => 0,
               lower => 0,
               lr => 0,
               alive => curr_state(i, j));
            end generate lower;
            lr:
              if (i = width and j = height) generate 
              cell: entity work.cell
              generic map
              (start_alive => initial_state(i, j))
              port map
              (step => step,
               ul => curr_state(i - 1, j - 1),
               upper => curr_state(i, j - 1),
               ur => 0,
               left => curr_state(i - 1, j),
               right => 0,
               ll => 0,
               lower => 0,
               lr => 0,
               alive => curr_state(i, j));
            end generate lr;
        end generate inner;
    end generate outer;
end arch;
