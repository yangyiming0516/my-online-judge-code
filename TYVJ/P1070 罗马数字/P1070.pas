const one:array[0..9]of string=('','I','II','III','IV','V','VI','VII','VIII','IX');
      ten:array[0..9]of string=('','X','XX','XXX','XL','L','LX','LXX','LXXX','XC');
      hun:array[0..9]of string=('','C','CC','CCC','CD','D','DC','DCC','DCCC','CM');
      tho:array[0..9]of string=('','M','MM','MMM','','','','','','');
var  p:array['A'..'Z'] of longint;
     s:string;
     n,i,j:integer;
function make(h:integer):string;
var ss:string; k:integer;
begin
  ss:='';
  k:=h;
  ss:=one[k mod 10]+ss;
  k:=k div 10;
  ss:=ten[k mod 10]+ss;
  k:=k div 10;
  ss:=hun[k mod 10]+ss;
  k:=k div 10;
  ss:=tho[k mod 10]+ss;
  exit(ss)
end;
begin
  readln(n);
  fillchar(p,sizeof(p),0);
  for i:=1 to n do
   begin
   s:=make(i);
   for j:=1 to length(s) do
    inc(p[s[j]])
   end;
  if p['I']>0 then writeln('I',' ',p['I']);
  if p['V']>0 then writeln('V',' ',p['V']);
  if p['X']>0 then writeln('X',' ',p['X']);
  if p['L']>0 then writeln('L',' ',p['L']);
  if p['C']>0 then writeln('C',' ',p['C']);
  if p['D']>0 then writeln('D',' ',p['D']);
  if p['M']>0 then writeln('M',' ',p['M'])
end.