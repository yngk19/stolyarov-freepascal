program cube;

function Cube(x: integer): integer;
begin
	Cube := x * x * x;
	writeln('HELLO')
end;

var
	x: integer;
begin
	write('Enter the number: ');
	read(x);
	x := Cube(x);
	writeln(x)
end.
