{
ID:yangyim1
PROG:holstein
LANG:PASCAL
}
var p:array[1..25]of longint;
    f:array[1..15]of boolean;
    a:array[1..15,1..25]of longint;
    g,v,i,j:longint;
function ok:boolean;
var  i:longint;
begin
  for i:=1 to v do
  if p[i]>0 then exit(false);
  exit(true)
end;
procedure print;
var i,ans:longint;
begin
 ans:=0;
 for i:=1 to g do
  if f[i]=false then inc(ans);
 write(ans);
 for i:=1 to g do
  if f[i]=false then write(' ',i);
 writeln;
close(input);close(output);

 halt
end;
procedure find(h,k:longint);
var i:longint;
begin
 if h=1 then
  begin
  f[k]:=false;
  for i:=1 to v do
  p[i]:=p[i]-a[k,i];
  if ok then print;
  f[k]:=true;
  for i:=1 to v do
  p[i]:=p[i]+a[k,i];
  end
  else
  begin
  f[k]:=false;
  for i:=1 to v do
  p[i]:=p[i]-a[k,i];
  for i:=k+1 to g do
  if f[i] then find(h-1,i);
  f[k]:=true;
  for i:=1 to v do
  p[i]:=p[i]+a[k,i];
  end
end;
begin
assign(input,'holstein.in');reset(input);
assign(output,'holstein.out');rewrite(output);
 readln(v);
 for i:=1 to v do
  read(p[i]);
 readln(g);
 for i:=1 to g do
  for j:=1 to v do
  read(a[i,j]);
 fillchar(f,sizeof(f),true);
 for i:=1 to g do
  for j:=1 to g-i+1 do
  find(i,j);
end.