program cube;

function Cube(x: real): real;
begin
	Cube := x * x * x
end;

var
	x: real;
begin
	write('Enter the number: ');
	read(x);
	writeln(Cube(x))
end.
