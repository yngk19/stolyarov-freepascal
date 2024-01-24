program queue;

type 
	QOLPointer = ^QOLItem;
	QOLItem = record
		value: longint;
		next: QOLPointer;
	end;
	QueueOfLongints = record
		first, last: QOLPointer;
	end;

procedure QOLInit(var queue: QueueOfLongints);
begin
	queue.first := nil;
	queue.last := nil;
end;

procedure QOLPut(var queue: QueueOfLongints; var n: longint);
begin
	if queue.first = nil then
	begin
		new(queue.first);
		queue.last := queue.first;
	end
	else
	begin
		new(queue.last^.next);
		queue.last := queue.last^.next;
	end;
	queue.last^.value := n;
	queue.last^.next := nil;
		
end;

procedure QOLGet(var queue: QueueOfLongints; var n: longint);
var
	tmp: QOLPointer;
begin
	n := queue.first^.value;
	tmp := queue.first;
	queue.first := queue.first^.next;
	if queue.first = nil then
		queue.last := nil;
   	dispose(tmp);	
end;

function QOLisEmpty(var queue: QueueOfLongints): boolean;
begin
	QOLisEmpty := queue.first = nil;
end;

var
	q: QueueOfLongints;
	n: longint;
begin
	QOLInit(q);
	while not SeekEof do
	begin
		read(n);
		QOLPut(q, n);
	end;
	while not QOLisEmpty(q) do
	begin
		QOLGet(q, n);
		Writeln(n);
end;
end.
end;
