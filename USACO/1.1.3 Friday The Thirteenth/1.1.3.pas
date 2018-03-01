{
ID:id
PROG:friday
LANG:PASCAL
}
VAR  a:array[0..6]of longint;
     f:longint;
     n,year,month,day,k:integer;
BEGIN
assign(input,'friday.in');reset(input);
assign(output,'friday.out');rewrite(output); 
readln(n);
 f:=0;
 for year:=1900 to 1900+n-1 do
  for month:=1 to 12 do
    begin
    if month in [1,3,5,7,8,10,12] then k:=31
     else if month in [4,6,9,11] then k:=30
      else if ((year mod 100<>0)and(year mod 4=0)) or (year mod 400=0)
              then k:=29 else k:=28;
    for day:=1 to k do
     begin
       inc(f);
       if day=13 then inc(a[f mod 7])
     end;
    end;
  write(a[6],' ');
  write(a[0],' ');
  for day:=1 to 4 do
   write(a[day],' ');
  writeln(a[5]);
close(input);close(output)
END.