VAR  a:array[1..240,1..240]of boolean;
     x,y,n,i,j,k,max,xl,yl,xr,yr:longint;
BEGIN
 fillchar(a,sizeof(a),false);
   readln(x,y,n);
   for i:=1 to n do
    begin
     readln(xl,yl,xr,yr);
     for j:=xl to xr do
      for k:=yl to yr do
        a[j,k]:=true;
    end;
  max:=0;
   for j:=1 to x do
    for k:=1 to y do
     if a[j,k] then inc(max);
  writeln(max)
END.