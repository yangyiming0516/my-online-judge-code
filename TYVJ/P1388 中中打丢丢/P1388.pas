var i,n,k:longint;
    a,b:array[1..100000]of longint;
procedure qs(l,r:longint);
var i,j,x,t:longint;
begin
  randomize;
  i:=l;j:=r;t:=a[random(r-l)+l];
  repeat
   while a[i]<t do inc(i);
   while a[j]>t do dec(j);
   if i<=j then
   begin
   x:=a[i];a[i]:=a[j];a[j]:=x;
   x:=b[i];b[i]:=b[j];b[j]:=x;
   inc(i);dec(j)
   end;
  until i>j;
 if l<j then qs(l,j);
 if i<r then qs(i,r)
end;
begin
 readln(n);
 for i:=1 to n do
 begin
 read(a[i]);
 b[i]:=i;
 end;
 readln(k);
 qs(1,n);
 writeln(b[k])
end.