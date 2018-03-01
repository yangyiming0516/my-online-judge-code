{
ID:id
PROG:milk3
LANG:PASCAL
}
var f:array[0..20,0..20,0..20]of boolean;
    s:array[0..20] of boolean;
    sa,sb,sc,i:integer;
procedure dao(a,b,c:integer);
begin
 if f[a,b,c] then exit;
 f[a,b,c]:=true;
 if a=0 then s[c]:=true;
 if b+c<sb then dao(a,b+c,0) else dao(a,sb,c-(sb-b));
 if a+c<sa then dao(a+c,b,0) else dao(sa,b,c-(sa-a));
 if b+c<sc then dao(a,0,b+c) else dao(a,b-(sc-c),sc);
 if b+a<sa then dao(a+b,0,c) else dao(sa,b-(sa-a),c);
 if a+c<sc then dao(0,b,a+c) else dao(a-(sc-c),b,sc);
 if a+b<sb then dao(0,a+b,c) else dao(a-(sb-b),sb,c);
end;
begin
assign(input,'milk3.in');reset(input);
assign(output,'milk3.out');rewrite(output);
 fillchar(f,sizeof(f),false);
 fillchar(s,sizeof(s),false);
 readln(sa,sb,sc);
 dao(0,0,sc);
 for i:=0 to sc-1 do
  if s[i] then write(i,' ');
 writeln(sc);
close(input);close(output)
END.