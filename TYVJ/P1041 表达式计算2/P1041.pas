const p:array['0'..'9']of byte=(0,1,2,3,4,5,6,7,8,9);
var i,k,l,h:integer;
    sa,sb,f,s:array[0..1000]of integer;
    a:array[0..1000]of char;
    flag:boolean;
procedure plusa;
var j:integer;
begin
 j:=1;
 while (j<=h)or(f[j]<>0) do
  begin
  sa[j]:=sa[j]+f[j];
  if sa[j]>=10 then
   begin
   f[j+1]:=f[j+1]+sa[j] div 10;
   sa[j]:=sa[j] mod 10;
   end;
  inc(j);
  end;
 if j-1>l then l:=j-1;
end;
procedure plusb;
var j:integer;
begin
 j:=1;
 while (j<=h)or(f[j]<>0) do
  begin
  sb[j]:=sb[j]+f[j];
  if sb[j]>=10 then
   begin
   f[j+1]:=f[j+1]+sb[j] div 10;
   sb[j]:=sb[j] mod 10;
   end;
  inc(j);
  end;
end;
procedure minus;
var j:integer;
begin
 for j:=1 to l do
  begin
  s[j]:=sa[j]-sb[j];
  if s[j]<0 then
  begin
  s[j]:=s[j]+10;
  dec(sa[j+1]);
  end;
  end;
end;
begin
 k:=0;
 while not eoln do
  begin
  inc(k);
  read(a[k])
  end;
 a[0]:='+';
 h:=0;l:=0;
 for i:=k downto 0 do
 begin
 if a[i]='+' then
  begin
  plusa;
  fillchar(f,sizeof(f),0);
  h:=0;
  end
 else
 if a[i]='-' then
  begin
  plusb;
  fillchar(f,sizeof(f),0);
  h:=0;
  end
 else
  begin
  inc(h);
  f[h]:=p[a[i]]
  end;
 end;
 fillchar(s,sizeof(s),0);
 minus;
 flag:=false;
 for i:=l downto 1 do
  begin
  if (flag=false) and (s[i]=0) then continue;
  flag:=true;
  write(s[i])
  end;
 if flag=false then writeln(0);
end.