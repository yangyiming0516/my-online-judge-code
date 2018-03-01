var a:int64;
   i,n,k:integer;
   s:string;
BEGIN
 readln(n,k);
 a:=1;
 for i:=2 to n do
   a:=a*i;
 while a mod 10=0 do a:=a div 10;
 str(a,s);
 if length(s)>k then
    writeln(copy(s,length(s)-k+1,k))
 else
    writeln(s);
END.