program pointers;

type
	itemptr = ^item;
	item = record
		value: longint;
		next: itemptr;
	end;

procedure ReverseNumbers(var node: itemptr);
begin
	if node^.next <> nil then
	begin
		ReverseNumbers(node^.next);
		Writeln(node^.value);
	end;
end;

var
	firstitem: ^item;
	v: longint;
	middleitem: ^item;
begin
	new(firstitem);
	middleitem := firstitem;
	while not SeekEof do
	begin
		read(v);
		middleitem^.value := v;
		new(middleitem^.next);
		middleitem := middleitem^.next;	
	end;
	ReverseNumbers(firstitem);
	dispose(firstitem);
	dispose(middleitem);
end.
