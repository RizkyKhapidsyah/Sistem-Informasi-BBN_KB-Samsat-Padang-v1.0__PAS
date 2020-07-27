Begin
 BukaBiaya;BukaBBN;
 Lagi := 'Y';
 Basuo := False;
 Basuo1 := False;
 While UpCase(Lagi) = 'Y' Do Begin
  Rec1 := FileSize(FBBN);
  Rec2 := FileSize(FBiaya);
  ClrScr;
  Gotoxy(30,2);Write('ENTRY DATA BIAYA BBN-KB');
  Gotoxy(25,4);Write('Nomor Polisi      : ');Readln(Cari1);
  Gotoxy(25,5);Write('Nomor Polisi Baru : ');Readln(Cari2);
  For I := 1 To Rec1 Do Begin
   Seek(FBBN , I-1);
   Read(FBBN , RBBN );
   If (Cari1 = RBBN.No_Pol) And (Cari2 = RBBN.NoPolB) Then Begin
    Basuo := True;
    For J := 1 To Rec2 Do Begin
     Seek(FBiaya, J-1);
     Read(FBiaya, RBiaya);
     If RBiaya.No_PolB = Cari2 Then Begin
      Basuo1 := True;
      ClrScr;
      Gotoxy(23,22);Write('Data Tersebut Telah Ada Dalam File.....');
     End;
    End;
    If Not Basuo1 Then Begin
     With RBiaya Do Begin
      No_PolB := Cari2;
      Gotoxy(25,6);Write('Tanggal           : ');
      Gotoxy(25,7);Write('Kode Kasir        : ');
      Gotoxy(25,8);Write('Nama Kasir        : ');
      Gotoxy(25,9);Write('Biaya  PKB ');
      Gotoxy(25,10);Write('  Pokok           : ');
      Gotoxy(25,11);Write('  Denda           : ');
      Gotoxy(25,12);Write('Biaya SWDKLLJ');
      Gotoxy(25,13);Write('  Pokok           : ');
      Gotoxy(25,14);Write('  Denda           : ');
      Gotoxy(25,15);Write('Biaya BBN-KB');
      Gotoxy(25,16);Write('  Pokok           : ');
      Gotoxy(25,17);Write('  Denda           : ');
      Gotoxy(25,18);Write('Biaya PNKB        : ');
      Gotoxy(25,19);Write('Biaya Leges       : ');
      Gotoxy(25,20);Write('Biaya Adm         : ');
      Gotoxy(25,22);Write('Simpan Data [Y/T]  : ');
      Gotoxy(45,6);Readln(TglB);
      Gotoxy(47,6);Write('-');
      Gotoxy(48,6);Readln(BlB);
      Gotoxy(50,6);Write('-');
      Gotoxy(51,6);Readln(ThB);
      Gotoxy(45,7);Readln(KdK);
      Gotoxy(45,8);Readln(NmK);
      Gotoxy(45,10);Readln(PkbP);
      Gotoxy(45,11);Readln(PkbD);
      Gotoxy(45,13);Readln(BbnP);
      Gotoxy(45,14);Readln(BBnD);
      Gotoxy(45,16);Readln(SwdP);
      Gotoxy(45,17);Readln(SwdD);
      Gotoxy(45,18);Readln(Pnkb);
      Gotoxy(45,19);Readln(Leges);
      Gotoxy(45,20);Readln(Adm);
      Gotoxy(46,22);Simpan:=ReadKey;Write(Simpan);
      If UpCase(Simpan) = 'Y' Then Begin
       Seek(FBiaya ,FileSize(FBiaya));
       Write(FBiaya ,RBiaya);
      End;
     End;
    End;
   End;
  End;
  If Not Basuo Then Begin
   ClrScr;
   Gotoxy(23,22);Write('Data Tersebut Tidak Ada Dalam File.....');
  End;
  Gotoxy(25,23);Write('Ada Data Lagi [Y/T]: ');Lagi:=ReadKey;Write(Lagi);
 End;
 Close(FBBN);
 Close(FBiaya);
End;
