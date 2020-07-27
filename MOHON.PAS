Begin
 BukaPemohon;
 Lagi := 'Y';
 Basuo := False;
 While UpCase(Lagi) = 'Y' Do Begin
  Rec1 := FileSize(FMohon);
  ClrScr;
  Gotoxy(30,6);Write('ENTRY DATA PEMOHON BBN-KB');
  Gotoxy(25,8);Write('Nomor KTP        : ');Readln(Cari);
  For I := 1 To Rec1 Do Begin
   Seek(FMohon , I-1);
   Read(FMohon , RMohon );
   If Cari = RMohon.KTP Then Begin
    Basuo := True;
    ClrScr;
    Gotoxy(23,22);Write('Data Tersebut Telah Ada Dalam File.....');
   End;
  End;
  If Not Basuo Then Begin
   With RMohon  Do Begin
    KTP  := Cari;
    Gotoxy(25,9);Write('Nama Pemohon      : ');
    Gotoxy(25,10);Write('Alamat Pemohon    : ');
    Gotoxy(25,11);Write('Pekerjaan         : ');
    Gotoxy(25,12);Write('Nomor Telepon     : ');
    Gotoxy(25,13);Write('Nomor SB          : ');
    Gotoxy(25,14);Write('Nomor Pendaftaran : ');
    Gotoxy(25,16);Write('Simpan Data [Y/T]  : ');
    Gotoxy(45,9);Readln(Nama);
    Gotoxy(45,10);Readln(Alm_P);
    Gotoxy(45,11);Readln(Kerja);
    Gotoxy(45,12);Readln(NoTelp);
    Gotoxy(45,13);Readln(NoSb);
    Gotoxy(45,14);Readln(NoPend);
    Gotoxy(46,16);Simpan:=ReadKey;Write(Simpan);
    If UpCase(Simpan) = 'Y' Then Begin
     Seek(FMohon ,FileSize(FMohon));
     Write(FMohon ,RMohon);
    End;
   End;
  End;
  Gotoxy(25,17);Write('Ada Data Lagi [Y/T]: ');Lagi:=ReadKey;Write(Lagi);
 End;
 Close(FMohon);
End;
