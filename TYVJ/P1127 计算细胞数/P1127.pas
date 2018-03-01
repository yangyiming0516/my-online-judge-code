var  a:array[1..50,1..80]of char;
     m,n,i,j,ans:longint;
procedure fill(x,y:longint);
begin
  if (x=0)or(y=0)or(x>m)or(y>n)or(a[x,y]='0') then exit;
  a[x,y]:='0';
  fill(x-1,y);
  fill(x,y-1);
  fill(x,y+1);
  fill(x+1,y)
end;
begin
 readln(m,n);
 for i:=1 to m do
  begin
  for j:=1 to n do
  read(a[i,j]);
  readln
  end;
 ans:=0;
 for i:=1 to m do
  for j:=1 to n do
   begin
   if a[i,j]<>'0' then inc(ans);
   fill(i,j)
   end;
 writeln(ans)
end.