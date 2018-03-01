var f1:array[1..10000]of longint;
    f2:array[1..10000]of boolean;
    a:array[1..10000,0..100]of longint;
    n,k,i,t:longint;
function  time(x:longint):longint;
var max,i:longint;
begin
  if x>n then exit(0);
  if f2[x] then exit(f1[x]);
  if a[x,0]=0 then exit(time(x+1)+1);
  max:=0;
  for i:=1 to a[x,0] do
   if time(x+a[x,i])>max then max:=time(x+a[x,i]);
  f1[x]:=max;f2[x]:=true;exit(max)
end;
begin
  fillchar(f2,sizeof(f2),false);
  fillchar(a,sizeof(a),0);
  readln(n,k);
  for i:=1 to k do
    begin
    read(t);
    inc(a[t,0]);
    readln(a[t,a[t,0]])
    end;
  writeln(time(1))
END.