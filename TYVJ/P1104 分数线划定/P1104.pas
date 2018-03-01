var a:array[1..100,1000..9999] of integer;
    b:array[1..100] of integer;
    n,m,f,x,z,min,i,j:integer;
begin
 readln(n,m);
 m:=trunc(m*1.5);
 for i:=1 to n do
  begin
   readln(x,f);
   a[f,x]:=1;
   inc(b[f]);
  end;
 i:=101;
 min:=30000;
 while z<m  do
 begin
  dec(i);
  if b[i]>0 then
    begin
    if i<min then min:=i;
    z:=z+b[i];
    end;
 end;
 writeln(min,' ',z);
 z:=0;
 i:=101;;
 while z<m  do
  begin
   dec(i);
   if b[i]>0 then
    begin
     z:=z+b[i];
     for j:=1000 to 9999 do
     if a[i,j]>0 then writeln(j,' ',i);
   end;
  end;
end.