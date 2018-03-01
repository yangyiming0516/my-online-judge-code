{
ID:yangyim1
PROG:checker
LANG:PASCAL
}
var p:array[1..13] of integer;
    a:array[1..13] of boolean;
    b:array[-12..12]of boolean;
    c:array[2..26]of boolean;
    n,i,ans,mid:longint;
procedure print;
var i:integer;
begin
  for i:=1 to n-1 do
   write(p[i],' ');
  writeln(p[n]);
  if (n=6)and(ans=2) then
   begin
   for i:=1 to n-1 do
    write(n-p[i]+1,' ');
   writeln(n-p[n]+1)
   end;
end;
procedure dfs(k:integer);
var i:integer;
begin
  if k>n then
   begin
   inc(ans);
   if ans<=3 then print;
   if odd(n) and (p[n]=(n+1)div 2) then inc(mid);
   end
  else
    for i:=1 to n do
     if a[i] and b[i-k] and c[i+k] then
     begin
     p[k]:=i;
     a[i]:=false;b[i-k]:=false;c[i+k]:=false;
     dfs(k+1);
     a[i]:=true;b[i-k]:=true;c[i+k]:=true
     end;
end;
begin
assign(input,'checker.in');reset(input);
assign(output,'checker.out');rewrite(output);
  readln(n);
  ans:=0;mid:=0;
  fillchar(a,sizeof(a),true);
  fillchar(b,sizeof(b),true);
  fillchar(c,sizeof(c),true);
  for i:=1 to n div 2 do
   begin
   a[i]:=false;b[i-1]:=false;c[i+1]:=false;p[1]:=i;
   dfs(2);
   a[i]:=true;b[i-1]:=true;c[i+1]:=true;
   end;
  writeln((ans+mid)*2);
close(input);close(output)
end.