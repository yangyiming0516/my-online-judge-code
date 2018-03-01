var m,s,t,i,s1,s2:longint;
begin
  readln(m,s,t);
  for i:=1 to t do
  begin
    if m>=10 then
    begin
      s2:=s2+60;
      m:=m-10;
    end
    else
      m:=m+4;
    if s1+17<s2 then s1:=s2
    else
      s1:=s1+17;
    if s1>=s then
    begin
      writeln('Yes');
      writeln(i);
      halt;
    end;
  end;
  writeln('No');
  writeln(s1);
end.