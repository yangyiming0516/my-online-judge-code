var b,n,i,ans:longint;
    f:array[1..20]of boolean;
    a:array[1..20]of longint;
function sum:longint;
var i,j:longint;
begin
 j:=0;
 for i:=1 to n do
  if f[i] then j:=j+a[i];
 exit(j)
end;
procedure dfs(h:integer);
var k:longint;
begin
  if h=n+1 then
    begin
    k:=sum;
    if (k>=b)and(k-b<ans) then ans:=k-b
    end
else
 begin
  f[h]:=false;
  dfs(h+1);
  f[h]:=true;
  dfs(h+1)
 end
end;
begin
 readln(n,b);
 ans:=maxlongint;
 for i:=1 to n do
  read(a[i]);
 dfs(1);
 writeln(ans)
end.