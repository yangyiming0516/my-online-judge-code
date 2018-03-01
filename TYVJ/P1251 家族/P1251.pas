var i,n,m,p,a,b:longint;
    faTHER,rank:array[1..5000]of longint;
function find(m:longint):longint;
begin
 if father[m]=0 then exit(m)
 else
  begin
  father[m]:=find(father[m]);
  exit(father[m])
  end;
end;
procedure union(a,b:longint);
var fa,fb:longint;
begin
 fa:=find(a);
 fb:=find(b);
 if rank[fa]<rank[fb] then father[fa]:=fb
  else
   if rank[fa]>rank[fb] then father[fb]:=fa
    else
    begin
     father[fa]:=fb;
     inc(rank[fb])
    end;
end;
function same(a,b:longint):boolean;
begin
 if find(a)=find(b) then exit(true) else exit(false)
end;
Begin
 readln(n,m,p);
 fillchar(father,sizeof(father),0);
 fillchar(rank,sizeof(rank),0);
 for i:=1 to m do
  begin
  readln(a,b);
  if not same(a,b) then union(a,b);
  end;
 for i:=1 to p do
  begin
  readln(a,b);
  if same(a,b) then writeln('Yes')
  else writeln('No')
  end;
END.