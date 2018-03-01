var f:array[1..10]of boolean;
    a,h:array[1..10]of longint;
    n,k,i,ans:longint;
procedure dfs(p:integer);
var i:longint;
begin
 if p=n then
  begin
  for i:=2 to n do
   if f[i] then
    begin
    if (abs(h[i]-h[1])<=k)and(abs(h[i]-h[a[n-1]])<=k)
     then inc(ans);
    exit
    end
  end
 else
  for i:=2 to n do
   if f[i]and(abs(h[i]-h[a[p-1]])<=k) then
    begin a[p]:=i;
       f[i]:=false;
       dfs(p+1);
       f[i]:=true
    end;
end;
begin
 readln(n,k);
 for i:=1 to n do
  read(h[i]);
 fillchar(f,sizeof(f),true);
 ans:=0;
 a[1]:=1;
 dfs(2);
 if n=1 then writeln(1) else
 writeln(ans)
end.