VAR n,i:integer;
    s:string;
BEGIN
  readln(n);
  for i:=1 to n do
   begin
    readln(s);
    if (ord(s[length(s)])-48)mod 2=0 then
      writeln('even')
     else writeln('odd');
   end;
END.