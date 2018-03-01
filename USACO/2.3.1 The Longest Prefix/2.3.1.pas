{
ID:yangyim1
PROG:prefix
LANG:PASCAL
}
var k,h,ans,i:longint;
    st:array[1..200]of string;
    a:array[1..200000]of char;
    f:array[0..200000] of boolean;
procedure  qs(l,r:integer);
var i,j:longint;
    x,t:string;
begin
 i:=l;j:=r;x:=st[(l+r)div 2];
 repeat
  while st[i]<x do inc(i);
  while st[j]>x do dec(j);
  if i<=j then
   begin
   t:=st[i];
   st[i]:=st[j];
   st[j]:=t;
   inc(i);dec(j)
   end;
 until i>j;
 if l<j then qs(l,j);
 if i<r then qs(i,r)
end;
procedure init;
var s:string;
    i:integer;
begin
 readln(s);
 k:=0;
 while s<>'.' do
  begin
  inc(k);st[k]:='';
  for i:=1 to length(s) do
   if s[i]=' ' then begin inc(k);st[k]:='' end
    else st[k]:=st[k]+s[i];
  readln(s);
  end;
 qs(1,k);
 h:=0;
 while not eof do
  begin
  readln(s);
  for i:=1 to length(s) do
   begin
   inc(h);
   a[h]:=s[i]
   end;
  end;
end;
function find(l,r:integer;s:string):boolean;
var t:integer;
begin
 if l>r then exit(false);
 t:=(l+r)div 2;
 if s=st[t] then exit(true);
 if s>st[t] then exit(find(t+1,r,s));
 if s<st[t] then exit(find(l,t-1,s))
end;
function make(m,p:longint):boolean;
var i:integer;s:string;
begin
 s:='';
 for i:=0 to p-1 do
  begin
   s:=a[m-i]+s;
   if f[m-i-1] and find(1,k,s) then exit(true)
  end;
 exit(false)
end;
BEGIN
assign(input,'prefix.in');reset(input);
assign(output,'prefix.out');rewrite(output);
 init;
 f[0]:=true;
 ans:=0;
 for i:=1 to h do
  begin
  if i>=10 then f[i]:=make(i,10)
  else f[i]:=make(i,i);
  if f[i] then ans:=i;
  end;
 writeln(ans);
close(Input);close(Output)
END.

