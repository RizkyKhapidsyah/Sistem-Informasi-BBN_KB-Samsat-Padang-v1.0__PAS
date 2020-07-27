{$m, $8000,0,0;}
{$N+,V-}
Uses Crt,Dos,Printer,File1;
Const
        Utama  : array[1..5] of string [15] =
                                            (
                                            ' Entri Data    ',
                                            ' Koreksi Data  ',
                                            ' Hapus   Data  ',
                                            ' Informasi     ',
                                            ' Selesai       ');
        messu : array[1..5] of string =     (
                                            ' Sub Menu Entry Data             ',
                                            ' Sub Menu Koreksi Data           ',
                                            ' Sub Menu Hapus   Data           ',
                                            ' Sub Menu Menampilkan Informasi  ',
                                            ' Kembali Ke Dos Prompt A:\>       ');
        Menu1   : array[1..5] of string [30] =
                                             (
                                             ' Entry Data Pemohon BBN-KB ',
                                             ' Entry Data Kendaraan      ',
                                             ' Entry Data BBN-KB         ',
                                             ' Entry Data Biaya BBN-KB   ',
                                             ' Exit To Main Menu         ');
        mess1 : array[1..5] of string =     (
                                             ' Proses Entry Data Pemohon    ',
                                             ' Proses Entry Data Kendaraan',
                                             ' Proses Entry Data BBN-KB',
                                             ' Proses Entry Data Biaya BBN-KB',
                                             ' Kembali Ke Menu Utama');
        Menu2   : array[1..5] of string [29] =
                                             (
                                             ' Koreksi Data Pemohon BBN ',
                                             ' Koreksi Data Kendaraan   ',
                                             ' Koreksi Data BBN-KB      ',
                                             ' Koreksi Data Biaya BBN   ',
                                             ' Exit To Main Menu        ');
        mess2 : array[1..5] of string =     (
                                             ' Proses Koreksi Data Pemohon BBN ',
                                             ' Proses Koreksi Data Kendaraan   ',
                                             ' Proses Koreksi Data BBN-KB      ',
                                             ' Proses Koreksi Data Biaya BBN   ',
                                             ' Menu Utama                             ');
        Menu2a  : array[1..5] of string [29] =
                                             (
                                             ' Hapus   Data Pemohon BBN ',
                                             ' Hapus   Data Kendaraan   ',
                                             ' Hapus   Data BBN-KB      ',
                                             ' Hapus   Data Biaya BBN   ',
                                             ' Exit To Main Menu        ');
        mess2a: array[1..5] of string =     (
                                             ' Proses Hapus   Data Pemohon BBN ',
                                             ' Proses Hapus   Data Kendaraan   ',
                                             ' Proses Hapus   Data BBN-KB      ',
                                             ' Proses Hapus   Data Biaya BBN   ',
                                             ' Menu Utama                             ');
        Menu3   : array[1..6] of string [35] =
                                             (
                                             ' Informasi Data Pemohon BBN-KB     ',
                                             ' Informasi Data Kendaraan          ',
                                             ' Informasi Data BBN-KB             ',
                                             ' Informasi Data Biaya BBN-KB       ',
                                             ' Informasi Data Rekapitulasi BBN-KB',
                                             ' Ke Menu Utama                     ');
        MESS3   : array[1..6] of string [35] =
                                             (
                                             ' Laporan Data Pemohon BBN-KB     ',
                                             ' Laporan Data Kendaraan          ',
                                             ' Laporan Data BBN-KB             ',
                                             ' Laporan Data Biaya BBN-KB       ',
                                             ' Laporan Data Rekapitulasi BBN-KB',
                                             ' Ke Menu Utama                     ');
        bulan :  array[1..12] of  String  =
                                             (
                                             'Januari','Februari','Maret','April','Mei',
                                             'Juni','Juli','Agustus','September',
                                             'Oktober','November','Desember');
       days  :  array[0..6] of string[9] =
                                             ('Minggu','Senin','Selasa','Rabu',
                                             'Kamis','Jumat','Sabtu');
        warna   :array[1..5] of integer  = (blue,yellow,red,green,magenta);

Var
    pil,Ch           : char;
    kol,bar          : byte;
    i,j,Gd,Gm,k,l,m,n: integer;
    d1,d2,d3,d4      : word;
    Buffer1          : array[1..4000] of byte;
    Buffer2          : array[1..4000] of byte;
    Buffer3          : array[1..4000] of byte;
    programname,
    cmdline          : string;
    flst             : text;
    Berkas           : File;
    reg              : registers;
    Jumpa : Boolean;
procedure Kotak (Tbox, x1, y1, x2, y2, a, b, c : byte;
                 Stat : boolean; kal : string);
const
      KiriAtas   : String[ 2] = 'ÉÚ';
      KananAtas  : String[ 2] = '»¿';
      KananBawah : String[ 2] = '¼Ù';
      KiriBawah  : String[ 2] = 'ÈÀ';
      Atas       : String[ 2] = 'ÍÄ';
      Kanan      : String[ 2] = 'º³';
      Bawah      : String[ 2] = 'ÍÄ';
      Kiri       : String[ 2] = 'º³';

Var
  Bar, Kol, Les : byte;
begin
  if Stat = True then begin
     TextbackGround (a);
     for Les := x1 to x2 do
     begin
        gotoxy (Les,y1-1); write (' ');
     end;
     TextColor (c);
     gotoxy (x1+4,y1-1); write (kal);
  end;
  TextBackGround (b);
  TextColor      (c);
  window (x1, y1, x2, y2);
  ClrScr;
  window (1, 1, 80, 25);
  Bar := 0; Kol := 0;
  for Kol := x1+1 to x2-1 do
  begin
    gotoxy (Kol,y1); write (Atas [ Tbox]);
    gotoxy (Kol,y2); write (Bawah[ Tbox]);
  end;
  for Bar := y1+1 to y2-1 do
  begin

    gotoxy (x1, Bar); write (Kiri [ Tbox]);
    gotoxy (x2, Bar); write (Kanan[ Tbox]);
  end;
  gotoxy (x1, y1); write (KiriAtas   [ Tbox]);
  gotoxy (x2, y1); write (KananAtas  [ Tbox]);
  gotoxy (x1, y2); write (KiriBawah  [ Tbox]);
  gotoxy (x2, y2); write (KananBawah [ Tbox]);
end;
Procedure EMohon;
{$I Mohon.Pas}
Procedure EKend;
{$I Kend.Pas}
Procedure EBBN;
{$I BBN-KB.Pas}
Procedure EBiaya;
{$I Biaya.Pas}
Procedure KMohon;
{$I KMohon.Pas}
Procedure KKend;
{$I KKend.Pas}
Procedure KBBN;
{$I KBBN-KB.Pas}
Procedure KBiaya;
{$I KBiaya.Pas}
Procedure HMohon;
{$I HMohon.Pas}
Procedure HKend;
{$I HKend.Pas}
Procedure HBBN;
{$I HBBN-KB.Pas}
Procedure HBiaya;
{$I HBiaya.Pas}
Procedure InMohon;
{$I IMohon.Pas}
Procedure InKend;
{$I IKend.Pas}
Procedure InRekap;
{$I IRekap.Pas}
Procedure InBBN;
{$I IBBN-KB.Pas}
Procedure InBiaya;
{$I IBiaya.Pas}
Procedure Pesan1;
Begin
 Exec(ProgramName, CmdLine);
 SwapVectors;Close(Berkas);
End;
Procedure Pesan2;
Begin
 Kotak(2,21,9,65,14,4,5,4,False,' ');
 Gotoxy(22,10); Write('   File Readme.Com Tidak Ditemukan');
 Gotoxy(22,11); Write('Copykan File tersebut Lebih Dahulu');
 Gotoxy(22,12); Write('Seandainya File Tersebut Tidak Ada');
 Gotoxy(22,13); Write('  Laporan Tidak Dapat Ditampilkan');
 Ch := Readkey;
End;
procedure cursor_off;
var
regs:registers;
begin
  regs.ah:=$1;regs.ch:=$20;regs.cl:=$20;intr($10,regs);
end;

procedure cursor_on;
var
regs:registers;
begin
  regs.ah:=$1;regs.ch:=$6;regs.cl:=$7;intr($10,regs);
end;
function space(n:byte):string;
var
s:string;
begin
  fillchar(s,n+1,#32);
  s[0]:=chr(n);
  space:=s;
end;
function sysdate:string;
var
 day,month:string[2];
 year:string[4];
begin
  reg.ax:=$2A00;
  msdos(reg);
  str(reg.dl:2,day);
  str(reg.dl:2,month);
  str(reg.cx:4,year);
  if day[1]=' '  then  day[1]:='0';
  if month[1]=' '  then month[1]:='0';
  sysdate:=day+'-'+month+'-'+year;
end;
function fulldate:string;
var
  d,m,y,dow,h:word;
  s:string;
  err:integer;
begin
 s:=sysdate;
 val(copy(s,4,2),h,err);
 getdate(d,m,y,dow);
 fulldate:=+days[dow]+', '+copy(s,1,2)+' '+bulan[m]+' '+copy(s,7,4);
end;
function rtrim(s:string):string;
var
i:integer;
begin
  for  i:=length(s) downto 0 do if s[i]='  ' then delete(s,i,j) else
  begin
   rtrim:=s;
   exit;
end;
end;
function ltrim(s:string):string;
var
i:integer;
begin
  for  i:=1  to length(s) do
  if s[1]=' '  then delete  (s,1,1) else begin
  ltrim:=s;
  exit;
end;
end;
function atrim(s:string):string;
var
i:integer;
begin
  atrim:=ltrim(rtrim(s));
end;
function r_pict(d:double;len,decs:integer):string;
var
s1,s2,s3:string;
n,i,j:integer;
neg:boolean;
begin
  neg:=(d <0.0);
  str(d:len:decs,s1);
  if neg then
  begin
     delete  (s1,pos('-',s1),1);
  end;
  s1:=atrim(s1);
  n:=pos('.',s1);
  if n >0 then
  begin
    s1[n]:=',';
    s2:=copy(s1,1,n-1);
    j:=length(s2);
    for i:=1  to length (s2) do
    begin
       j:=j-3;
       if j > 0  then  insert('.',s2,j+1);
    end;
    if neg then insert('-',s2,1);
    r_pict:=space(len-length(s2+s3))+s2+s3;
  end
  else  begin
     j:=length(s1);
     for i:=1  to length(s1) do
     begin
        j:=j-3;
        if  j >0 then insert('.',s1,j+1);

     end;
     if neg  then  insert('-',s1,1);
     r_pict:=space(len-length(s1))+s1;
  end;
end;
Procedure Waktu;
Var WaktuT : string;
    jam,mn,dt,sdt:word;
    kondisi,dtl:integer;
    jamt,mnt,dtt,sdtt:string;
    i:integer;
Begin
  GetTime(Jam,Mn,Dt,Sdt);cursor_off;
  If ((Kondisi = 0) or (Dt <> DtL)) then
  Begin
    DtL := Dt; Kondisi := 1;
    Str (Jam,JamT); Str (Mn,MnT); Str (Dt,DtT);str(sdt,sdtt);
    If Jam < 10 then
       JamT := '0'+JamT;
    If Mn < 10 then
       MnT := '0'+MnT;
    If Dt < 10 then
       DtT := '0'+DtT;
    WaktuT := JamT+':'+MnT+':'+DtT;textcolor(14);textbackground(3);
    gotoxy(72,25);write(WaktuT);
  End;
End;


function upper(s:string):string;
var
 l:integer;
 st:string;
begin
 st:=' ';
 for l:=1 to length(s) do
    st:=st+upcase(s[l]);
    upper:=st;
end;

function numstr(num:longint):string;
var
 vst:string;
begin
 str(num,vst);
 numstr:=vst;
end;

function strnum(s:string):longint;
var
 hasil:longint;
 code:integer;
begin
 val(s,hasil,code);
 strnum:=hasil;
end;


function dup(n:integer;ch:char):string;
var
s :string;
begin
  fillchar(s,n+1,ch);
  s[0]:=chr(n);
  dup:=s;
end;

procedure submenu1;
var
     ch     : char;
     Bar    : BYTE;
 Begin
    kotak  (2, 19,3,47, 9 ,4,1,14,false,'');
    gotoxy ( 20, 4); write (Menu1[1]);
    gotoxy ( 20, 5); write (Menu1[2]);
    gotoxy ( 20, 6); write (Menu1[3]);
    gotoxy ( 20, 7); write (Menu1[4]);
    gotoxy ( 20, 8); write (Menu1[5]);
    move (mem [$b800:0], Buffer2,4000);
    CH := ' ';Bar:=1;
    Repeat
         move (Buffer2,mem [$b800:0],4000);
         textattr := $4e;
         gotoxy ( 20,Bar+3 ); write(Menu1[Bar]);
         textattr:=$3e;
         gotoxy ( 1,25 ); write(mess1[Bar]);
         repeat
            Waktu;
         until keypressed;
         cursor_on;
         ch:=readkey;
         if ch <> #0 then
         Begin

            Case ch of
               #72 : Begin
                       Bar := Bar - 1;
                       if Bar < 1  then Bar := 5;
                     end;
               #80 : Begin
                       Bar := Bar + 1;
                       if Bar > 5 then Bar := 1;
                     end;
            End;
         End;
         IF CH = #13 Then
         Begin
             Case Bar OF
               1 : EMohon;
               2 : EKend;
               3 : EBBN;
               4 : EBiaya;
               5 : Exit;
             End;
         End;

    Until (CH = #27) or (ch = #75) or (ch = #77);
End;

Procedure SubMenu2;
var
     ch     : char;
     Bar: BYTE;
 Begin
    kotak  (2,19,6,49, 12,4,1,14,false,'');
    gotoxy (20, 7); write (Menu2[1]);
    gotoxy (20, 8); write (Menu2[2]);
    gotoxy (20, 9); write (Menu2[3]);
    gotoxy (20, 10); write (Menu2[4]);
    gotoxy (20, 11); write (Menu2[5]);
    move (mem [$b800:0], Buffer2,4000);
    CH := ' ';
    Bar :=1;
    Repeat
       move (Buffer2,mem [$b800:0],4000);
       textattr := $4e;
       gotoxy (20,Bar+6 ); write(Menu2[Bar]);
       textattr := $3e;
       gotoxy (1,25 ); write(mess2[Bar]);
       repeat
         Waktu;
       until keypressed;
       cursor_on;
       ch:=readkey;
       if ch <> #0 then Begin
          Case ch of
             #72 : Begin
                     Bar := Bar - 1;
                     if Bar < 1  then Bar := 5;
                   end;
             #80 : Begin
                     Bar := Bar + 1;
                     if Bar > 5 then Bar := 1;
                   end;
          End;
       End;
       IF CH = #13 Then Begin
          Case Bar OF
               1 : KMohon;
               2 : KKend;
               3 : KBBN;
               4 : KBiaya;
               5 : Exit;
          End;
       End;
    Until (CH = #27) or (ch = #75) or (ch = #77);
end;

Procedure SubMenu2a;
var
     ch     : char;
     Bar: BYTE;
 Begin
    kotak  (2,19,8,49, 14,4,1,14,false,'');
    gotoxy (20, 9); write (Menu2a[1]);
    gotoxy (20, 10); write (Menu2a[2]);
    gotoxy (20, 11); write (Menu2a[3]);
    gotoxy (20, 12); write (Menu2a[4]);
    gotoxy (20, 13); write (Menu2a[5]);
    move (mem [$b800:0], Buffer2,4000);
    CH := ' ';
    Bar :=1;
    Repeat
       move (Buffer2,mem [$b800:0],4000);
       textattr := $4e;
       gotoxy (20,Bar+8 ); write(Menu2a[Bar]);
       textattr := $3e;
       gotoxy (1,25 ); write(mess2a[Bar]);
       repeat
         Waktu;
       until keypressed;
       cursor_on;
       ch:=readkey;
       if ch <> #0 then Begin
          Case ch of
             #72 : Begin
                     Bar := Bar - 1;
                     if Bar < 1  then Bar := 5;
                   end;
             #80 : Begin
                     Bar := Bar + 1;
                     if Bar > 5 then Bar := 1;
                   end;
          End;
       End;
       IF CH = #13 Then Begin
          Case Bar OF
               1 : HMohon;
               2 : HKend;
               3 : HBBN;
               4 : HBiaya;
               5 : Exit;
          End;
       End;
    Until (CH = #27) or (ch = #75) or (ch = #77);
end;

Procedure SubMenu3;
var
     ch     : char;
     Bar    : BYTE;
 Begin
    kotak  (2,19,9,55,16,4,1,14,false,'');
    gotoxy (20, 10); write (Menu3[1]);
    gotoxy (20, 11); write (Menu3[2]);
    gotoxy (20, 12); write (Menu3[3]);
    gotoxy (20, 13); write (Menu3[4]);
    gotoxy (20, 14); write (Menu3[5]);
    gotoxy (20, 15); write (Menu3[6]);
    move (mem [$b800:0], Buffer2,4000);
    CH := ' '; Bar:=1;
    Repeat
         move (Buffer2,mem [$b800:0],4000);
         textattr := $4e;
         gotoxy (20,Bar+9 ); write(Menu3[Bar]);
         textattr := $3e;
         gotoxy (1,25 ); write(mess3[Bar]);
         repeat
           Waktu;
         until keypressed;
         cursor_on;
         ch:=readkey;
         if ch <> #0 then Begin
            Case ch of
               #72 : Begin
                       Bar := Bar - 1;
                       if Bar < 1  then Bar := 6;
                     end;
               #80 : Begin
                       Bar := Bar + 1;
                       if Bar > 6 then Bar := 1;
                     end;
            End;
         End;

         IF CH = #13 Then
         Begin
             ClrScr;
             Assign(lst,'Laporan.Lap');
             ReWrite(lst);
             Case Bar OF
               1 : InMohon;
               2 : InKend;
               3 : InBBN;
               4 : InBiaya;
               5 : InRekap;
               6 : Exit;
             End;
             Close(lst);
             ProgramName := 'Readme.Com';
             CmdLine     := 'Laporan.Lap';
             SwapVectors;
             Assign(Berkas, ProgramName);
             {SI-}
             Reset (Berkas);
             {$I+}
             Jumpa := (IOResult = 0);
             If Jumpa Then Pesan1;
             If Not Jumpa Then Pesan2;
         End;
    Until (CH = #27) or (ch = #75) or (ch = #77);

end;
{************ Utama ***********}

Begin
   textattr:=$3e;
   clrscr;
   Cursor_off;
   getdate (d1,d2,d3,d4);
   kotak  (1, 18,1,80,24,3,3,0,False,'');
   kotak  (1, 1,1,17,24,3,3,0,False,'');
   TextAttr := $3e;
   gotoxy (2, 3); write (Utama[1]);
   gotoxy (2, 7); write (Utama[2]);
   gotoxy (2, 11); write (Utama[3]);
   gotoxy (2, 15); write (Utama[4]);
   gotoxy (2, 19); write (Utama[5]);
   gotoxy (40,25); write(Fulldate);
   Waktu;
   M:= 2;
   N:=23;
   For K := 2 To 12 Do Begin
    For L := 79 DownTo 19 Do Begin
     TextColor(5);TextBackGround(3);
     GotoXY (L,M); Write (Chr(176));
     GotoXY (L,N); Write (Chr(176));
    End;
    Inc(M);Dec(N);
    Delay(40);
   End;
   kotak  (3, 22,11,78,15,0,0,0,False,'');
   kotak  (1, 21,10,77,14,0,7,15,False,'');
   TextColor(11);TextBackGround(7);
   gotoxy (26,11); write ('MENU UTAMA DESAIN PENGEMBANGAN SISTEM INFORMASI');
   gotoxy (29,12); write ('PENGOLAHAN DATA NILAI JUAL BEA BALIK NAMA ');
   gotoxy (26,13); write ('KENDARAAN BERMOTOR (BBN-KB) PADA SAMSAT MEDAN');
   textattr := $3e;
   move (mem [$b800:0], Buffer1,4000);
   CH  := ' ';
   Bar := 1;
   Repeat
         move (Buffer1, mem [$b800:0],4000);
         TextAttr:=$1e;
         gotoxy (2,bar*4-1); write(Utama[Bar]);
         textattr:=$3e;
         gotoxy (1,25); write(messu[Bar]);
         repeat
            Waktu;
         until KeyPressed;
         cursor_on;
         ch:=readkey;
         if ch <> #0 then
         Begin
            Case ch of
               #72 : Begin
                       Bar := Bar - 1;
                       if Bar < 1  then Bar := 5;
                     end;
               #80 : Begin
                       Bar := Bar + 1;
                       if Bar > 5 then Bar := 1;
                     end;
            End;
            Waktu;
         End;
         TextAttr:=$3e;
         IF CH = #13 Then
         Begin
             Case Bar OF
               1: SubMenu1;
               2: SubMenu2;
               3: SubMenu2a;
               4: SubMenu3;
               5: Exit;
             End;
         End;
    Until (CH = #225);
    ClrScr;
end.