program tetris;
uses
	crt;

procedure GetKey(var code: integer);
var
	symbol: char;
begin
	symbol := ReadKey;
	if symbol = #0 then
	begin
		symbol := ReadKey;
		code := -ord(symbol);
	end
	else
	begin
		code := ord(symbol);
	end	
end;

procedure WriteMessage(x, y: integer; message: string);
begin
	clrscr;
	GotoXY(x, y);
	write(message)
end;

procedure DrawEarth;
var
	i, j, x, y: integer;
begin
	x := ScreenWidth;
	y := ScreenHeight;
	for i := 1 to 7 do
	begin
		TextColor(Brown);
		for j := 1 to ScreenWidth do
		begin
			GotoXY(j, y - i);
			Write('#')
		end
	end;
end;
		

const
	arrowUp = -72;
	arrowDown = -80;
	arrowLeft = -75;
	arrowRight = -77;
	messageHello = 'Hello';
	delayDuration = 5000;
var
	i, j, x, y, pressedKeyId, maxHeight, maxWidth, mesLen: integer;
	isScope: boolean;
begin
	clrscr;
	{ TextColor(Yellow); }
    TextBackground(Cyan); 
	mesLen := length(messageHello);
	maxHeight := ScreenHeight;
	maxWidth := ScreenWidth;
	x := (maxWidth - mesLen) div 2;
	y := maxHeight div 2;
	WriteMessage(x, y, messageHello);
	DrawEarth;
	repeat 
		GetKey(pressedKeyId);
		isScope := (pressedKeyId = arrowUp) or (pressedKeyId = arrowDown) or (pressedKeyId = arrowLeft) or (pressedKeyId = arrowRight);
		if isScope then
		begin
			x := WhereX - mesLen;
			y := WhereY;
			case pressedKeyId of
				arrowLeft:
				begin
					if x = 1 then
						continue;
					WriteMessage(x - 1, y, messageHello)
				end;
				arrowUp:
				begin
					if y = 1 then
						continue;
					WriteMessage(x, y - 1, messageHello)
				end;
				arrowRight:
				begin
					if x + mesLen = maxWidth then
						continue;
					WriteMessage(x + 1, y, messageHello)
				end;
				arrowDown:
				begin
					if y = maxHeight then
						continue;
					WriteMessage(x, y + 1, messageHello)
				end
			end
		end;	
	until pressedKeyId = ord(' ');
	clrscr;
	GotoXY(1, 1);
end.
