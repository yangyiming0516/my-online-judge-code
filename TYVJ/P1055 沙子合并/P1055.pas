var  n,i,m:longint;
     s:array[0..300]of longint;
     f:array[1..300,1..300]of longint;
function sum(l,r:longint):longint;
begin
  exit(s[r]-s[l-1])
end;
function dp(l,r:longint):longint;
var i,min:longint;
begin
 if f[l,r]>0 then exit(f[l,r]);
 if l=r then exit(0);
 min:=maxlongint;
 for i:=l+1 to r do
  if min>dp(l,i-1)+dp(i,r)+sum(l,r)
  then min:=dp(l,i-1)+dp(i,r)+sum(l,r);
 f[l,r]:=min;
 exit(min)
end;
begin
 readln(n);
 s[0]:=0;
 for i:=1 to n do
  begin
  read(m);
  s[i]:=s[i-1]+m
  end;
 fillchar(f,sizeof(f),0);
 writeln(dp(1,n));
end.