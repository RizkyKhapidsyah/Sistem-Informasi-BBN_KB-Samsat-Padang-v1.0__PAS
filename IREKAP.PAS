Const   {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd1  = '                                        DINAS PENDAPATAN DAERAH';
 Jd2  = '                               SISTEM MENUNGGAL SATU ATAP ( SAMSAT ) PADANG';
 Jd3  = '                                    LAPORAN DATA REKAPITULASI BBN-KB';
        {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd4  = '旼컴컫컴컴컴컴컴컴컴컴컴컴컴쩡컴컴컴컴컫컴컴컴컴컴컴컴컫컴컴컴컴컴�';
 Jd4a = '컴컴컴컴컴쩡컴컴컴컴컫컴컴컴컴컴쩡컴컴컴컴컫컴컴컴컴컴�';
 Jd5  = '� No �      NOMOR KTP       � NO. POL  � D. PENYERAHAN � TANGGAL  �';
 Jd5a = '  PKB P   � BBN-KB P 쿞WDKLLJ P �  PNKB    �  LEGES   �';
 Jd6  = '�    �     NAMA PEMOHON     � NO.POL B � J. PERUBAHAN  �  BIAYA   �';
 Jd6a = '  PKB D   � BBN-KB D 쿞WDKLLJ D �          �   ADM    �';
 Jd7  = '쳐컴컵컴컴컴컴컴컴컴컴컴컴컴탠컴컴컴컴컵컴컴컴컴컴컴컴컵컴컴컴컴컴�';
 Jd7a = '컴컴컴컴컴탠컴컴컴컴컵컴컴컴컴컴탠컴컴컴컴컵컴컴컴컴컴�';
 Jd8  = '읕컴컨컴컴컴컴컴컴컴컴컴컴컴좔컴컴컴컴컨컴컴컴컴컴컴컴컨컴컴컴컴컴�';
 Jd8a = '컴컴컴컴컴좔컴컴컴컴컨컴컴컴컴컴좔컴컴컴컴컨컴컴컴컴컴�';
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
          Writeln(Lst,#15,'�',Nu:4,'�',RMohon.Ktp:Length(RMohon.KTP),' ':22-Length(RMohon.KTP),'�',RBBn.No_Pol:10,
                  '�',Cari:Length(Cari),' ':15-Length(Cari),'�',TglB:2,'-',BlB:2,'-',ThB:4,
                  '�',PkbP:10,'�',BBnP:10,'�',SwdP:10,'�',Pnkb:10,'�',Leges:10,'�');
          Writeln(Lst,#15,'�',' ':4,'�',RMohon.Nama:Length(RMohon.Nama),' ':22-Length(RMohon.Nama),'�',No_PolB:10,
                  '�',KCari:Length(KCari),' ':15-Length(KCari),'�',' ':10,
                  '�',Pkbd:10,'�',BBnd:10,'�',Swdd:10,'�',' ':10,'�',Adm:10,'�');
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