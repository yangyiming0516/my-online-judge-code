var p:array[0..10]of longint;
   f:array[0..10]of boolean;
   k,i,n,h:longint;
   s:string;
begin
 p[0]:=1;
 k:=1;
 fillchar(f,sizeof(f),false);
 for i:=1 to 10 do
  begin
  p[i]:=p[i-1]*i;
  k:=k+p[i]
  end;
 readln(s);
 if length(s)>7 then writeln('No!')
  else
   begin
   val(s,n);
   h:=n;
   if (n>k)or(n=0) then writeln('No!')
    else
     begin
      for i:=10 downto 0 do
       if n>=p[i] then begin n:=n-p[i];f[i]:=true end;
      if n>0 then writeln('No!')
       else
        begin
        write(h,'=');
        for i:=0 to 10 do
         if f[i] then begin f[i]:=false;write(i,'!');break end;
        for i:=0 to 10 do
         if f[i] then write('+',i,'!');
        writeln
        end;
      end;
    end
end.