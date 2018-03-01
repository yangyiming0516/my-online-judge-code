const m=9901;
var a:array[1..1000]of longint;
    f:array[1..1000,-1000..1000]of longint;
    n,i,j,ans:longint;
begin
 readln(n);
 for i:=1 to n do
  read(a[i]);
 ans:=0;
 for i:=1 to n do
  begin
  ans:=(ans+1)mod m;
  for j:=1 to i-1 do
   begin
    ans:=(ans+f[j,a[i]-a[j]]+1)mod m;
    inc(f[i,a[i]-a[j]]);
    f[i,a[i]-a[j]]:=(f[i,a[i]-a[j]]+f[j,a[i]-a[j]])mod m;
   end;
  end;
 writeln(ans)
end.