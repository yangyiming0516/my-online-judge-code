{
ID:id
PROG:calfflac
LANG:PASCAL
}
const
  ch:set of char=['a'..'z','A'..'Z'];
var
   a:array[1..20000]of char;
   i,j,ans,max,l,r,ml,mr,al,ar:integer;
BEGIN
assign(input,'calfflac.in');reset(input);
assign(output,'calfflac.out');rewrite(output);
 i:=0;
 while not eof do
  begin
   inc(i);
   read(a[i]);
 end;
 ans:=0;
 for j:=1 to i do
  begin
  if not (a[j]in ch)then continue;
  l:=j;r:=j;max:=1;ml:=j;mr:=j;
  repeat
   repeat if l>1 then dec(l) until (a[l] in ch)or (l=1);
   repeat if r<i then inc(r) until (a[r] in ch)or (r=i);
   if upcase(a[l])=upcase(a[r])then
          begin
          max:=max+2;
          ml:=l;
          mr:=r
          end;
  until (l=1)or(r=i)or(upcase(a[l])<>upcase(a[r]));
  if max>ans then
     begin
      ans:=max;
      al:=ml;
      ar:=mr;
     end;
  end;
  for j:=1 to i-1 do
  begin
  if not (a[j]in ch)then continue;
  l:=j;r:=j;
  repeat inc(r) until(r=i)or(a[r]in ch);
  if upcase(a[l])<>upcase(a[r]) then continue;
  max:=2;ml:=l;mr:=r;
  repeat
   repeat if l>1 then dec(l) until (a[l] in ch)or (l=1);
   repeat if r<i then inc(r) until (a[r] in ch)or (r=i);
   if upcase(a[l])=upcase(a[r])then
          begin
          max:=max+2;
          ml:=l;
          mr:=r
          end;
  until (l=1)or(r=i)or(upcase(a[l])<>upcase(a[r]));
  if max>ans then
     begin
      ans:=max;
      al:=ml;
      ar:=mr;
     end;
  end;
 writeln(ans);
 for j:= al to ar do
   write(a[j]);
writeln;
 close(input);close(output)
END.

