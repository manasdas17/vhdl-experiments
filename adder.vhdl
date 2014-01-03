entity adder is
	port (
		input0, input1: in bit;
		sum, carry: out bit;
	);
end adder;

architecture behavior of adder is
-- no need for instantiations
begin
	sum <= input0 xor input1;
	carry <= input0 and input1;
end behavior;
