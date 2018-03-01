{
ID:id
PROG:transform
LANG:PASCAL
}
VAR  a1,a2,a3,f:array[1..10,1..10]of char;
     n,i,j,ans:integer;
function same:boolean;
var i,j:integer;
begin
  for i:=1 to n do
   for j:=1 to n do
    if a2[i,j]<>f[i,j] then exit(false);
  exit(true)
end;
BEGIN
assign(input,'transform.in');reset(input);
assign(output,'transform.out');rewrite(output);
 readln(n);
 for i:=1 to n do
  begin
   for j:=1 to n do read(a1[i,j]);
   readln
  end;
 for i:=1 to n do
  begin
   for j:=1 to n do read(a2[i,j]);
   readln
  end;
 fillchar(f,sizeof(f),' ');
 ans:=0;
 if ans=0 then
  for i:=1 to n do
   for j:=1 to n do
     f[j,n+1-i]:=a1[i,j];
  if same then ans:=1;
 fillchar(f,sizeof(f),' ');
 if ans=0 then
  for i:=1 to n do
   for j:=1 to n do
     f[n+1-i,n+1-j]:=a1[i,j];
  if same then ans:=2;
 fillchar(f,sizeof(f),' ');
 if ans=0 then
  for i:=1 to n do
   for j:=1 to n do
    f[n+1-j,i]:=a1[i,j];
  if same then ans:=3;
 fillchar(f,sizeof(f),' ');
 if ans=0 then
  for i:=1 to n do
   for j:=1 to n do
     begin
     f[i,n+1-j]:=a1[i,j];
     a3[i,n+1-j]:=a1[i,j];
     end;
  if same then ans:=4;
 fillchar(f,sizeof(f),' ');
 if ans=0 then
  for i:=1 to n do
   for j:=1 to n do
     f[j,n+1-i]:=a3[i,j];
  if same then ans:=5;
 fillchar(f,sizeof(f),' ');
 if ans=0 then
  for i:=1 to n do
   for j:=1 to n do
     f[n+1-i,n+1-j]:=a3[i,j];
  if same then ans:=5;
 fillchar(f,sizeof(f),' ');
 if ans=0 then
  for i:=1 to n do
   for j:=1 to n do
     f[n+1-j,i]:=a1[i,j];
  if same then ans:=5;
 if ans=0 then
  for i:=1 to n do
   for j:=1 to n do
     f[i,j]:=a1[i,j];
  if same then ans:=6;
  if ans=0 then ans:=7;
 writeln(ans);
close(input);close(output)
END.