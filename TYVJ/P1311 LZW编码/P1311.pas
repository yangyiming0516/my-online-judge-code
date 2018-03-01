var a:array[0..300]of string;
    s,ss:string;
    n,i,k:longint;
    flag:boolean;
begin
 readln(n);
 readln(ss);
 for i:=1 to n do
  a[i]:=ss[i];a[0]:=' ';
 readln(s);ss:='';flag:=false;
 while pos('-',s)>0 do
  begin
  val(copy(s,1,pos('-',s)-1),k);
  if k=0 then
   begin
   if flag then
   begin
   inc(n);
   a[n]:=ss;
   flag:=false
   end;
   write(a[k]);
   ss:='';
   end
  else
   begin
   write(a[k]);
   if ss<>'' then flag:=true;
   ss:=ss+a[k]
   end;
  delete(s,1,pos('-',s))
  end;
 val(s,k);
 writeln(a[k])
END.