Const   {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd1  = '                             DINAS PENDAPATAN DAERAH';
 Jd2  = '                    SISTEM MENUNGGAL SATU ATAP ( SAMSAT ) PADANG';
 Jd3  = '                              LAPORAN DATA BBN-KB';
        {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd4  = '┌────┬──────────┬──────────┬───────────────┬───────────────┬──────────┬──────────┐';
 Jd5  = '│ No │  NOMOR   │ NO. POL  │     DASAR     │     JENIS     │ TANGGAL  │ TANGGAL  │';
 Jd6  = '│    │ POLISI   │  BARU    │   PENYERAHAN  │   PERUBAHAN   │PENYERAHAN│  FAKTUR  │';
 Jd7  = '├────┼──────────┼──────────┼───────────────┼───────────────┼──────────┼──────────┤';
 Jd8  = '└────┴──────────┴──────────┴───────────────┴───────────────┴──────────┴──────────┘';
Begin
 ClrScr;
 BukaBBN;
 Nu := 0;
 Rec1 := FileSize(FBBN);
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
  Seek(FBBN, I-1);
  Read(FBBN, RBBN);
  If RBBN.No_Pol <> ' ' Then Begin
   With RBBN Do Begin
    Nu := Nu + 1;
    Case Dp Of
     '1' : Cari := 'Jual Beli';
     '2' : Cari := 'Lelang Negara';
     '3' : Cari := 'Hibah / Warisan';
     '4' : Cari := 'Import';
     '5' : Cari := 'B. Dr L. Negeri';
     '6' : Cari := 'Dump';
    End;
    Case Jp Of
     '1' : KCari := 'Rubah Bentuk';
     '2' : KCari := 'Ganti Mesin';
     '3' : KCari := 'Lain-lain';
    End;
    Writeln(Lst,'│',Nu:4,'│',No_Pol:10,'│',NoPolB:10,'│',Cari:Length(Cari),' ':15-Length(Cari),
            '│',KCari:Length(KCari),' ':15-Length(KCari),
            '│',TglP:2,'-',BlP:2,'-',ThnP:4,'│',TglK:2,'-',BlK:2,'-',ThnK:4,'│');
   End;
  End;
 End;
 Writeln(Lst,Jd8);
 Close(FBBN);
End;