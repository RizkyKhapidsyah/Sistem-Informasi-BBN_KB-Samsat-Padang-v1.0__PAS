Const   {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd1  = '                                        DINAS PENDAPATAN DAERAH';
 Jd2  = '                               SISTEM MENUNGGAL SATU ATAP ( SAMSAT ) PADANG';
 Jd3  = '                                    LAPORAN DATA REKAPITULASI BBN-KB';
        {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd4  = 'ÚÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂ';
 Jd4a = 'ÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿';
 Jd5  = '³ No ³      NOMOR KTP       ³ NO. POL  ³ D. PENYERAHAN ³ TANGGAL  ³';
 Jd5a = '  PKB P   ³ BBN-KB P ³SWDKLLJ P ³  PNKB    ³  LEGES   ³';
 Jd6  = '³    ³     NAMA PEMOHON     ³ NO.POL B ³ J. PERUBAHAN  ³  BIAYA   ³';
 Jd6a = '  PKB D   ³ BBN-KB D ³SWDKLLJ D ³          ³   ADM    ³';
 Jd7  = 'ÃÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅ';
 Jd7a = 'ÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄ´';
 Jd8  = 'ÀÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁ';
 Jd8a = 'ÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÙ';
Begin
 ClrScr;
 BukaPemohon;BukaBBN;BukaBiaya;BukaKendaraan;
 Nu := 0;
 Rec3 := FileSize(FMohon);
 Rec2 := FileSize(FBBN);
 Rec1 := FileSize(FBiaya);
 Rec4 := FileSize(FKend);
 Basuo1 := False;
 Basuo2 := False;
 Basuo3 := False;
 Basuo4 := False;
 Writeln(Lst,#15,' ');
 Writeln(Lst,#15,' ');
 Writeln(Lst,#15,' ');
 Writeln(Lst,#15,Jd1);
 Writeln(Lst,#15,Jd2);
 Writeln(Lst,#15,Jd3);
 Writeln(Lst,#15,' ');
 Writeln(Lst,#15,Jd4,Jd4a);
 Writeln(Lst,#15,Jd5,Jd5a);
 Writeln(Lst,#15,Jd6,Jd6a);
 Writeln(Lst,#15,Jd7,Jd7a);
 For I := 1 To Rec1 Do Begin
  Seek(FBiaya, I-1);
  Read(FBiaya, RBiaya);
  If RBiaya.No_PolB <> ' ' Then Begin
   Basuo1 := True;
   For J := 1 To Rec2 Do Begin
    Seek(FBBN, J-1);
    Read(FBBN,RBBN);
    If RBBN.NoPolB = RBiaya.No_PolB Then Begin
     Basuo2 := True;
     For K := 1 To Rec4 Do Begin
      Seek(FKend, K-1);
      Read(FKend,RKend);
      If RKend.NoPol = RBBN.NoPolB Then Begin
       Basuo3 := True;
       Case RBBN.Dp Of
        '1' : Cari := 'Jual Beli';
        '2' : Cari := 'Lelang Negara';
        '3' : Cari := 'Hibah / Warisan';
        '4' : Cari := 'Import';
        '5' : Cari := 'B. Dr L. Negeri';
        '6' : Cari := 'Dump';
       End;
       Case RBBN.Jp Of
        '1' : KCari := 'Rubah Bentuk';
        '2' : KCari := 'Ganti Mesin';
        '3' : KCari := 'Lain-lain';
       End;
       For L := 1 To Rec3 Do Begin
        Seek(FMohon, L-1);
        Read(FMohon,RMohon);
        If RKend.NoKtp = RMohon.KTP Then Begin
         Basuo4 := True;
         With RBiaya Do Begin
          Nu := Nu + 1;
          Writeln(Lst,#15,'³',Nu:4,'³',RMohon.Ktp:Length(RMohon.KTP),' ':22-Length(RMohon.KTP),'³',RBBn.No_Pol:10,
                  '³',Cari:Length(Cari),' ':15-Length(Cari),'³',TglB:2,'-',BlB:2,'-',ThB:4,
                  '³',PkbP:10,'³',BBnP:10,'³',SwdP:10,'³',Pnkb:10,'³',Leges:10,'³');
          Writeln(Lst,#15,'³',' ':4,'³',RMohon.Nama:Length(RMohon.Nama),' ':22-Length(RMohon.Nama),'³',No_PolB:10,
                  '³',KCari:Length(KCari),' ':15-Length(KCari),'³',' ':10,
                  '³',Pkbd:10,'³',BBnd:10,'³',Swdd:10,'³',' ':10,'³',Adm:10,'³');
         End;
        End;
       End;
      End;
     End;
    End;
   End;
  End;
 End;
 Writeln(Lst,#15,Jd8,Jd8a);
 Close(FBiaya);
End;