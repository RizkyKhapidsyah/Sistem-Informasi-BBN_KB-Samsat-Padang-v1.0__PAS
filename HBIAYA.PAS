Begin
 BukaBiaya;
 Lagi := 'Y';
 Basuo1 := False;
 While UpCase(Lagi) = 'Y' Do Begin
  Rec2 := FileSize(FBiaya);
  ClrScr;
  Gotoxy(30,2);Write('HAPUS DATA BIAYA BBN-KB');
  Gotoxy(25,4);Write('Nomor Polisi Baru : ');Readln(Cari1);
  For J := 1 To Rec2 Do Begin
   Seek(FBiaya, J-1);
   Read(FBiaya, RBiaya);
   If RBiaya.No_PolB = Cari1 Then Begin
    Basuo1 := True;
    With RBiaya Do Begin
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
     Gotoxy(25,22);Write('Hapus   Data [Y/T] : ');
     Gotoxy(45,6);Write(TglB);
     Gotoxy(47,6);Write('-');
     Gotoxy(48,6);Write(BlB);
     Gotoxy(50,6);Write('-');
     Gotoxy(51,6);Write(ThB);
     Gotoxy(45,7);Write(KdK);
     Gotoxy(45,8);Write(NmK);
     Gotoxy(45,10);Write(PkbP);
     Gotoxy(45,11);Write(PkbD);
     Gotoxy(45,13);Write(BbnP);
     Gotoxy(45,14);Write(BBnD);
     Gotoxy(45,16);Write(SwdP);
     Gotoxy(45,17);Write(SwdD);
     Gotoxy(45,18);Write(Pnkb);
     Gotoxy(45,19);Write(Leges);
     Gotoxy(45,20);Write(Adm);
     Gotoxy(46,22);Simpan:=ReadKey;Write(Simpan);
     If UpCase(Simpan) = 'Y' Then Begin
      No_PolB := ' ';
     End;
    End;
   End;
  End;
  If Not Basuo1 Then Begin
   ClrScr;
   Gotoxy(23,22);Write('Data Tersebut Tidak Ada Dalam File.....');
  End;
  Gotoxy(25,23);Write('Ada Data Lagi [Y/T]: ');Lagi:=ReadKey;Write(Lagi);
 End;
 Close(FBiaya);
End;
