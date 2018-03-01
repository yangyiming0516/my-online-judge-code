var m,h:int64;
    n,k,i:longint;
    s:string;
begin
 readln(n,k);
 m:=10000000000;
 h:=1;
 for i:=1 to n do
  begin
  h:=h*i;
  while h mod 10=0 do
   h:=h div 10;
  if h>=m then
   h:=h mod m;
  end;
 str(h,s);
 writeln(copy(s,length(s)-k+1,k))
end.