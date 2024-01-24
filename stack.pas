program stack;

type
	SOLPointer = ^SOLItem;
	SOLItem = record
		value: longint;
		next: SOLPointer;
	end;
	SOL = SOLPointer;

procedure SOLInit(var stack: SOL);
begin
	stack := nil;
end;

procedure SOLPush(var stack: SOL; var n: longint);
var
	tmp: SOLPointer;
begin
	new(tmp);
	tmp^.value := n;
	tmp^.next := stack;
	stack := tmp;
end;

procedure SOLPop(var stack: SOL; var n: longint);
var
	tmp: SOLPointer;
begin
	n := stack^.value;
	tmp := stack;
	stack := stack^.next;
	dispose(tmp);
end;

function SOLisEmpty(var stack: SOL): boolean;
begin
	SOLisEmpty := stack = nil;
end;

var
	s: SOL;
	n: longint;
begin
	SOLInit(s);
	while not SeekEof do
	begin
		read(n);
		SOLPush(s, n);
	end;
	while not SOLisEmpty(s) do
	begin
		SOLPop(s, n);
		Writeln(n);
	end;
end.
