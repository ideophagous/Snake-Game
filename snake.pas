uses crt;
var ch:char;
var x,y,sx,sy,i,dir,key,size,r,count,time:integer;
var xtab:array[0..99] of integer;
var ytab:array[0..99] of integer;
var mat,kla:boolean;
const GRID_SIZE_X = 40;
const GRID_SIZE_Y = 20;

procedure advance_7nch();
BEGIN
        gotoxy(xtab[size-1],ytab[size-1]);
        write(' ');
        for i:=size-1 downto 1 do
        BEGIN
                xtab[i]:=xtab[i-1];
                ytab[i]:=ytab[i-1];
        END;
        xtab[0]:=x;
        ytab[0]:=y;
END;

procedure grow_7nch();
BEGIN
        if(dir<>1) then
        BEGIN
                xtab[size]:=xtab[size-1]+1;
                ytab[size]:=ytab[size-1];
        END
        else
        BEGIN
                xtab[size]:=xtab[size-1]-1;
                ytab[size]:=ytab[size-1];
        END;
        size:=size+1;
END;

procedure print_7nch();
BEGIN
        gotoxy(xtab[0],ytab[0]);
        case dir of
        0: write('Ê');
        1: write('¹');
        2: write('Ë');
        3: write('Ì');

        End;


        for i:=1 to size-1 do
        BEGIN
                gotoxy(xtab[i],ytab[i]);
                write('Û');
        END;
END;

procedure zda7();
BEGIN
        for i:=1 to size-1 do
        BEGIN
                {si le serpent se heurte a lui-meme}
                if((xtab[i]=xtab[0]) and (ytab[i]=ytab[0])) then mat:=True;

                {si le serpent heurte les parois}
                if((xtab[0]=1) or (xtab[0]=42) or (ytab[0]=1) or (ytab[0]=22)) then mat:=True;

        END;
END;

procedure boita();
BEGIN
        gotoxy(1,1);
        write('É');
        for i:=0 to 39 do write('Í');
        write('»');
        gotoxy(1,2);
        for i:=0 to 19 do writeln('º');
        write('È');
        gotoxy(42,2);
        for i:=0 to 19 do
        BEGIN
        gotoxy(42,i+2);
        writeln('º');
        end;
        gotoxy(42,22);
        write('¼');
        gotoxy(2,22);
        for i:=0 to 39 do write('Í');
END;

procedure initialize_7nch(s:integer);
BEGIN
        size:=s;
        for i:=0 to size-1 do
        BEGIN
                xtab[i]:=x-i;
                ytab[i]:=y;
        END;
END;

function is_in():boolean;
BEGIN
        is_in:=False;
        for i:=0 to size-1 do
        BEGIN
                if((sx=xtab[i]) and (sy=ytab[i])) then is_in:=True;
        END;

END;

procedure makla();
BEGIN
       repeat
          sx:=random(GRID_SIZE_X-1)+2;
          sy:=random(GRID_SIZE_Y-1)+2;
       until(not is_in());
       gotoxy(sx,sy);
       write('o');
END;

BEGIN
clrscr;
dir:=1;
kla:=False;
cursoroff;
boita();
time:=500;
randomize();
x:=random(GRID_SIZE_X-5)+5;
y:=random(GRID_SIZE_Y-5)+5;
sx:=random(GRID_SIZE_X-1)+2;
sy:=random(GRID_SIZE_Y-1)+2;
mat:=False;
initialize_7nch(4);
gotoxy(sx,sy);
write('o');
count:=0;
r:=random(6);
while(True) do
BEGIN

        if(keypressed) then
        BEGIN
                ch:=readkey;
                if(ord(ch)=0) then
                BEGIN
                    key:=ord(readkey);
                    case key of
                    75: dir:=3;
                    77: dir:=1;
                    72: dir:=2;
                    80: dir:=0;
                    END;
                END
                else
                BEGIN
                        break;
                END;

        END
        else
        BEGIN
                case dir of
                0: y:=y+1;
                1: x:=x+1;
                2: y:=y-1;
                3: x:=x-1;
                END;
                if((x=sx) and (y=sy)) then
                BEGIN
                sound(200);
                grow_7nch();
                kla:=True;



                END;
                if((r=count mod 6) and kla) then
                BEGIN
                        makla();
                        r:=random(6);
                        kla:=False
                END;
                {tester les cas de Game Over}
                if(not mat) then zda7();
                if(mat) then
                BEGIN
                    gotoxy(2,2);
                    write('Game Over!');
                    break;
                END;

                advance_7nch();
                print_7nch();
                if(size=100) then
                BEGIN
                    gotoxy(2,2);
                    write('You Win!');
                    break;

                END;
                if(size<50) then time:=400-(size-4)*10;
                delay(time);
                count:=count+1;
                nosound();

                {gotoxy(1,1);
                write(count);}
        END;
END;


readln();
END.