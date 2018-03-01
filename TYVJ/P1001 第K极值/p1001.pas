var a:array[1..10000]of longint;
    n,k,i:integer;
PROCEDURE QSORT(ST,ED:LONGINT);
        VAR temp,I,J,K:LONGINT;
        BEGIN
                IF ST>=ED THEN EXIT;
                TEMP:=A[RANDOM(ED-ST+1)+ST];
                I:=ST-1;
                J:=ED+1;
                WHILE I<J DO
                BEGIN
                        REPEAT INC(I) UNTIL A[I]>=TEMP;
                        REPEAT DEC(J) UNTIL A[J]<=TEMP;
                        IF I<J THEN
                        BEGIN
                                K:=A[I];
                                A[I]:=A[J];
                                A[J]:=K;
                        END;
                END;
                QSORT(ST,J);
                QSORT(J+1,ED);
        END;
function q(s:longint):string;
var j:longint;
begin
  if s=1 then exit('NO');
  if s=2 then exit('YES');
  for j:=2 to round(sqrt(s)) do
    if s mod j =0 then exit('NO');
  exit('YES')
end;

BEGIN
   readln(n,k);
   for i:=1 to n do
    read(a[i]);
   readln;
   qsort(1,n);
   writeln(q(abs(a[n-k+1]-a[k])));
   writeln(a[n-k+1]-a[k])
END.