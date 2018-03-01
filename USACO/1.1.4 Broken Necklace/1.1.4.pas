{
ID:yangyim1
PROG:beads
LANG:PASCAL
}

VAR  a:array[1..2000]of char;
     i,k,l,r,nl,nr,max:integer;
     cl,cr:char;
     flag:boolean;
BEGIN
 assign(input,'beads.in');reset(INPUT);
assign(output,'beads.out');rewrite(output);
readln(k);
fillchar(a,sizeof(a),' ');
  for i:=1 to k do
    begin
    read(a[i]);
    a[i+k]:=a[i];
    a[i+2*k]:=a[i];
    end;
  readln;
  max:=0;
  for i:=k+1 to 2*k do
   begin
    r:=i;l:=i-1;nr:=1;nl:=1;cr:=a[R];cl:=a[l];
    flag:=false;
    repeat
    inc(r);
    if cr='w' then cr:=a[r];
    if (a[r]=cr)or(a[r]='w') then inc(nr) else flag:=true;
    until flag or (nr=k);
    flag:=false;
    repeat
    dec(l);
    if cl='w' then cl:=a[l];
    if (a[l]=cl)or(a[l]='w') then inc(nl) else flag:=true;
    until flag or (nl=k);
    if nr+nl>max then max:=nr+nl;
   end;
if max>k then max:=k;
writeln(max);
close(input);close(output)
END.
