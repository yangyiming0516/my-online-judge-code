var x,y:longint; 
    i,tot:longint;
begin
  readln(x,y);
  for i:=1 to y do
  tot:=tot+y div i;
  for i:=1 to x-1 do
  tot:=tot-(x-1) div i;
  writeln(tot)
end.