var  a:array[1..100000]of string;
     b:array[1..100000]of real;
     s:string;
     n,i,k,p:longint;
     m:real;
procedure qs(l,r:longint);
var i,j:longint;
    t,x:real;ss:string;
begin
  i:=l;j:=r;t:=b[(l+r)div 2];
  repeat
   while b[i]<t do inc(i);
   while b[j]>t do dec(j);
   if i<=j then
    begin
    x:=b[i];b[i]:=b[j];b[j]:=x;
    ss:=a[i];a[i]:=a[j];a[j]:=ss;
    inc(i);dec(j)
    end;
  until i>j;
 if l<j then qs(l,j);
 if i<r then qs(i,r)
end;
function find(l,r:longint):longint;
var x:real;
begin
  if l>r then exit(0);
  x:=b[(l+r)div 2];
  if m=x then exit((l+r)div 2);
  if m<x then exit(find(l,((l+r)div 2)-1));
  if m>x then exit(find(((l+r)div 2)+1,r))
end;
begin
 readln(n);
 for i:=1 to n do
  begin
  readln(S);
  k:=pos(' ',s);
  a[i]:=copy(s,1,k-1);
  val(copy(s,k+1,length(s)-k),b[i])
  end;
 qs(1,n);
 readln(p);
 for i:=1 to p do
  begin
  readln(m);
  k:=find(1,n);
  if k=0 then writeln('No Such User')
  else writeln(a[k],' ',k)
  end
end.