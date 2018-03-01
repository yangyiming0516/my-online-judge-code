var
  n,i,j,st1,st2,next_num,min,t:longint;
  a,color,s1,s2:array[0..1500] of longint;
  map:array[1..1500,1..1500] of boolean;
  vis:array[1..1500] of boolean;
  ans:array[1..3000] of char;
procedure print;
begin
  writeln(0);
  halt;
end;
procedure dfs(x,nowcolor:longint);
var
  i:longint;
begin
  vis[x]:=true;
  color[x]:=nowcolor;
  for i:=1 to n do
    if map[x,i] then
      begin
        if not vis[i] then
          dfs(i,3-nowcolor)
        else
          if color[i]<>3-nowcolor then print;
      end;
end;
begin
  readln(n);
  for i:=1 to n do
    read(a[i]);
  readln;
  min:=maxlongint;
  for i:=n downto 1 do
    begin
      for j:=1 to i-1 do
        if (a[j]<a[i]) and (min<a[j]) then
          begin
            map[a[i],a[j]]:=true;
            map[a[j],a[i]]:=true;
          end;
      if a[i]<min then min:=a[i];
    end;
  fillchar(vis,sizeof(vis),0);
  for i:=1 to n do
    if not vis[a[i]] then dfs(a[i],1);
  i:=1;
  next_num:=1;
  t:=a[i];
  st1:=0;
  st2:=0;
  j:=0;
  while (i<=n) or (next_num<=n) do
    begin
      if (i<=n) and (color[t]=1) and ((st1=0) or (t<s1[st1])) then
        begin
          inc(j);
          ans[j]:='a';
          inc(st1);
          s1[st1]:=t;
          inc(i);
          if i<=n then t:=a[i] else t:=0;
          continue;
        end;
      if (st1>0) and (s1[st1]=next_num) then
        begin
          inc(j);
          ans[j]:='b';
          dec(st1);
          inc(next_num);
          continue;
        end;
      if (i<=n) and (color[t]=2) and ((st2=0) or (t<s2[st2])) then
        begin
          inc(j);
          ans[j]:='c';
          inc(st2);
          s2[st2]:=t;
          inc(i);
          if i<=n then t:=a[i] else t:=0;
          continue;
        end;
      if (st2>0) and (s2[st2]=next_num) then
        begin
          inc(j);
          ans[j]:='d';
          dec(st2);
          inc(next_num);
          continue;
        end;
    end;
  for i:=1 to j-1 do
    write(ans[i],' ');
  writeln(ans[j]);
end. 