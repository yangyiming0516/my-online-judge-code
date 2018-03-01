var d:array[1..100]of longint;
    l,r,i:longint;
    c:char;
procedure print;
begin
  if l>r then writeln('None')
  else begin writeln(d[l]);inc(l) end;
  readln
end;
procedure putin;
begin
  inc(r);
  readln(d[r])
end;
begin
 l:=1;r:=0;
 while not eof do
  begin
  read(c);
  if c='O' then print
  else putin
  end;
end.