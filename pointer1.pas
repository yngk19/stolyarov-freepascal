program pointers;

type
	itemptr = ^item;
	item = record
		value: longint;
		next: itemptr;
	end;

procedure ReverseNumbers(var node: itemptr);
begin
	if node^.next = nil then
	begin
		Writeln(node^.value);
		exit;
	end;
	Writeln(node^.value);
	ReverseNumbers(node^.next);
end;

var
	firstitem: ^item = nil;
	v: longint;
	middleitem: ^item = nil;
begin
	while not SeekEof do
	begin
		read(v);
		new(middleitem);
		middleitem^.value := v;
		middleitem^.next := firstitem;
		firstitem := middleitem;
	end;
	ReverseNumbers(firstitem);
end.
