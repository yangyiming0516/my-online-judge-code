{
ID:yangyim1
PROG:runround
LANG:PASCAL
}
var  p:array[0..9]of boolean;
     f:array[1..9]of byte;
     m,n:longint;
function right(x,y:integer):boolean;
var h,i:integer;
begin
 if (y=0) and (x=m) then exit(true);
 h:=x;
 for i:=1 to f[x] do
  begin
   dec(h);
   if h=0 then h:=m
  end;
 if p[h] then exit(false) else p[h]:=true;
 exit(right(h,y-1))
end;
function ok(h:longint):boolean;
var k:longint;
begin
  fillchar(f,sizeof(f),0);
  fillchar(p,sizeof(p),false);
  m:=0;
  k:=h;
  while k>0 do
   begin
   if k mod 10=0 then exit(false);
   if p[k mod 10] then exit(false);
   p[k mod 10]:=true;
   inc(m);f[m]:=k mod 10;
   k:=k div 10
   end;
  fillchar(p,sizeof(p),false);
  exit(right(m,m))
end;
begin
assign(input,'runround.in');reset(input);
assign(output,'runround.out');rewrite(output); 
 readln(n);
 repeat
 inc(n)
 until ok(n);
 writeln(n);
close(input);close(output)
end.