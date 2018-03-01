VAR s:array[1..500]of longint;
    f:array[0..45000]of boolean;
    h,j:longint;
    i,n:integer;
BEGIN
readln(h,n);
  for i:=1 to n do
   readln(s[i]);
  fillchar(f,sizeof(f),false);
  f[0]:=true;
  for i:=1 to n do
   for j:=h-s[i] downto 0 do
    if f[j] then f[j+s[i]]:=true;
  for j:=h downto 0 do
    if f[j] then
        begin
        writeln(j);
        break
        end;
END.