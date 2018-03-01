{
ID:id
PROG:dualpal
LANG:PASCAL
}
VAR  n,s,m:longint;
function right(p,q:longint):boolean;
var a:array[1..20]of integer;
    h,x:longint;
begin
  h:=0;
  x:=p;
  repeat
   inc(h);
   a[h]:=x mod q;
   x:=x div q;
  until x=0;
  for x:=1 to h do
   if a[x]<>a[h+1-x] then exit(false);
  exit(true)
end;
function pan(k:longint):boolean;
var i,h:integer;
begin
 h:=0;
 for i:=2 to 10 do
  begin
  if right(k,i) then inc(h);
  if h=2 then exit(true);
  end;
 exit(false)
end;
BEGIN
assign(input,'dualpal.in');reset(input);
assign(output,'dualpal.out');rewrite(output);
  readln(n,s);
  m:=0;
  repeat
   inc(s);
   if pan(s) then
     begin
      inc(m);
      writeln(s)
     end;
  until m=n;
close(input);close(output)
END.