var  a:array[0..9]of integer=(6,2,5,5,4,5,6,3,7,6);
     n,i,j,max:integer;
function  num(x:integer):integer;
var m,t:integer;
BEGIN
  m:=0;
  t:=x;
  if x>=1000 then begin m:=m+a[1]; t:=t-1000 end;
  if x>=100 then begin m:=m+a[t div 100]; t:=t mod 100 end;
  if x>=10 then begin m:=m+a[t div 10];  t:=t mod 10 end;
  if x>=0 then m:=m+a[t];
  num:=m
END;
BEGIN
   readln(n);
   n:=n-4;
   max:=0;
   for i:=0 to 1111 do
    for j:=0 to i do
     if num(i)+num(j)+num(i+j)=n then
       if i=j then max:=max+1 else max:=max+2;
   writeln(max)
END.