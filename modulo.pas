program modulo;
var
	x: integer;
	negative: boolean;
begin	
	read(x);
	negative := x < 0;
	if negative then 
		x := -x;
	writeln(x);
end.
