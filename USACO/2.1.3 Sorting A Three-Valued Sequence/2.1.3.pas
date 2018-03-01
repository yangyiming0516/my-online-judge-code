{
ID:yangyim1
PROG:sort3
LANG:PASCAL
}
var a,b:array[1..1000]of byte;
    n,i,one,two,ans:longint;
    f:array[1..3,1..3]of longint;
function min(a,b:longint):longint;
begin
  if a<b then exit(a) else exit(b)
end;
procedure qs(l,r:longint);
var i,j,x,t:longint;
begin
 i:=l;j:=r;x:=b[(l+r)div 2];
 repeat
  while b[i]<x do inc(i);
  while b[j]>x do dec(j);
  if i<=j then
   begin
   t:=b[i];b[i]:=b[j];b[j]:=t;
   inc(i);dec(j)
   end
 until i>j;
 if l<j then qs(l,j);
 if i<r then qs(i,r)
end;
begin
assign(input,'sort3.in');reset(input);
assign(output,'sort3.out');rewrite(output);
 readln(n);
 for i:=1 to n do
  readln(a[i]);
 b:=a;
 qs(1,n);
 fillchar(f,sizeof(f),0);
 for i:=1 to n do
 inc(f[a[i],b[i]]);
 one:=one+min(f[1,2],f[2,1]);
 two:=two+abs(f[1,2]-f[2,1]);
 one:=one+min(f[1,3],f[3,1]);
 two:=two+abs(f[1,3]-f[3,1]);
 one:=one+min(f[2,3],f[3,2]);
 two:=two+abs(f[2,3]-f[3,2]);
 ans:=one+(two div 3)*2;
 writeln(ans);
close(input);close(output)
end.
