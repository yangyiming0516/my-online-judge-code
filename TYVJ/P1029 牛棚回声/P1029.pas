VAR s1,s2:string;
    i,l:integer;
BEGIN
    readln(s1);
    readln(s2);
    l:=0;
    for i:=1 to length(s1) do
    if copy(s1,1,i)=copy(s2,length(s2)+1-i,i)then if i>l then l:=i;
    for i:=1 to length(s2) do
    if copy(s2,1,i)=copy(s1,length(s1)+1-i,i)then if i>l then l:=i;
    writeln(l)
END.