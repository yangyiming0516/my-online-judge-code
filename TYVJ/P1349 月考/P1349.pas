var  s:array[1..100000]of string;
     i,n,m,k:longint;
     st:string;
procedure qs(l,r:longint);
var  i,j:longint;
     t,x:string;
begin
 i:=l;j:=r;t:=s[(l+r)div 2];
 repeat
  while s[i]<t do inc(i);
  while s[j]>t do dec(j);
  if i<=j then
   begin
   x:=s[i];s[i]:=s[j];s[j]:=x;
   inc(i);dec(j)
   end;
 until i>j;
 if l<j then qs(l,j);
 if i<r then qs(i,r);
end;
function find(l,r:longint):boolean;
var ss:string;p:longint;
begin
  if l>r then exit(false);
  p:=(l+r)div 2;
  ss:=s[p];
  if st=ss then exit(true)
  else
  if st>ss then exit(find(p+1,r))
  else
  if st<ss then exit(find(l,p-1))
end;
begin
 readln(n);
 for i:=1 to n do
 readln(s[i]);
 qs(1,n);
 readln(m);
 k:=0;
 for i:=1 to m do
 begin
 readln(st);
 if find(1,n) then inc(k)
 end;
 writeln(k)
end.