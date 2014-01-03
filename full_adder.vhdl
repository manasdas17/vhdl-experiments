entity full_adder is
  port (
    input0, input1, carry_in: in bit;
    sum, carry_out: out bit;
  );
end full_adder;

architecture behavior of full_adder is
begin
  --  Simulator does two concurrent assignments
  sum <= input0 xor input1 xor carry_in;
  carry_out <= (input0 and input1) or (input0 and carry_in) or (input1 and carry_in);
end behavior;
