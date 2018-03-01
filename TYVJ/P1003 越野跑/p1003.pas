VAR  m,t,u,f,d,max,i:longint;
     s:array[1..100000]of char;
BEGIN
  readln(m,t,u,f,d);
  for i:=1 to t do
  readln(s[i]);
  max:=0;
  for i:=1 to t do
   begin
   if s[i]='f' then max:=max+2*f else max:=max+u+d;
   if max>m then
       begin
        writeln(i-1);
       break;
       end;
   end;
END.