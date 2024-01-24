program romb;
var
	c, n, h, i, k, p, d: integer;
begin
	repeat 
		write('Enter the height of romb: ');
		readln(h)
	until (h > 0) and (h mod 2 = 1);
	n := (h + 1) div 2;
	{ Top of the romb  }
	c := -1;
	for i := n downto 1 do
	begin
		for k := 1 to i - 1 do
			write(' ');
		if not (i = n) then
		begin	
			write('*');
			for d := 1 to c do 
				write(' ');
			writeln('*')
		end
		else 
			writeln('*');
		c := c + 2;
	end;
	{ Bottom of the romb }
	c := 2 * n - 5;
	for i := 1 to n - 1 do
	begin
		for k := 1 to i do
		       write(' ');
		if not (i = n - 1) then
		begin
			write('*');
			for d := 1 to c do
				write(' ');
			writeln('*');			
		end
		else
			writeln('*');
		c := c - 2;
	end
end.
