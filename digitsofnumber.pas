program digits_of_numbers;

procedure Digits(number: integer);
begin
	if number > 0 then
	begin
		Digits(number div 10);
		write(number mod 10, ' ')
	end
end;
var
	n: integer;
begin
	read(n);
	Digits(n);
end.
	
