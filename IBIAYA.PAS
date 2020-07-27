Const   {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd1  = '                             DINAS PENDAPATAN DAERAH';
 Jd2  = '                    SISTEM MENUNGGAL SATU ATAP ( SAMSAT ) PADANG';
 Jd3  = '                           LAPORAN DATA BIAYA BBN-KB';
        {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd4  = 'ÚÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿';
 Jd5  = '³ No ³    KODE KASIR      ³  NOMOR   ³ TANGGAL  ³ PKB P    ³ BBN-KB P ³ SWDKLLJ P³   PNKB   ³   LEGES  ³';
 Jd6  = '³    ³    NAMA KASIR      ³  POLISI  ³  BIAYA   ³ PKB D    ³ BBN-KB D ³ SWDKLLJ D³          ³    ADM   ³';
 Jd7  = 'ÃÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄ´';
 Jd8  = 'ÀÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÙ';
Begin
 ClrScr;
 BukaBiaya;
 Nu := 0;
 Rec1 := FileSize(FBiaya);
 Writeln(Lst,' ');
 Writeln(Lst,' ');
 Writeln(Lst,' ');
 Writeln(Lst,Jd1);
 Writeln(Lst,Jd2);
 Writeln(Lst,Jd3);
 Writeln(Lst,' ');
 Writeln(Lst,Jd4);
 Writeln(Lst,Jd5);
 Writeln(Lst,Jd6);
 Writeln(Lst,Jd7);
 For I := 1 To Rec1 Do Begin
  Seek(FBiaya, I-1);
  Read(FBiaya, RBiaya);
  If RBiaya.No_PolB <> ' ' Then Begin
   With RBiaya Do Begin
    Nu := Nu + 1;
    Writeln(Lst,'³',Nu:4,'³',KdK:Length(Kdk),' ':20-Length(KdK),'³',No_PolB:10,'³',TglB:2,'-',BlB:2,'-',ThB:4,'³',PkbP:10,
            '³',BBNP:10,'³',SwdP:10,'³',Pnkb:10,'³',Leges:10,'³');
    Writeln(Lst,'³',' ':4,'³',NmK:Length(Nmk),' ':20-Length(NmK),'³',' ':10,'³',' ':10,'³',PkbD:10,
            '³',BBNd:10,'³',Swdd:10,'³',' ':10,'³',Adm:10,'³');
   End;
  End;
 End;
 Writeln(Lst,Jd8);
 Close(FBiaya);
End;