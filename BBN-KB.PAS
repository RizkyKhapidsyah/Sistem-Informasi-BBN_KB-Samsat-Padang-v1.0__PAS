Begin
 BukaKendaraan;BukaBBN;
 Lagi := 'Y';
 Basuo := False;
 Basuo1 := False;
 While UpCase(Lagi) = 'Y' Do Begin
  Rec1 := FileSize(FKend);
  Rec2 := FileSize(FBBN);
  ClrScr;
  Gotoxy(30,6);Write('ENTRY DATA BBN-KB');
  Gotoxy(25,8);Write('Nomor Polisi      : ');Readln(Cari1);
  For I := 1 To Rec1 Do Begin
   Seek(FKend , I-1);
   Read(FKend , RKend );
   If Cari1 = RKend.NoPol Then Begin
    Basuo := True;
    Gotoxy(25,9);Write('Nomor Polisi Baru  : ');Readln(Cari2);
    For J := 1 To Rec2 Do Begin
     Seek(FBBN, J-1);
     Read(FBBN, RBBN);
     If (RBBN.No_Pol = Cari1) And (RBBN.NoPolB = Cari2) Then Begin
      Basuo1 := True;
      ClrScr;
      Gotoxy(23,22);Write('Data Tersebut Telah Ada Dalam File.....');
     End;
    End;
    If Not Basuo1 Then Begin
     With RBBN Do Begin
      No_Pol  := Cari1;
      NoPolB := Cari2;
      Gotoxy(25,10);Write('Dasar Penyerahan   : ');
      Gotoxy(25,11);Write(' 1. Jual Beli   2. Lelang Negara    3. Hibah/Warisan');
      Gotoxy(25,12);Write(' 4. Import      5. B. Dr. L. Negeri 6. Dump');
      Gotoxy(25,13);Write('Jenis Perubahan    : ');
      Gotoxy(25,14);Write(' 1. Rubah Bentuk 2. Ganti Mesin 3. Lain-lain');
      Gotoxy(25,15);Write('Tanggal Penyerahan : ');
      Gotoxy(25,16);Write('Tanggal Faktur     : ');
      Gotoxy(25,18);Write('Simpan Data [Y/T]  : ');
      Gotoxy(46,10);Dp:=ReadKey;Write(Dp);
      Gotoxy(46,13);Jp:=ReadKey;Write(Jp);
      Gotoxy(46,15);Readln(TglP);
      Gotoxy(48,15);Write('-');
      Gotoxy(49,15);Readln(BlP);
      Gotoxy(51,15);Write('-');
      Gotoxy(52,15);Readln(ThnP);
      Gotoxy(46,16);Readln(TglK);
      Gotoxy(48,16);Write('-');
      Gotoxy(49,16);Readln(BlK);
      Gotoxy(51,16);Write('-');
      Gotoxy(52,16);Readln(ThnK);
      Gotoxy(46,18);Simpan:=ReadKey;Write(Simpan);
      If UpCase(Simpan) = 'Y' Then Begin
       Seek(FBBN ,FileSize(FBBN));
       Write(FBBN ,RBBN);
       RKend.NoPol := NoPolB;
       Seek(FKend ,I-1);
       Write(FKend ,RKend);
      End;
     End;
    End;
   End;
  End;
  If Not Basuo Then Begin
   ClrScr;
   Gotoxy(23,22);Write('Data Tersebut Tidak Ada Dalam File.....');
  End;
  Gotoxy(25,19);Write('Ada Data Lagi [Y/T]: ');Lagi:=ReadKey;Write(Lagi);
 End;
 Close(FKend);
 Close(FBBN);
End;
