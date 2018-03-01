VAR m,n,k,l,d,i,x,y,p,q:integer;
    a,b,aa,bb:array[0..1000]of integer;
PROCEDURE qsa(l,r:integer);
var    i,j,x,y:integer;
BEGIN
    i:=l;j:=r;
    x:=a[(l+r)div 2];
    repeat
       while a[i]>x do inc(i);
       while x>a[j] do dec(j);
       if i<=j then
        begin
          y:=a[i];
          a[i]:=a[j];
          a[j]:=y;
          y:=aa[i];
          aa[i]:=aa[j];
          aa[j]:=y;
          inc(i);
          dec(j);
        end;
    until i>j;
    if i<r then qsa(i,r);
    if l<j then qsa(l,j)
end;
PROCEDURE qsaa(l,r:integer);
var    i,j,x,y:integer;
BEGIN
    i:=l;j:=r;
    x:=aa[(l+r)div 2];
    repeat
       while aa[i]<x do inc(i);
       while x<aa[j] do dec(j);
       if i<=j then
        begin
          y:=aa[i];
          aa[i]:=aa[j];
          aa[j]:=y;
          inc(i);
          dec(j);
        end;
    until i>j;
    if i<r then qsaa(i,r);
    if l<j then qsaa(l,j)
end;
PROCEDURE qsb(l,r:integer);
var    i,j,x,y:integer;
BEGIN
    i:=l;j:=r;
    x:=b[(l+r)div 2];
    repeat
       while b[i]>x do inc(i);
       while x>b[j] do dec(j);
       if i<=j then
        begin
          y:=b[i];
          b[i]:=b[j];
          b[j]:=y;
          y:=bb[i];
          bb[i]:=bb[j];
          bb[j]:=y;
          inc(i);
          dec(j);
        end;
    until i>j;
    if i<r then qsb(i,r);
    if l<j then qsb(l,j)
end;
PROCEDURE qsbb(l,r:integer);
var    i,j,x,y:integer;
BEGIN
    i:=l;j:=r;
    x:=bb[(l+r)div 2];
    repeat
       while bb[i]<x do inc(i);
       while x<bb[j] do dec(j);
       if i<=j then
        begin
          y:=bb[i];
          bb[i]:=bb[j];
          bb[j]:=y;
          inc(i);
          dec(j);
        end;
    until i>j;
    if i<r then qsbb(i,r);
    if l<j then qsbb(l,j)
end;
BEGIN
readln(m,n,k,l,d);
fillchar(a,sizeof(a),0);
fillchar(b,sizeof(b),0);
for i:=0 to m do
  aa[i]:=i;
for i:=0 to n do
  bb[i]:=i;
  for i:=1 to d do
   begin
    readln(x,y,p,q);
    if y=q then
       if x>p  then a[p]:=a[p]+1
               else a[x]:=a[x]+1;
    if x=p then
       if y>q  then b[q]:=b[q]+1
               else b[y]:=b[y]+1;
    end;
  qsa(1,m);
  qsb(1,n);
  qsaa(1,k);
  qsbb(1,l);
  for i:=1 to k-1 do
    write(aa[i],' ');
  writeln(aa[k]);
  for i:=1 to l-1 do
    write(bb[i],' ');
  writeln(bb[l]);
END.