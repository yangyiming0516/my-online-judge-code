VAR s:string;
    f:array['a'..'z']of integer;
    i,x,max,min:integer;
    flag:boolean;
    j:char;
BEGIN
fillchar(f,sizeof(f),0);
  readln(s);
  for i:=1 to length(s) do
    f[s[i]]:=f[s[i]]+1;
  max:=0;min:=100;
  for j:='a' to 'z' do
    begin
     if f[j]>max then max:=f[j];
     if (f[j]<min) and (f[j]>0)then min:=f[j];
    end;
  x:=max-min;
  flag:=true;
  for i:=2 to trunc(sqrt(x)) do
   if x mod i=0 then flag:=false;
  if x<=1 then flag:=false;
  if flag then
    begin
     writeln('Lucky Word');
     writeln(x);
    end
   else
    begin
     writeln('No Answer');
     writeln(0);
    end;
END.