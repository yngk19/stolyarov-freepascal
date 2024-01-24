program romb;

function GetHeight: integer;
var
	h: integer;
begin
	repeat 
		write('Enter the height of figure: ');
		readln(h)
	until (h > 0) and (h mod 2 = 1);
	GetHeight := h
end;

procedure PrintChars(ch: char; count: integer);
begin
	if count > 0 then
	begin
		write(ch);
		PrintChars(ch, count - 1)
	end
end;

var
	c, n, i, k, p, d: integer;
const
	star = '*';
	space = ' ';
begin
	n := (GetHeight + 1) div 2;
	{ Top of the romb  }
	c := -1;
	for i := n downto 1 do
	begin
		PrintChars(space, i - 1);
		if not (i = n) then
		begin	
			write(star);
			for d := 1 to c do
				write(star);
			writeln(star)
		end
	   	else	
			writeln(star);
		c := c + 2;
	end;
	{ Bottom of the romb }
	c := 2 * n - 5;
	for i := 1 to n - 1 do
	begin
		PrintChars(space, i);
		if not (i = n - 1) then
		begin
			write(star);
			PrintChars(star, c);
			writeln(star)	
		end
		else
			writeln(star);
		c := c - 2;
	end
end.
