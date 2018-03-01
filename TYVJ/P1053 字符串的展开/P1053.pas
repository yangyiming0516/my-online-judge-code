var p1,p2,p3,i:byte;
    s:string;
function what(l,r:integer):integer;
begin
  if (s[l] in ['0'..'9'])and(s[r] in ['0'..'9']) then exit(1);
  if (s[l] in ['a'..'z'])and(s[r] in ['a'..'z']) then exit(2);
  exit(0)
end;
procedure make(l,r:longint);
var i:char;
    j:integer;
begin
 if what(l,r)=1 then
  begin
   if s[l]>=s[r] then write('-');
   if p1=3 then
    for i:=succ(s[l]) to pred(s[r]) do
     for j:=1 to p2 do
      write('*')
   else
   if p3=1 then
   for i:=succ(s[l]) to pred(s[r]) do
    for j:=1 to p2 do
     write(i)
    else
    for i:=pred(s[r]) downto succ(s[l]) do
    for j:=1 to p2 do
     write(i)
  end
 else
  if what(l,r)=2 then
   begin
   if s[l]>=s[r] then write('-');
   if p1=3 then
     for i:=succ(s[l]) to pred(s[r]) do
     for j:=1 to p2 do
      write('*')
    else
   if p3=1 then
   for i:=succ(s[l]) to pred(s[r]) do
    for j:=1 to p2 do
     if p1=1 then
     write(i) else write(chr(ord(i)-32))
    else
    for i:=pred(s[r]) downto succ(s[l]) do
    for j:=1 to p2 do
     if p1=1 then
     write(i) else write(chr(ord(i)-32))
    end
  else write('-')
end;
begin
 readln(p1,p2,p3);
 readln(s);
 write(s[1]);
 for i:=2 to length(s)-1 do
 if s[i]='-' then make(i-1,i+1)
 else write(s[i]);
 writeln(s[length(s)])
end.