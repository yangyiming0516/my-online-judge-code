Var fj,fo:array[1..18]of int64;
    n,i:longint;
begin
  readln(n);
  fillchar(fj,sizeof(fj),0);
  fillchar(fo,sizeof(fo),0);
  fo[1]:=8;
  fj[1]:=1;
  for i:=2 to n do
    begin
    fo[i]:=9*fo[i-1]+fj[i-1];
    fj[i]:=9*fj[i-1]+fo[i-1]
    end;
  writeln(fo[n])
end.