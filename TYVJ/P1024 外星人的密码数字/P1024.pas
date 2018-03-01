VAR a:array['a'..'z']of integer;
    f:array[1..260]of integer;
    s,ss:string;
    h,k,l:integer;
procedure DP(st:string);
var i,j,ans:integer;
BEGIn
if length(st)=1 then  write(1)
else
 begin
 fillchar(f,sizeof(f),0);
 ans:=1;
 for i:=1 to length(st) do f[i]:=1;
 for i:=2 to length(st) do
  begin
  for j:=1 to i-1 do
    if a[st[i]]>=a[st[j]]
       then if f[j]+1>f[i] then f[i]:=f[j]+1;
  if f[i]>ans then ans:=f[i];
  end;
 write(ans)
 end
end;
BEGIN
  readln(s);
  readln(ss);
  for k:=1 to length(s) do
   a[s[k]]:=k;
  l:=0;
  for h:=1 to length(ss) do
    if ss[h]=' ' then
     begin
      dp(copy(ss,l+1,h-l));
      l:=h
     end;
  DP(copy(ss,l+1,length(ss)-l))
END.