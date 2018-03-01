const p:array['0'..'9']of byte=(0,1,2,3,4,5,6,7,8,9);
var a:array[0..2000]of char;
    d,f:array[1..2000]of byte;
    i,k,l,s:integer;
procedure plus;
var j:integer;
begin
 j:=1;
 while (j<=s)or(d[j]<>0) do
  begin
  f[j]:=f[j]+d[j];
  if f[j]>=10 then
   begin
   d[j+1]:=d[j+1]+f[j] div 10;
   f[j]:=f[j] mod 10;
   end;
  inc(j)
  end;
 if j-1>l then l:=j-1;
end;
procedure shuchu;
var j:integer;
begin
 for j:=l downto 1 do
  write(f[j]);
 writeln
end;
begin
 k:=0;a[0]:='+';l:=0;
 while not eoln do
  begin
  inc(k);
  read(a[k]);
  end;
 s:=0;
 fillchar(f,sizeof(f),0);
 fillchar(d,sizeof(d),0);
 for i:=k downto 0 do
  if a[i]='+' then begin plus;s:=0;fillchar(d,sizeof(d),0) end
  else
  begin
   inc(s);
   d[s]:=p[a[i]];
  end;
 shuchu
end.