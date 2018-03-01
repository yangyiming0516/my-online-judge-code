const p:array[1..4]of integer=(-1,0,1,0);
      q:array[1..4]of integer=(0,1,0,-1);
var  n,m,i,j,h,k:longint;
     a:array[0..21,0..21]of char;
function floodfill(x,y:longint):longint;
var i:integer;
    ans:longint;
begin
 ans:=1;
 a[x,y]:='#';
 for i:=1 to 4 do
 if a[x+p[i],y+q[i]]<>'#' then ans:=ans+floodfill(x+p[i],y+q[i]);
 exit(ans)
end;
begin
 readln(n,m);
 for i:=1 to n do
  begin
  for j:=1 to m do
  begin
  read(a[i,j]);
  if a[i,j]='@' then begin h:=i;k:=j end;
  end;
  readln
  end;
 for i:=1 to m do
  a[0,i]:='#';
 for i:=1 to m do
  a[n+1,i]:='#';
 for i:=1 to n do
  a[i,0]:='#';
 for i:=1 to n do
  a[i,m+1]:='#';
 writeln(floodfill(h,k)-1)
end.