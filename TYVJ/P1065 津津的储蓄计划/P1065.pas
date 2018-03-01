var i,save,rest:longint;
    a:array[1..12]of longint;
    flag:boolean;
begin
 for i:=1 to 12 do
  read(a[i]);
 save:=0;
 rest:=0;
 flag:=true;
 for i:=1 to 12 do
  begin
  rest:=rest+300;
  if rest<a[i] then
   begin
   writeln(-i);
   flag:=false;
   break;
   end;
  rest:=rest-a[i];
  save:=save+100*(rest div 100);
  rest:=rest mod 100;
  end;
 rest:=trunc(rest+1.2*save);
 if flag then writeln(rest)
end.