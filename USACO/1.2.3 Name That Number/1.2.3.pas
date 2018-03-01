{
ID:id
PROG:namenum
LANG:PASCAL
}
VAR n:int64;
    flag:boolean;
    st:string;
function num(ch:char):integer;
begin
 case ch of
  'A','B','C':exit(2);
  'D','E','F':exit(3);
  'G','H','I':exit(4);
  'J','K','L':exit(5);
  'M','N','O':exit(6);
  'P','R','S':exit(7);
  'T','U','V':exit(8);
  'W','X','Y':exit(9);
 end;
end;
function suan(s:string):int64;
var k:integer;
    m,h:int64;
begin
  m:=0;
  h:=1;
  k:=0;
  repeat
   inc(k);
   m:=m+h*num(s[length(s)+1-k]);
   h:=h*10
  until k=length(s);
  exit(m)
end;
BEGIN
 assign(input,'namenum.in');reset(input);
 readln(n);
 close(input);
 assign(input,'dict.txt');reset(input);
 assign(output,'namenum.out');rewrite(output);
 flag:=true;
 while not eof do
  begin
  readln(st);
  if suan(st)=n then begin writeln(st);flag:=false end;
  end;
 if flag then writeln('NONE');
 close(input);close(output)
END.