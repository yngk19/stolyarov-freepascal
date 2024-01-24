program pp;
procedure powers(x: integer; var quad, cube, fourth, fifth: integer);
begin
	quad := x * x;
	cube := quad * x;
	fourth := cube * x;
	fifth := fourth * x;
end;
var
	x, a, b, c, d: integer;
begin
	powers(2, a, b, c, d);
	writeln(a, b, c, d);
end.
