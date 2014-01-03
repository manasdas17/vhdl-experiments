
entity gol_cell is
  generic (
    start_alive : integer range 0 to 1 := 0;
  );

  port (
    step, upper, left, right, lower, ul, ur, ll, lr: in integer range 0 to 1;
    alive : inout integer range 0 to 1 := start_alive;
  );
end gol_cell;
 
architecture arch of gol_cell is
begin
  process (step)
    variable neighbors: integer range 0 to 8;
    begin
      neighbors := ul + upper + ur + left + right + ll + lower + lr;
      if (neighbors = 3) or (alive = 1 and (neighbors) = 2) then
        alive <= 1;
      else
        alive <= 0;
      end if;
    end process;
end arch;
