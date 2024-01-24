program zad_2_12;

procedure GetInputData(var Height: integer);
var
	heigh: integer;
begin
	repeat
		write('Enter the figure height: ');
		readln(height)
	until (height > 0) and (height mod 2 = 1);
	Height := height
end;

var
	isBottom: boolean;
	dot1, dot2, i, j, figureSide, tableSize, sideDot, figureHeight: integer;
const
	spaceChar = '*';
	starChar = ' ';
begin
	GetInputData(figureHeight);
	figureSide := (figureHeight + 1) div 2;
	tableSize := figureHeight * figureHeight;
	sideDot := figureSide;
	dot1 := sideDot;
	dot2 := sideDot;
	isBottom := false;
	for i := 1 to figureHeight do
	begin
		for j := 1 to figureHeight do
		begin
			if j = figureHeight then
			begin
				if (j = dot1) or (j = dot2) then
				begin
					writeln(starChar);
					break
				end;
				writeln(spaceChar);
				break
			end;
			if (j = dot1) or (j = dot2) then
			begin
				write(starChar);
				continue
			end;
			write(spaceChar)
		end;
		if dot1 = 1 then
		begin
			dot1 := dot1 + 1;
			dot2 := dot2 - 1;
			isBottom := true;
			continue
		end;
		if isBottom then
		begin
			dot1 := dot1 + 1;
			dot2 := dot2 - 1;
			continue
		end;
		dot1 := dot1 - 1;
		dot2 := dot2 + 1;
	end;	
end.
