program btree;

type
	BTreePos = ^BTreeNodePtr;
	BTreeNodePtr = ^BTreeNode;
	BTreeNode = record
		data: longint;
		left, right: BTreeNodePtr;
	end;
	BTreeOfLongints = ^BTreeNodePtr;

function BTreeSum(btree: BTreeNodePtr): longint;
begin
	if btree = nil then
		BTreeSum := 0
	else
		BTreeSum :=	BTreeSum(btree^.left) + btree^.data + BTreeSum(btree^.right);
end;

function BTreeSearch(var btree: BTreeNodePtr; n: longint): BTreePos;
begin
	if (btree = nil) or (btree^.data = n) then
		BTreeSearch := @btree
	else
	if n < btree^.data then
		BTreeSearch := BTreeSearch(btree^.left, n)
	else
		BTreeSearch := BTreeSearch(btree^.right, n);
end;

procedure BTreeAdd(var btree: BTreeNodePtr; n: longint; var ok: boolean);
var
	p: BTreePos;
begin
	p := BTreeSearch(btree, n);
	if p^ = nil then
	begin
		new(p^);
		p^^.data := n;
		p^^.left := nil;
		p^^.right := nil;
		ok := true;
	end
	else
		ok := false;
end;

function IsInBTree(var btree: BTreeNodePtr; n: longint): boolean;
begin
	IsInBTree := BTreeSearch(btree, n)^ <> nil;
end;

var
	n: longint;
	ok: boolean;
	root: BTreeNodePtr = nil;
begin
	while not SeekEof do
	begin
		read(n);
		BTreeAdd(root, n, ok);
	end;
	read(n);
	writeln(IsInBTree(root, n));
	read(n);
	BTreeAdd(root, n, ok);
	writeln(ok);
end.







