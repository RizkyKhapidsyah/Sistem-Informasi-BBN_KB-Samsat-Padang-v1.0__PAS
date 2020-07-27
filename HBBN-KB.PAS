Begin
 BukaBiaya;BukaBBN;BukaKendaraan;
 Lagi := 'Y';
 Basuo := False;
 Basuo1 := False;
 While UpCase(Lagi) = 'Y' Do Begin
  Rec1 := FileSize(FBiaya);
  Rec2 := FileSize(FBBN);
  ClrScr;
  Gotoxy(30,6);Write('HAPUS DATA BBN-KB');
  Gotoxy(25,8);Write('Nomor Polisi       : ');Readln(Cari1);
  Gotoxy(25,9);Write('Nomor Polisi Baru  : ');Readln(Cari2);
  For J := 1 To Rec2 Do Begin
   Seek(FBBN, J-1);
   Read(FBBN, RBBN);
   If (RBBN.No_Pol = Cari1) And (RBBN.NoPolB = Cari2) Then Begin
    With RBBN Do Begin
     Basuo1 := True;
     Gotoxy(25,10);Write('Dasar Penyerahan   : ');
     Gotoxy(25,11);Write(' 1. Jual Beli   2. Lelang Negara    3. Hibah/Warisan');
     Gotoxy(25,12);Write(' 4. Import      5. B. Dr. L. Negeri 6. Dump');
     Gotoxy(25,13);Write('Jenis Perubahan    : ');
     Gotoxy(25,14);Write(' 1. Rubah Bentuk 2. Ganti Mesin 3. Lain-lain');
     Gotoxy(25,15);Write('Tanggal Penyerahan : ');
     Gotoxy(25,16);Write('Tanggal Faktur     : ');
     Gotoxy(25,18);Write('Hapus   Data [Y/T] : ');
     Gotoxy(46,10);Write(Dp);
     Gotoxy(46,13);Write(Jp);
     Gotoxy(46,15);Write(TglP);
     Gotoxy(48,15);Write('-');
     Gotoxy(49,15);Write(BlP);
     Gotoxy(51,15);Write('-');
     Gotoxy(52,15);Write(ThnP);
     Gotoxy(46,16);Write(TglK);
     Gotoxy(48,16);Write('-');
     Gotoxy(49,16);Write(BlK);
     Gotoxy(51,16);Write('-');
     Gotoxy(52,16);Write(ThnK);
     Gotoxy(46,18);Simpan:=ReadKey;Write(Simpan);
     If UpCase(Simpan) = 'Y' Then Begin
      NoPolB := ' ';
      Seek(FBBN ,J-1);
      Write(FBBN ,RBBN);
      For L := 1 To FileSize(FKend) Do Begin
       Seek(FKend, L-1);
       Read(FKend,RKend);
       If RKend.NoPol = Cari2 Then Begin
        RKend.NoPol := ' ';
        Seek(FKend, FileSize(FKend)-1);
        Write(FKend,RKend);
       End;
      End;
      For I := 1 To Rec1 Do Begin
       Seek(FBiaya, I-1);
       Read(FBiaya,RBiaya);
       If RBiaya.No_Polb = Cari2 Then Begin
        RBiaya.No_PolB := ' ';
        Seek(FBiaya, I-1);
        Write(FBiaya,RBiaya);
       End;
      End;
     End;
    End;
   End;
  End;
  If Not Basuo1 Then Begin
   ClrScr;
   Gotoxy(23,22);Write('Data Tersebut Tidak Ada Dalam File.....');
  End;
  Gotoxy(25,19);Write('Ada Data Lagi [Y/T]: ');Lagi:=ReadKey;Write(Lagi);
 End;
 Close(FKend);Close(FBiaya);
 Close(FBBN);
End;
