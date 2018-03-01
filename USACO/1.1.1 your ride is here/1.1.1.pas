{
ID:id
PROG:ride
LANG:PASCAL
}
VAR s1,s2:string;
    n1,n2,i:longint;
BEGIN
assign(input,'ride.in');reset(input);
assign(output,'ride.out');rewrite(output);  
readln(s1);
  readln(s2);
  n1:=1;
  n2:=1;
  for i:=1 to length(s1) do
   n1:=n1*(ord(s1[i])-64);
  for i:=1 to length(s2) do
   n2:=n2*(ord(s2[i])-64);
  if (n1 mod 47)=(n2 mod 47) then writeln('GO')
   else writeln('STAY');
close(input);close(output)
END.