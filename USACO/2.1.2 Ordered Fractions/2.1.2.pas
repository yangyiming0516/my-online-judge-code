{
ID:yangyim1
PROG: frac1
LANG: PASCAL
}
var
  n:byte;
procedure mid (a,b,c,d:byte);
begin
  if b+d>n then
    exit;
  mid(a,b,a+c,b+d);
  writeln(a+c,'/',b+d);
  mid(a+c,b+d,c,d);
end;
begin
  assign(input,'frac1.in');
  assign(output,'frac1.out');
  reset(input);
  rewrite(output);
  readln(n);
  writeln('0/1');
  mid(0,1,1,1);
  writeln('1/1');
  close(output);
end.
