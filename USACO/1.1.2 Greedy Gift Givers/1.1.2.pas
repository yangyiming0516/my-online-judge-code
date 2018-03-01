{
ID:id
PROG:gift1
LANG:PASCAL
}
VAR nam:array[1..10]of string;
    rec:array[1..10]of integer;
    st:string;
    i,j,n,m,h:integer;
function find(s:string):integer;
var   k:integer;
begin
    for k:=1 to n do
     if s=nam[k] then exit(k)
end;
BEGIN
assign(input,'gift1.in');reset(input);
assign(output,'gift1.out');rewrite(output);
fillchar(rec,sizeof(rec),0);
  readln(n);
  for i:=1 to n do
   readln(nam[i]);
  for i:=1 to n do
   begin
    readln(st);
    readln(m,h);
    if h<>0  then  rec[find(st)]:=rec[find(st)]+(m mod h)-m;
    for j:=1 to h do
     begin
      readln(st);
      rec[find(st)]:=rec[find(st)]+(m div h)
     end;
   end;
 for i:=1 to n do
   begin
   write(nam[i]);
   write(' ');
   writeln(rec[i])
   end;
close(input);close(output)
END.