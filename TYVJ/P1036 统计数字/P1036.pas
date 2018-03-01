var  a:array[1..200001]of longint;
     m,n,k,i:longint;
procedure qs(l,r:longint);
var  i,j,temp,h:longint;
begin
   i:=l;j:=r;temp:=a[(l+r)div 2];
   repeat
    while a[i]<temp do inc(i);
    while a[j]>temp do dec(j);
    if i<=j then
     begin
     h:=a[i];a[i]:=a[j];a[j]:=h;
     inc(i);dec(j)
     end;
   until i>j;
   if l<j then qs(l,j);
   if i<r then qs(i,r)
end;
begin
   readln(n);
   for i:=1 to n do
     readln(a[i]);
   qs(1,n);
   a[n+1]:=-1;
   k:=1;
   repeat
    m:=1;
    while a[k+1]=a[k] do
     begin
       inc(k);
       inc(m);
     end;
    writeln(a[k],' ',m);
    inc(k)
   until k=n+1
end.