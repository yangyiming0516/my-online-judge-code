var a:array[1..30]of integer;
    p:array[0..30,0..30]of byte;
    f:array[0..30,0..30]of int64;
    i,n:integer;
function dp(l,r:integer):int64;
var j,k:integer;
    max:int64;
begin
 if l>r then exit(1);
 if l=r then begin p[l,r]:=l;exit(a[l]);end;
 if f[l,r]<>0 then exit(f[l,r]);
 max:=0;
 for j:=l to r do
  if dp(l,j-1)*dp(j+1,r)+a[j]>max
  then
   begin
   max:=dp(l,j-1)*dp(j+1,r)+a[j];
   k:=j
   end;
 f[l,r]:=max;
 p[l,r]:=k;
 exit(max)
end;
procedure shuchu(l,r:integer);
begin
 if l>r then exit;
 write(' ',p[l,r]);
 shuchu(l,p[l,r]-1);
 shuchu(p[l,r]+1,r)
end;
begin
 readln(n);
 for i:=1 to n do
  read(a[i]);
 writeln(dp(1,n));
 write(p[1,n]);
 shuchu(1,p[1,n]-1);
 shuchu(p[1,n]+1,n)
end.