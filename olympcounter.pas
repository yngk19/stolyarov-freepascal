program olymp_counters;
const
	maxGroup = 100;
	maxSchool = 67;
type
	countersArray = array [1..maxSchool] of integer;
var
	counters: countersArray;
	i, c, n: integer;
begin
	for i := 1 to maxSchool do
		counters[i] := 0;
	{$I-}
	while not eof do
	begin
		readln(c);
		if IOResult <> 0 then
		begin
			writeln('Incorrect input data');
			halt(1);
		end;
		n := c div maxGroup;
		if (n < 1) or (n > maxSchool) then
		begin
			writeln('Illegal school id');
			halt(1);
		end;
		counters[n] := counters[n] + 1;
	end;
	n := 1;
	for i := 2 to maxSchool do
		if counters[i] > counters[n] then
			n := i;
	for i := 1 to maxSchool do
		if counters[i] = counters[n] then
			writeln(i)
end.
