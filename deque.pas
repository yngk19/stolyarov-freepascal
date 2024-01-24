program deque;

type
	itemptr = ^item;
	item = record
		value: longint;
		prev, next: itemptr;
	end;
	DequeOfLongints = record
		first, last: itemptr;
	end;

procedure DOLInit(var deque: DequeOfLongints);
begin
	deque.first := nil;
	deque.last := nil;
end;

procedure DOLPushFront(var deque: DequeOfLongints; var n: longint);
var
	tmp: itemptr;
begin
	if deque.first = nil then
	begin
		new(deque.first);
		deque.first^.next := nil;
		deque.first^.prev := nil;
		deque.first^.value := n;
		deque.last := deque.first;
	end
	else
	begin
		new(tmp);
		tmp^.value := n;
		tmp^.next := deque.first;
		tmp^.prev := nil;
		deque.first^.prev := tmp;
		deque.first := tmp;
	end;
end;

procedure DOLPushBack(var deque: DequeOfLongints; var n: longint);
var
	tmp: itemptr;
begin
	if deque.first = nil then
	begin
		new(deque.first);
		deque.first^.next := nil;
		deque.first^.prev := nil;
		deque.first^.value := n;
		deque.last := deque.first;
	end
	else
	begin
		new(tmp);
		tmp^.value := n;
		tmp^.next := nil;
		tmp^.prev := deque.last;
		deque.last^.next := tmp;
		deque.last := tmp;
	end;
end;

procedure DOLPopFront(var deque: DequeOfLongints; var n: longint);
var
	tmp: itemptr;
begin
	n := deque.first^.value;
	if deque.first^.next = nil then 
	begin
		dispose(deque.first);
		deque.first := nil;
		deque.last := deque.first;
	end
	else
	begin
		tmp := deque.first^.next;
		tmp^.prev := nil;
		dispose(deque.first);
		deque.first := tmp;
	end;
end;

procedure DOLPopBack(var deque: DequeOfLongints; var n: longint);
var
	tmp: itemptr;
begin
	n := deque.last^.value;
	if deque.last^.prev = nil then
	begin
		dispose(deque.last);
		deque.last := nil;
		deque.first := nil;
	end
	else
	begin
		tmp := deque.last^.prev;
		tmp^.next := nil;
		dispose(deque.last);
		deque.last := tmp;
	end;	
end;

function DOLisEmpty(var deque: DequeOfLongints): boolean;
begin
	DOLisEmpty := deque.first = nil;

end;

var
	DOL: DequeOfLongints;
	i: longint;
begin
	DOLInit(DOL);
	while not SeekEof do
	begin
		read(i);
		DOLPushFront(DOL, i);
	end;
	while not DOLisEmpty(DOL) do
	begin
		DOLPopBack(DOL, i);
		writeln(i);
	end;
end.



