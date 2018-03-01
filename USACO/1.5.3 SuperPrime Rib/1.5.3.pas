{分析
第一位只能是2 3 5 7，后面每位只能是1 3 7 9
在此前提下进行递归深搜}

我的题解
{
ID:id
PROG:sprime
LANG:PASCAL
}
const a:array[1..4]of byte=(1,3,7,9);
var n:longint;
function right(h:longint):boolean;
var i:longint;
begin
 for i:=2 to round(sqrt(h)) do
  if h mod i=0 then exit(false);
 exit(true)
end;
procedure dfs(m,k:longint);
var i:integer;
begin
  if k=n+1 then if right(m) then begin writeln(m); exit end;
  if right(m) then
  for i:=1 to 4 do
   dfs(m*10+a[i],k+1);
end;
begin
assign(input,'sprime.in');reset(input);
assign(output,'sprime.out');rewrite(output);
  readln(n);
  dfs(2,2);
  dfs(3,2);
  dfs(5,2);
  dfs(7,2);
close(input);close(output)
end.
