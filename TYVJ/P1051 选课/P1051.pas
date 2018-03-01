var
 s,f:array[0..300,0..300]of longint;
 num:array[0..300]of integer;
 fa,sc,n,m,i:longint;
procedure dp(h:integer);
var i,p,j,k:longint;
begin
 if s[h,0]=0 then begin num[h]:=1; exit end;
 for i:=1 to s[h,0] do
  dp(s[h,i]);
 p:=1;
 for i:=1 to s[h,0] do
  begin
  for j:=p downto 1 do
   for k:=1 to num[s[h,i]] do
   if f[h,j]+f[s[h,i],k]>f[h,j+k] then f[h,j+k]:=f[h,j]+f[s[h,i],k];
  p:=p+num[s[h,i]];
  end;
 num[h]:=p
end;
begin
 readln(n,m);
 fillchar(s,sizeof(s),0);
 fillchar(f,sizeof(f),0);
 for i:=1 to n do
  begin
  readln(fa,sc);
  inc(s[fa,0]);
  s[fa,s[fa,0]]:=i;
  f[i,1]:=sc
  end;
 dp(0);
 writeln(f[0,m+1])
end.