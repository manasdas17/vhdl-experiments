entity subtractor is
    port(
        input0, input1: in bit;
        difference, borrow: out bit;
    );
end subtractor;

architecture behavior of subtractor is
begin
    difference <= input0 xor input1;
    borrow <= (not input0) and input1;
end behavior;
