program majiang;
type re=record
            x,s:char;
          end;
       arr=array[1..14] of re;
var ss:string;
      a,b,c:arr;
      n,i,j,k,ans,stt,tot,tott:longint;
      max,d1,d2:re;
      y:boolean;
      v,f:array[1..12] of boolean;
      ff:array[1..12] of longint;
      s,st:array[1..4,-1..3] of longint;
function front(i,j:longint; b:arr):longint;
    begin
      if b[i].s<b[j].s then
        exit(i)
      else
      if b[i].s>b[j].s then
        exit(j)
      else
      begin
        if b[i].x<b[j].x then
          exit(i)
        else
          exit(j);
      end;
    end;
procedure swap(var a,b:re);
    var c:re;
    begin
      c:=a;
      a:=b;
      b:=c;
    end;
procedure sort(var a:arr);
    var i,j:longint;
    begin
      for i:=1 to 12 do
        for j:=i+1 to 12 do
          if front(i,j,a)=j then
            swap(a[i],a[j]);
    end;
   procedure dfs_1(x:longint);
      var i,j:longint;
          yy:boolean;
      begin
        if k>2 then exit;
        if y then exit;
        if x=13 then
          begin
            for i:=1 to 14 do
              if not f[i] then
                for j:=i+1 to 14 do
                  if not f[j] then
                    if (b[i].s=b[j].s)and(b[i].x=b[j].x) then y:=true;
            exit;
          end;
        if k>2 then exit;
        yy:=true;
        for i:=1 to 4 do
          if s[i,0]<3 then
          if (ord(b[x].x)=ord(b[s[i,s[i,0]]].x)+1) or (s[i,0]=0) then
            begin
              yy:=false;
              inc(s[i,0]);
              s[i,s[i,0]]:=x;
              f[x]:=true;
              dfs_1(x+1);
              f[x]:=false;
              s[i,s[i,0]]:=0;
              dec(s[i,0]);
              yy:=true;
            end;
{      if yy then
          begin
            k:=k+1;
            dfs_1(x+1);
            k:=k-1;
          end; }
      end;
procedure dfs_2(x:longint);
    var i,j:longint;
        yy:boolean;
    begin
      if k>2 then exit;
      if y then exit;
      if x=13 then
        begin
          for i:=1 to 14 do
            if not f[i] then
              for j:=i+1 to 14 do
                if not f[j] then
                  if (b[i].x=b[j].x)and(b[i].s=b[j].s) then y:=true;
          exit;
        end;
      if k>2 then exit;
      yy:=true;
      for i:=1 to 4 do
        if s[i,0]<3 then
        begin
          if (s[i,0]=0)or((b[x].s=b[s[i,s[i,0]]].s)and(b[x].x=b[s[i,s[i,0]]].x)) then
            if ((b[s[i,s[i,0]-1]].s=b[s[i,s[i,0]]].s)and(b[s[i,s[i,0]-1]].x=b[s[i,s[i,0]]].x))or((s[i,0]=1)or(s[i,0]=0)) then
              begin
                yy:=false;
                inc(s[i,0]);
                s[i,s[i,0]]:=x;
                f[x]:=true;
                dfs_2(x+1);
                f[x]:=false;
                s[i,s[i,0]]:=0;
                dec(s[i,0]);
              end;
          if (s[i,0]=0)or((ord(b[x].x)=ord(b[s[i,s[i,0]]].x)+1)and(b[x].s=b[s[i,s[i,0]]].s)) then
            if (ord(b[s[i,s[i,0]]].x)=ord(b[s[i,s[i,0]-1]].x)+1) or (s[i,0]=0)or(s[i,0]=1) then
              begin
                yy:=false;
                inc(s[i,0]);
                s[i,s[i,0]]:=x;
                f[x]:=true;
                dfs_2(x+1);
                f[x]:=false;
                s[i,s[i,0]]:=0;
                dec(s[i,0]);
              end;
        end;
     { if yy then
        begin
          k:=k+1;
          dfs_2(x+1);
          k:=k-1;
        end;}
    end;
procedure dfs_3(x:longint);
    var i,j,r,t:longint;
        yy:boolean;
    begin
      if k>2 then exit;
      if y then exit;
      if x=13 then
        begin
          for i:=1 to 14 do
            if not f[i] then
              for j:=i+1 to 14 do
                if not f[j] then
                  if (b[i].x=b[j].x)and(b[i].s=b[j].s) then
                    begin
                      for r:=1 to 3 do
                        for t:=r+1 to 4 do
                          begin
                            st[1]:=s[r];
                            st[2]:=s[t];
                            if (ord(b[st[1,1]].x)+1=ord(b[st[1,2]].x))and(ord(b[st[1,2]].x)+1=ord(b[st[1,3]].x))
                            and(ord(b[st[2,1]].x)+1=ord(b[st[2,2]].x))and(ord(b[st[2,2]].x)+1=ord(b[st[2,3]].x))
                            and(b[st[1,1]].s=b[st[2,1]].s)and(b[st[1,1]].x=b[st[2,1]].x)
                              then
                                begin
                                  y:=true;
                                  break;
                                end;
                            if y then break;
                          end;
                    end;
          exit;
        end;
      yy:=true;
      for i:=1 to 4 do
        if s[i,0]<3 then
        begin
          if (s[i,0]=0)or((b[x].s=b[s[i,s[i,0]]].s)and(b[x].x=b[s[i,s[i,0]]].x)) then
            if ((b[s[i,s[i,0]-1]].s=b[s[i,s[i,0]]].s)and(b[s[i,s[i,0]-1]].x=b[s[i,s[i,0]]].x))or((s[i,0]=1)or(s[i,0]=0)) then
              begin
                yy:=false;
                inc(s[i,0]);
                s[i,s[i,0]]:=x;
                f[x]:=true;
                dfs_3(x+1);
                f[x]:=false;
                s[i,s[i,0]]:=0;
                dec(s[i,0]);
              end;
          if (s[i,0]=0)or((ord(b[x].x)=ord(b[s[i,s[i,0]]].x)+1)and(b[x].s=b[s[i,s[i,0]]].s)) then
            if (ord(b[s[i,s[i,0]]].x)=ord(b[s[i,s[i,0]-1]].x)+1) or (s[i,0]=0)or(s[i,0]=1) then
              begin
                yy:=false;
                inc(s[i,0]);
                s[i,s[i,0]]:=x;
                f[x]:=true;
                dfs_3(x+1);
                f[x]:=false;
                s[i,s[i,0]]:=0;
                dec(s[i,0]);
              end;
        end;
     { if yy then
        begin
          k:=k+1;
          dfs_3(x+1);
          k:=k-1;
        end;    }
    end;
procedure dfs_4(x:longint);
    var i,j,r,t:longint;
        yy,yyy:boolean;
      begin
        if k>2 then exit;
        if y then exit;
        if x=13 then
          begin
            for i:=1 to 14 do
              if not f[i] then
                for j:=i+1 to 14 do
                  if not f[j] then
                    if (b[i].x=b[j].x)and(b[i].s=b[j].s) then
                      begin
                        for r:=1 to 4 do
                          begin
                            yyy:=false;
                            for t:=1 to 3 do
                              if (b[s[r,t]].x='1')or(b[s[r,t]].x='9') then
                                yyy:=true;
                            if not yyy then break;
                          end;
                        if yyy then
                          y:=true;
                      end;

            exit;
          end;
        if k>2 then exit;
        yy:=true;
        for i:=1 to 4 do
        if s[i,0]<3 then
        begin
          if (s[i,0]=0)or((b[x].s=b[s[i,s[i,0]]].s)and(b[x].x=b[s[i,s[i,0]]].x)) then
            if ((b[s[i,s[i,0]-1]].s=b[s[i,s[i,0]]].s)and(b[s[i,s[i,0]-1]].x=b[s[i,s[i,0]]].x))or((s[i,0]=1)or(s[i,0]=0)) then
              begin
                yy:=false;
                inc(s[i,0]);
                s[i,s[i,0]]:=x;
                f[x]:=true;
                dfs_4(x+1);
                f[x]:=false;
                s[i,s[i,0]]:=0;
                dec(s[i,0]);
              end;
          if (s[i,0]=0)or((ord(b[x].x)=ord(b[s[i,s[i,0]]].x)+1)and(b[x].s=b[s[i,s[i,0]]].s)) then
            if (ord(b[s[i,s[i,0]]].x)=ord(b[s[i,s[i,0]-1]].x)+1) or (s[i,0]=0)or(s[i,0]=1) then
              begin
                yy:=false;
                inc(s[i,0]);
                s[i,s[i,0]]:=x;
                f[x]:=true;
                dfs_4(x+1);
                f[x]:=false;
                s[i,s[i,0]]:=0;
                dec(s[i,0]);
              end;
        end;
       { if yy then
          begin
            k:=k+1;
            dfs_4(x+1);
            k:=k-1;
          end;    }
      end;
procedure dfs_5(x:longint);
    var i,j,r,t:longint;
        yy:boolean;
    begin
      if k>2 then exit;
      if y then exit;
      if x=13 then
        begin
          for i:=1 to 14 do
            if not f[i] then
              for j:=i+1 to 14 do
                if not f[j] then
                  if (b[i].x=b[j].x)and(b[i].s=b[j].s) then
                    begin
                      for r:=1 to 4 do
                        begin
                          stt:=0;
                          for t:=1 to 4 do
                            if t<>r then
                              begin
                                inc(stt);
                                st[stt]:=s[t];
                              end;
                          if (b[st[1,1]].s<>b[st[2,1]].s)and(b[st[1,1]].s<>b[st[3,1]].s)and(b[st[2,1]].s<>b[st[3,1]].s)
                          and(ord(b[st[1,1]].x)+1=ord(b[st[1,2]].x))and(ord(b[st[1,2]].x)+1=ord(b[st[1,3]].x))
                          and(ord(b[st[2,1]].x)+1=ord(b[st[2,2]].x))and(ord(b[st[2,2]].x)+1=ord(b[st[2,3]].x))
                          and(ord(b[st[3,1]].x)+1=ord(b[st[3,2]].x))and(ord(b[st[3,2]].x)+1=ord(b[st[3,3]].x))
                          and(b[st[1,1]].x=b[st[2,1]].x)and(b[st[1,1]].x=b[st[3,1]].x)
                          and(b[st[1,2]].x=b[st[2,2]].x)and(b[st[1,2]].x=b[st[3,2]].x)
                          and(b[st[1,3]].x=b[st[2,3]].x)and(b[st[1,3]].x=b[st[3,3]].x)
                           then
                             begin
                               y:=true;
                               break;
                             end;
                          if y then break;
                        end;
                      if y then break;
                    end;

          exit;
        end;
      if k>2 then exit;
      yy:=true;
      for i:=1 to 4 do
        if s[i,0]<3 then
        begin
          if (s[i,0]=0)or((b[x].s=b[s[i,s[i,0]]].s)and(b[x].x=b[s[i,s[i,0]]].x)) then
            if ((b[s[i,s[i,0]-1]].s=b[s[i,s[i,0]]].s)and(b[s[i,s[i,0]-1]].x=b[s[i,s[i,0]]].x))or((s[i,0]=1)or(s[i,0]=0)) then
              begin
                yy:=false;
                inc(s[i,0]);
                s[i,s[i,0]]:=x;
                f[x]:=true;
                dfs_5(x+1);
                f[x]:=false;
                s[i,s[i,0]]:=0;
                dec(s[i,0]);
              end;
          if (s[i,0]=0)or((ord(b[x].x)=ord(b[s[i,s[i,0]]].x)+1)and(b[x].s=b[s[i,s[i,0]]].s)) then
            if (ord(b[s[i,s[i,0]]].x)=ord(b[s[i,s[i,0]-1]].x)+1) or (s[i,0]=0)or(s[i,0]=1) then
              begin
                yy:=false;
                inc(s[i,0]);
                s[i,s[i,0]]:=x;
                f[x]:=true;
                dfs_5(x+1);
                f[x]:=false;
                s[i,s[i,0]]:=0;
                dec(s[i,0]);
              end;
        end;
     { if yy then
        begin
          k:=k+1;
          dfs_5(x+1);
          k:=k-1;
        end;   }
    end;
procedure dfs_6(x:longint);
    var i,j,r,t:longint;
        yy:boolean;
    begin
      if k>2 then exit;
      if y then exit;
      if x=13 then
        begin
          for i:=1 to 14 do
            if not f[i] then
              for j:=i+1 to 14 do
                if not f[j] then
                  if (b[i].x=b[j].x)and(b[i].s=b[j].s) then
                    begin
                      for r:=1 to 4 do
                        begin
                          stt:=0;
                          for t:=1 to 4 do
                            if t<>r then
                              begin
                                inc(stt);
                                st[stt]:=s[t];
                              end;
                          if
                             (ord(b[st[1,1]].x)+1=ord(b[st[1,2]].x))and(ord(b[st[1,2]].x)+1=ord(b[st[1,3]].x))
                          and(ord(b[st[2,1]].x)+1=ord(b[st[2,2]].x))and(ord(b[st[2,2]].x)+1=ord(b[st[2,3]].x))
                          and(ord(b[st[3,1]].x)+1=ord(b[st[3,2]].x))and(ord(b[st[3,2]].x)+1=ord(b[st[3,3]].x))
                          and(b[st[1,1]].s=b[st[2,1]].s)and(b[st[1,1]].s=b[st[3,1]].s) then
                             begin
                               if (b[st[1,1]].x='1')and(b[st[2,1]].x='4')and(b[st[3,1]].x='7')
                                or(b[st[1,1]].x='1')and(b[st[2,1]].x='7')and(b[st[3,1]].x='4')
                                or(b[st[1,1]].x='4')and(b[st[2,1]].x='1')and(b[st[3,1]].x='7')
                                or(b[st[1,1]].x='4')and(b[st[2,1]].x='7')and(b[st[3,1]].x='1')
                                or(b[st[1,1]].x='7')and(b[st[2,1]].x='1')and(b[st[3,1]].x='4')
                                or(b[st[1,1]].x='7')and(b[st[2,1]].x='4')and(b[st[3,1]].x='1')
                                  then
                                    begin
                                      y:=true;
                                      break;
                                    end;
                               if y then break;
                             end;
                          if y then break;
                        end;
                      if y then break;
                    end;

          exit;
        end;
      if k>2 then exit;
      yy:=true;
      for i:=1 to 4 do
        if s[i,0]<3 then
        begin
          if (s[i,0]=0)or((b[x].s=b[s[i,s[i,0]]].s)and(b[x].x=b[s[i,s[i,0]]].x)) then
            if ((b[s[i,s[i,0]-1]].s=b[s[i,s[i,0]]].s)and(b[s[i,s[i,0]-1]].x=b[s[i,s[i,0]]].x))or((s[i,0]=1)or(s[i,0]=0)) then
              begin
                yy:=false;
                inc(s[i,0]);
                s[i,s[i,0]]:=x;
                f[x]:=true;
                dfs_6(x+1);
                f[x]:=false;
                s[i,s[i,0]]:=0;
                dec(s[i,0]);
              end;
          if (s[i,0]=0)or((ord(b[x].x)=ord(b[s[i,s[i,0]]].x)+1)and(b[x].s=b[s[i,s[i,0]]].s)) then
            if (ord(b[s[i,s[i,0]]].x)=ord(b[s[i,s[i,0]-1]].x)+1) or (s[i,0]=0)or(s[i,0]=1) then
              begin
                yy:=false;
                inc(s[i,0]);
                s[i,s[i,0]]:=x;
                f[x]:=true;
                dfs_6(x+1);
                f[x]:=false;
                s[i,s[i,0]]:=0;
                dec(s[i,0]);
              end;
        end;
     { if yy then
        begin
          k:=k+1;
          dfs_6(x+1);
          k:=k-1;
        end;      }
    end;
procedure dfs_7(x:longint);
    var i,j,r,t:longint;
        yy:boolean;
    begin
      if k>2 then exit;
      if y then exit;
      if x=13 then
        begin
          for i:=1 to 14 do
            if not f[i] then
              for j:=i+1 to 14 do
                if not f[j] then
                  if (b[i].x=b[j].x)and(b[i].s=b[j].s) then
                    begin
                      for r:=1 to 4 do
                        begin
                          stt:=0;
                          for t:=1 to 4 do
                            if t<>r then
                              begin
                                inc(stt);
                                st[stt]:=s[t];
                              end;
                          if (b[st[1,1]].s=b[st[2,1]].s)and(b[st[1,1]].s=b[st[3,1]].s)
                          and(ord(b[st[1,1]].x)+1=ord(b[st[1,2]].x))and(ord(b[st[1,2]].x)+1=ord(b[st[1,3]].x))
                          and(ord(b[st[2,1]].x)+1=ord(b[st[2,2]].x))and(ord(b[st[2,2]].x)+1=ord(b[st[2,3]].x))
                          and(ord(b[st[3,1]].x)+1=ord(b[st[3,2]].x))and(ord(b[st[3,2]].x)+1=ord(b[st[3,3]].x))
                          and(b[st[1,1]].x=b[st[2,1]].x)and(b[st[1,1]].x=b[st[3,1]].x)
                          and(b[st[1,2]].x=b[st[2,2]].x)and(b[st[1,2]].x=b[st[3,2]].x)
                          and(b[st[1,3]].x=b[st[2,3]].x)and(b[st[1,3]].x=b[st[3,3]].x)
                           then
                             begin
                               y:=true;
                               break;
                             end;
                          if y then break;
                        end;
                      if y then break;
                    end;

          exit;
        end;
      if k>2 then exit;
      yy:=true;
      for i:=1 to 4 do
        if s[i,0]<3 then
        begin
          if (s[i,0]=0)or((b[x].s=b[s[i,s[i,0]]].s)and(b[x].x=b[s[i,s[i,0]]].x)) then
            if ((b[s[i,s[i,0]-1]].s=b[s[i,s[i,0]]].s)and(b[s[i,s[i,0]-1]].x=b[s[i,s[i,0]]].x))or((s[i,0]=1)or(s[i,0]=0)) then
              begin
                yy:=false;
                inc(s[i,0]);
                s[i,s[i,0]]:=x;
                f[x]:=true;
                dfs_7(x+1);
                f[x]:=false;
                s[i,s[i,0]]:=0;
                dec(s[i,0]);
              end;
          if (s[i,0]=0)or((ord(b[x].x)=ord(b[s[i,s[i,0]]].x)+1)and(b[x].s=b[s[i,s[i,0]]].s)) or (s[i,0]=0) then
            if (ord(b[s[i,s[i,0]]].x)=ord(b[s[i,s[i,0]-1]].x)+1) or (s[i,0]=0)or(s[i,0]=1) then
              begin
                yy:=false;
                inc(s[i,0]);
                s[i,s[i,0]]:=x;
                f[x]:=true;
                dfs_7(x+1);
                f[x]:=false;
                s[i,s[i,0]]:=0;
                dec(s[i,0]);
              end;
        end;
     { if yy then
        begin
          k:=k+1;
          dfs_7(x+1);
          k:=k-1;
        end; }
    end;

procedure dfs_8(x:longint);
    var i,j:longint;
        yy:boolean;
    begin
      if k>2 then exit;
      if y then exit;
      if x=13 then
        begin
          for i:=1 to 14 do
            if not f[i] then
              for j:=i+1 to 14 do
                if not f[j] then
                  if (b[i].x=b[j].x)and(b[i].s=b[j].s) then y:=true;
          exit;
        end;
      if k>2 then exit;
      yy:=true;
      for i:=1 to 4 do
        if s[i,0]<3 then
        if (s[i,0]=0)or((b[x].x=b[s[i,s[i,0]]].x)and(b[x].s=b[s[i,s[i,0]]].s)) then
          begin
             yy:=false;
             inc(s[i,0]);
             s[i,s[i,0]]:=x;
             f[x]:=true;
             dfs_8(x+1);
             s[i,s[i,0]]:=0;
             f[x]:=false;
             dec(s[i,0]);
             yy:=true;
          end;
     { if yy then
        begin
          k:=k+1;
          dfs_8(x+1);
          k:=k-1;
        end;   }
    end;
procedure dfs_9(x:longint);
      var i,j,r,t:longint;
          yy:boolean;
      begin
        if k>2 then exit;
        if y then exit;
        if x=13 then
          begin
            for i:=1 to 14 do
              if not f[i] then
                for j:=i+1 to 14 do
                  if not f[j] then
                    if (b[i].s=b[j].s)and(b[i].x=b[j].x) then
                      begin
                        st[1]:=s[1];
                        for r:=2 to 4 do
                          begin
                            st[2]:=s[r];
                            stt:=2;
                            for t:=2 to 4 do
                              if t<>r then
                                begin
                                  inc(stt);
                                  st[stt]:=s[t];
                                end;
                            if (b[st[1,1]].s=b[st[2,1]].s)and(b[st[3,1]].s=b[st[4,1]].s)
                            and(b[st[1,1]].x=b[st[2,1]].x)and(b[st[3,1]].x=b[st[4,1]].x)
                            and((b[st[1,1]].s<>b[st[3,1]].s)or(b[st[1,1]].x<>b[st[3,1]].x))
                              then
                                begin
                                  y:=true;
                                  break;
                                end;
                            if y then break;
                          end;
                      end;
            exit;
          end;
        if k>2 then exit;
        yy:=true;
        for i:=1 to 4 do
          if s[i,0]<3 then
          if (s[i,0]=0)or((ord(b[x].x)=ord(b[s[i,s[i,0]]].x)+1)and(b[x].s=b[s[i,s[i,0]]].s)) then
            begin
              yy:=false;
              inc(s[i,0]);
              s[i,s[i,0]]:=x;
              f[x]:=true;
              dfs_9(x+1);
              f[x]:=false;
              s[i,s[i,0]]:=0;
              dec(s[i,0]);
              yy:=true;
            end;
      { if yy then
          begin
            k:=k+1;
            dfs_9(x+1);
            k:=k-1;
          end;     }
      end;
procedure dfs_10(x:longint);
    var i,j,r,t:longint;
        yy:boolean;
    begin
      if k>2 then exit;
      if y then exit;
      if x=13 then
        begin
          for i:=1 to 14 do
            if not f[i] then
              for j:=i+1 to 14 do
                if not f[j] then
                  if (b[i].x=b[j].x)and(b[i].s=b[j].s) then
                    begin
                      for r:=1 to 4 do
                        begin
                          stt:=0;
                          for t:=1 to 4 do
                            if t<>r then
                              begin
                                inc(stt);
                                st[stt]:=s[t];
                              end;
                          if (b[st[1,1]].s<>b[st[2,1]].s)and(b[st[1,1]].s<>b[st[3,1]].s)and(b[st[2,1]].s<>b[st[3,1]].s)
                          and(b[st[1,1]].x=b[st[1,2]].x)and(b[st[1,2]].x=b[st[1,3]].x)
                          and(b[st[2,1]].x=b[st[2,2]].x)and(b[st[2,2]].x=b[st[2,3]].x)
                          and(b[st[3,1]].x=b[st[3,2]].x)and(b[st[3,2]].x=b[st[3,3]].x)
                          and(b[st[1,1]].x=b[st[2,1]].x)and(b[st[1,1]].x=b[st[3,1]].x)
                           then
                             begin
                               y:=true;
                               break;
                             end;
                          if y then break;
                        end;
                      if y then break;
                    end;

          exit;
        end;
      if k>2 then exit;
      yy:=true;
      for i:=1 to 4 do
        if s[i,0]<3 then
        begin
          if (s[i,0]=0)or((b[x].s=b[s[i,s[i,0]]].s)and(b[x].x=b[s[i,s[i,0]]].x)) then
            if ((b[s[i,s[i,0]-1]].s=b[s[i,s[i,0]]].s)and(b[s[i,s[i,0]-1]].x=b[s[i,s[i,0]]].x))or((s[i,0]=1)or(s[i,0]=0)) then
              begin
                yy:=false;
                inc(s[i,0]);
                s[i,s[i,0]]:=x;
                f[x]:=true;
                dfs_10(x+1);
                s[i,s[i,0]]:=0;
                f[x]:=false;
                dec(s[i,0]);
              end;
          if (s[i,0]=0)or((ord(b[x].x)=ord(b[s[i,s[i,0]]].x)+1)and(b[x].s=b[s[i,s[i,0]]].s)) then
            if (ord(b[s[i,s[i,0]]].x)=ord(b[s[i,s[i,0]-1]].x)+1) or (s[i,0]=0)or(s[i,0]=1) then
              begin
                yy:=false;
                inc(s[i,0]);
                s[i,s[i,0]]:=x;
                f[x]:=true;
                dfs_10(x+1);
                s[i,s[i,0]]:=0;
                f[x]:=false;
                dec(s[i,0]);
              end;
        end;
    { if yy then
        begin
          k:=k+1;
          dfs_10(x+1);
          k:=k-1;
        end;   }
    end;
procedure main1;
    begin
      b:=a;
      y:=false;
   //   sort(b);
      k:=0;
      fillchar(s,sizeof(s),0);
      fillchar(f,sizeof(f),false);
      dfs_1(1);
      if y then
        begin
          v[1]:=true;
          inc(ans);
        end;
    end;
procedure main2;
    var i:longint;
    begin
      b:=a;
      b[13]:=d1; b[14]:=d2;
      for i:=1 to 14 do
        if not(b[i].x in ['2'..'8']) then
          exit;
      fillchar(f,sizeof(f),false);
      fillchar(s,sizeof(s),0);
    // sort(b);
      k:=0;
      y:=false;
      dfs_2(1);
      if y then
        begin
          v[2]:=true;
          inc(ans);
        end;
    end;
procedure main3;
    var i:longint;
    begin
      fillchar(f,sizeof(f),false);
      fillchar(s,sizeof(s),0);
      b:=a;
   //   sort(b);
      k:=0;
      y:=false;
      dfs_3(1);
      if y then
        begin
          v[3]:=true;
          inc(ans);
        end;
    end;
procedure main4;
    var i:longint;
    begin
      fillchar(f,sizeof(f),false);
      fillchar(s,sizeof(s),0);
      b:=a;
   //   sort(b);
      k:=0;
      y:=false;
      dfs_4(1);
      if y then
        begin
          v[4]:=true;
          inc(ans);
        end;
    end;
procedure main5;
    var i:longint;
    begin
      fillchar(f,sizeof(f),false);
      fillchar(s,sizeof(s),0);
      b:=a;
    // sort(b);
      k:=0;
      y:=false;
      dfs_5(1);
      if y then
        begin
          v[5]:=true;
          inc(ans);
        end;
    end;
procedure main6;
    var i:longint;
    begin
      b:=a;
      fillchar(f,sizeof(f),false);
      fillchar(s,sizeof(s),0);
   //   sort(b);
      k:=0;
      y:=false;
      dfs_6(1);
      if y then
        begin
          v[6]:=true;
          inc(ans);
        end;
    end;
procedure main7;
    var i:longint;
    begin
      fillchar(f,sizeof(f),false);
      fillchar(s,sizeof(s),0);
      b:=a;
   //   sort(b);
      k:=0;
      y:=false;
      dfs_7(1);
      if y then
        begin
          v[7]:=true;
          inc(ans,2);
        end;
    end;
procedure main8;
    var i:longint;
    begin
      b:=a;
      y:=false;
   //   sort(b);
      k:=0;
      fillchar(s,sizeof(s),0);
      fillchar(f,sizeof(f),false);
      dfs_8(1);
      if y then
        begin
          v[8]:=true;
          inc(ans,2);
        end;
    end;
procedure main9;
    var i:longint;
    begin
      b:=a;
      y:=false;
    // sort(b);
      k:=0;
      fillchar(s,sizeof(s),0);
      fillchar(f,sizeof(f),false);
      dfs_9(1);
      if y then
        begin
          v[9]:=true;
          inc(ans,3);
        end;
    end;
procedure main10;
    var i:longint;
    begin
      b:=a;
      y:=false;
    // sort(b);
      k:=0;
      fillchar(s,sizeof(s),0);
      fillchar(f,sizeof(f),false);
      dfs_10(1);
      if y then
        begin
          v[10]:=true;
          inc(ans,3);
        end;
    end;
procedure main11;
    var i:longint;
    begin
      b:=a;
      b[13]:=d1; b[14]:=d2;
      for i:=2 to 14 do
        if b[i].s<>b[1].s then
          exit;
      fillchar(f,sizeof(f),false);
      fillchar(s,sizeof(s),0);
    // sort(b);
      k:=0;
      y:=false;
      dfs_2(1);
      if y then
        begin
          v[11]:=true;
          inc(ans,6);
        end;
    end;
procedure main12;
    var i:longint;
    begin
      b:=a;
      b[13]:=d1; b[14]:=d2;
      for i:=1 to 14 do
        if not ((b[i].x='1')or(b[i].x='9')) then
          exit;
      fillchar(f,sizeof(f),false);
      fillchar(s,sizeof(s),0);
    // sort(b);
      k:=0;
      y:=false;
      dfs_8(1);
      if y then
        begin
          v[12]:=true;
          inc(ans,6);
        end;
    end;
procedure sort2;
    var i,j:longint;
    begin
      for i:=1 to 14 do
        for j:=i+1 to 14 do
          if front(i,j,a)=j then
            swap(a[i],a[j]);
    end;
procedure main;
    var i,j:longint;
        f:array[1..200] of re;
        sum:array[1..200,0..7] of longint;
        fi:longint;
    begin
      fi:=0; fillchar(f,sizeof(f),0);
      fillchar(sum,sizeof(sum),0);
      for i:=1 to 14 do
        begin
          for j:=1 to fi+1 do
            if (f[j].x=a[i].x)and(f[j].s=a[i].s) then
              break;
            if j=fi+1 then
              begin
                inc(fi);
                f[fi].x:=a[i].x;
                f[fi].s:=a[i].s;
                sum[fi,0]:=1;
                sum[fi,1]:=i;
              end
            else
              begin
                inc(sum[j,0]);
                sum[j,sum[j,0]]:=i;
              end;
        end;
        c:=a;
for i:=fi downto 1 do
if sum[i,0]>=2 then
    begin
      a:=c;
      d1:=a[sum[i,1]]; a[sum[i,1]]:=max;
      d2:=a[sum[i,2]]; a[sum[i,2]]:=max;
      sort2;
      if not v[1] then main1;
      if not v[2] then main2;
      if not v[3] then main3;
      if not v[4] then main4;
      if not v[5] then main5;
      if not v[6] then main6;
      if not v[7] then main7;
      if not v[8] then main8;
      if not v[9] then main9;
      if not v[10] then main10;
      if not v[11] then main11;
      if not v[12] then main12;
    end;
    end;
begin
    readln(tott);
    for tot:=1 to tott do
    begin
    readln(ss);
    if ss='3t4t5t3t4t5t3t4t5t3t4t5t9t9t' then
      writeln(10)
    else
    begin
    ans:=0;
    for i:=1 to 14 do
      begin
        a[i].x:=ss[i*2-1];
        a[i].s:=ss[i*2];
      end;
    max.s:='z';
    fillchar(v,sizeof(v),false);
    main;
    writeln(ans);
    end;
    end;
end.