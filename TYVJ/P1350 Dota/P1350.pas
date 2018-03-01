var  a:array[1..300000]of int64;
     f:array[0..300000]of int64;
     n,i:longint;
function min(a,b:int64):int64;
begin
 if a<b then exit(a) else exit(b)
end;
begin
 readln(n);
 for i:=1 to n do
 readln(a[i]);
 f[0]:=0;
 if n>=1 then f[1]:=a[1];
 if n>=2 then f[2]:=a[2];
 if n>=3 then f[3]:=a[3]+min(f[1],f[2]);
 for i:=4 to n do
  f[i]:=a[i]+min(min(f[i-2],f[i-1]),f[i-3]);
 writeln(min(f[n],f[n-1]))
end.