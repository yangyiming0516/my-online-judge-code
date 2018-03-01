{
ID:id
PROG:barn1
LANG:PASCAL
}
var m,s,c,i,ans:longint;
    a,b:array[0..200]of longint;
procedure qsa(l,r:longint);
var  temp,i,j,x:longint;
begin
 i:=l;
 j:=r;
 temp:=a[(i+j)div 2];
 repeat
 while a[i]<temp do inc(i);
 while a[j]>temp do dec(j);
 if i<=j then
  begin
  x:=a[i];
  a[i]:=a[j];
  a[j]:=x;
  inc(i);dec(j)
  end;
 until i>j;
 if i<r then qsa(i,r);
 if j>l then qsa(l,j);
end;
procedure qsb(l,r:longint);
var  temp,i,j,x:longint;
begin
 i:=l;
 j:=r;
 temp:=b[(i+j)div 2];
 repeat
 while b[i]>temp do inc(i);
 while b[j]<temp do dec(j);
 if i<=j then
  begin
  x:=b[i];
  b[i]:=b[j];
  b[j]:=x;
  inc(i);dec(j)
  end;
 until i>j;
 if i<r then qsb(i,r);
 if j>l then qsb(l,j);
end;
begin
assign(input,'barn1.in');reset(input);
assign(output,'barn1.out');rewrite(output);
 readln(m,s,c);
 for i:=1 to c do
  readln(a[i]);
 qsa(1,c);
 for i:=1 to c-1 do
  b[i]:=a[i+1]-a[i]-1;
 qsb(1,c-1);
 ans:=a[c]-a[1]+1;
 for i:=1 to m-1 do
   ans:=ans-b[i];
 writeln(ans);
close(input);close(output)
end.