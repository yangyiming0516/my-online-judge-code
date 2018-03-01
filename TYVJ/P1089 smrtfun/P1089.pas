var
i,j,k,n,up,down,p:longint;
f:array[0..1,-100000..100000] of longint;
a,b:array[1..100] of longint;
function max(a,b:longint):longint;
begin
if a>b then exit(a) else exit(b);
end;
begin
fillchar(f,sizeof(f),254);f[0,0]:=0;
up:=0;down:=0;
readln(n);
for i:=1 to n do
begin
    readln(a[i],b[i]);
    if a[i]>0 then up:=up+a[i] else down:=down+a[i];
end;
for i:=1 to n do
begin
    p:=i mod 2;
    for j:=a[i]+down to a[i]+up do
    f[p,j]:=max(f[1-p,j],f[1-p,j-a[i]]+b[i]);
end;
k:=0;
for i:=up downto 0 do if f[p,i]>=0 then
k:=max(k,f[p,i]+i);
writeln(k);
end.