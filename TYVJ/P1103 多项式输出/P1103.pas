var n,a,i:longint;
begin
 readln(n);
 for i:=n downto 0 do
  begin
   read(a);
   if a=0 then continue
   else if abs(a)=1 then
         begin
          if (a>0) and (i<>n) then write('+')
          else if (a<0) then write('-');
          a:=abs(a);
          if i=0 then write(a)
          else if i=1 then write('x')
               else write('x^',i);
         end
        else if (i=n) then
              write(a,'x^',i)
             else if i=0 then
                   begin
                    if a>0 then write('+');
                    write(a);
                   end
                  else if i=1 then
                        begin
                         if a>0 then write('+');
                         write(a,'x');
                        end
                       else
                        begin
                         if a>0 then write('+');
                         write(a,'x^',i);
                        end;
  end;
 writeln;
end.