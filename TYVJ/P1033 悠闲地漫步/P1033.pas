VAR  p,i,k:longint;
     d1,d2:array[1..1000]of integer;
function road(x:integer):longint;
var a,b:longint;
begin
  if x=0 then exit(0);
  a:=road(d1[x]);
  b:=road(d2[x]);
  if a>b then road:=a+1 else road:=b+1;
end;
begin
  readln(p);
  for i:=1 to p-1 do
   begin
     read(k);
     readln(d1[k],d2[k])
   end;
  writeln(road(1))
END.