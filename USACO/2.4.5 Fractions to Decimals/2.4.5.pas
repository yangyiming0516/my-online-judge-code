{
ID:yangyim1
PROG:fracdec
LANG:PASCAL
}
var n,d,i,yu,h:longint;
    s:ansistring;
    ed:array[1..100000]of longint;
procedure print;
var ss:string;
begin
  str(n div d,ss);
  s:=ss+'.'+s;
  for i:=1 to length(s) do
   begin
   if (i mod 76=1)and(i<>1) then writeln;
   write(s[i]);
   end;
  writeln;
  close(input);close(output);
  halt
end;
begin
assign(input,'fracdec.in');reset(input);
assign(output,'fracdec.out');rewrite(output);
 readln(n,d);
 if n mod d=0 then
  begin
  writeln(n div d,'.',0);
  close(input);close(output);
  halt
  end;
 fillchar(ed,sizeof(ed),0);
 yu:=(n mod d)*10;
 h:=0;s:='';
 while true do
  begin
  inc(h);
  if yu=0 then print;
  if ed[yu div 10]=0 then
   begin
   ed[yu div 10]:=h;
   s:=s+chr(yu div d+48);
   yu:=(yu mod d)*10
   end
  else
   begin
   insert('(',s,ed[yu div 10]);
   s:=s+')';
   print
   end;
  end;
end.
