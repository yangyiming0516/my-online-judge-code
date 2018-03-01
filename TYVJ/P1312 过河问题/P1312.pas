const
maxn=1000;
var
n:longint;
a:array [1..maxn] of longint;
i:longint;
procedure short(l,r:longint);
var
 i,j,mid,t:longint;
begin
 i:=l;
 j:=r;
 mid:=a[(l+r) div 2];
 repeat
  while a[i]<mid do
   inc(i);
  while a[j]>mid do
   dec(j);
  if i<=j
  then
  begin
    t:=a[i];
    a[i]:=a[j];
    a[j]:=t;
    inc(i);
    dec(j);
  end;
 until i>=j;
 if l<j
 then
  short(l,j);
 if i<r
 then
  short(i,r);
end;
function min(x,y:longint):longint;
begin
 if x<y
 then
  exit(x)
 else
  exit(y);
end;
function work(r:longint):longint;
begin
 if r=1
 then
  exit(a[1]);
 if r=2
 then
  exit(a[2]);
 if r=3
 then
  exit(a[1]+a[2]+a[3]);
 work:=min(2*a[2]+a[1]+a[r],a[r]+a[r-1]+2*a[1])+work(r-2);
end;
begin
readln(n);
for i:=1 to n do
 read(a[i]);
short(1,n);
writeln(work(n));
end.