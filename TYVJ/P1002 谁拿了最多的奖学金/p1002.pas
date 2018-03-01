var s:array[1..100] of string;
    a:array[1..100,1..3] of integer;
    b:array[1..100,1..2] of char;
    j:array[1..100] of integer;
    i,p,max,Code,n:integer;
    str:string;
    he:longint;
BEGIN
  readln(n);
  for I:=1 to n do
   begin
   readln(str);
   s[i]:=copy(str,1,pos(' ',str)-1);
   delete(str,1,pos(' ',str));
   val(copy(str,1,pos(' ',str)-1),p,Code);
   a[i,1]:=p;
   delete(str,1,pos(' ',str));
   val(copy(str,1,pos(' ',str)-1),p,Code);
   a[i,2]:=p;
   delete(str,1,pos(' ',str));
   b[i,1]:=str[1];
   b[i,2]:=str[3];
   val(str[5],p,Code);
   a[i,3]:=p
   end;
  fillchar(j,sizeof(j),0);
  for i:=1 to n do
   begin
    if(a[i,1]>80)and(a[i,3]>=1) then j[i]:=j[i]+8000;
    if(a[i,1]>85)and(a[i,2]>80) then j[i]:=j[i]+4000;
    if(a[i,1]>90) then j[i]:=j[i]+2000;
    if(a[i,1]>85)and(b[i,2]='Y') then j[i]:=j[i]+1000;
    if(a[i,2]>80)and(b[i,1]='Y') then j[i]:=j[i]+850;
   end;
  max:=0;
  he:=0;
  p:=1;
  for i:=1 to n do
   begin
    if j[i]>max then begin
                   max:=j[i];
                   p:=i
                   end;
    he:=he+j[i]
   end;
  writeln(s[p]);
  writeln(max);
  writeln(he)
END.