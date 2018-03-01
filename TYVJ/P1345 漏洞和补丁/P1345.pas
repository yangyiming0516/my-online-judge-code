var l,b:array[1..100]of ansistring;
    ans,i,j,n,m:longint;
    s:ansistring;
begin
 readln(n,m);
 for i:=1 to n do
  begin
  readln(s);
  for j:=1 to length(s) do
  if s[j] in ['a'..'z'] then s[j]:=chr(ord(s[j])-32);
  l[i]:=s
  end;
 for i:=1 to m do
  begin
  readln(s);
  for j:=1 to length(s) do
  if s[j] in ['a'..'z'] then s[j]:=chr(ord(s[j])-32);
  b[i]:=s
  end;
  ans:=0;
  for i:=1 to n do
   for j:=1 to m do
    if (pos(l[i],b[j])<>0)or(pos(b[j],l[i])<>0) then
     begin
     inc(ans);
     break
     end;
  writeln(ans)
end.