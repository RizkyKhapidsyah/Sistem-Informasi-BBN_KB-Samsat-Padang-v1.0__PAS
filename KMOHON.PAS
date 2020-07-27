Begin
 BukaPemohon;BukaKendaraan;
 Lagi := 'Y';
 Basuo := False;
 Basuo1 := False;
 While UpCase(Lagi) = 'Y' Do Begin
  Rec1 := FileSize(FMohon);
  Rec2 := FileSize(FKend);
  ClrScr;
  Gotoxy(30,6);Write('KOREKSI DATA PEMOHON BBN-KB');
  Gotoxy(25,8);Write('Nomor KTP        : ');Readln(KCari);
  For I := 1 To Rec1 Do Begin
   Seek(FMohon , I-1);
   Read(FMohon , RMohon );
   If KCari = RMohon.KTP Then Begin
    Basuo := True;
    With RMohon  Do Begin
     Gotoxy(25,9);Write('Nama Pemohon      : ');
     Gotoxy(25,10);Write('Alamat Pemohon    : ');
     Gotoxy(25,11);Write('Pekerjaan         : ');
     Gotoxy(25,12);Write('Nomor Telepon     : ');
     Gotoxy(25,13);Write('Nomor SB          : ');
     Gotoxy(25,14);Write('Nomor Pendaftaran : ');
     Gotoxy(25,16);Write('Koreksi Data [Y/T] : ');
     Gotoxy(45,9);Write(Nama);
     Gotoxy(45,10);Write(Alm_P);
     Gotoxy(45,11);Write(Kerja);
     Gotoxy(45,12);Write(NoTelp);
     Gotoxy(45,13);Write(NoSb);
     Gotoxy(45,14);Write(NoPend);
     Gotoxy(46,16);Simpan:=ReadKey;Write(Simpan);
     If UpCase(Simpan) = 'Y' Then Begin
      ClrScr;
      Gotoxy(30,6);Write('KOREKSI DATA PEMOHON BBN-KB');
      Gotoxy(25,8);Write('Nomor KTP        : ');Readln(Cari);
      For J := 1 To Rec1 Do Begin
       Seek(FMohon , J-1);
       Read(FMohon , RMohon );
       If (Cari = RMohon.KTP) And (I<>J) Then Begin
        Basuo1 := True;
        ClrScr;
        Gotoxy(23,22);Write('Data Tersebut Telah Ada Dalam File.....');
       End;
      End;
      If Not Basuo1 Then Begin
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
        Seek(FMohon ,I-1);
        Write(FMohon ,RMohon);
        For K := 1 To Rec2 Do Begin
         Seek(FKend, K-1);
         Read(FKend, RKend);
         If RKend.NoKTP = KCari Then Begin
          RKend.NoKTP := Cari;
          Seek(FKend, K-1);
          Write(FKend, RKend);
         End;
        End;
       End;
      End;
     End;
    End;
   End;
  End;
  If Not Basuo Then Begin
   ClrScr;
   Gotoxy(23,22);Write('Data Tersebut Tidak Ada Dalam File.....');
  End;
  Gotoxy(25,17);Write('Ada Data Lagi [Y/T]: ');Lagi:=ReadKey;Write(Lagi);
 End;
 Close(FMohon);
 Close(FKend);
End;
