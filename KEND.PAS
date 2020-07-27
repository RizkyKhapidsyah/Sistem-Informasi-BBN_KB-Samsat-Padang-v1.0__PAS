Begin
 BukaPemohon;BukaKendaraan;
 Lagi := 'Y';
 Basuo := False;
 Basuo1 := False;
 While UpCase(Lagi) = 'Y' Do Begin
  Rec1 := FileSize(FMohon);
  Rec2 := FileSize(FKend);
  ClrScr;
  Gotoxy(30,6);Write('ENTRY DATA KENDARAAN');
  Gotoxy(25,8);Write('Nomor KTP        : ');Readln(Cari);
  For I := 1 To Rec1 Do Begin
   Seek(FMohon , I-1);
   Read(FMohon , RMohon );
   If Cari = RMohon.KTP Then Begin
    Basuo := True;
    Gotoxy(25,9);Write('Nama Pemohon      : ',RMohon.Nama);
    Gotoxy(25,10);Write('Nomor Polisi      : ');Readln(Cari1);
    For J := 1 To Rec2 Do Begin
     Seek(FKend, J-1);
     Read(FKend, RKend);
     If (RKend.NoKTP = Cari) And (RKend.NoPol = Cari1) Then Begin
      Basuo1 := True;
      ClrScr;
      Gotoxy(23,22);Write('Data Tersebut Telah Ada Dalam File.....');
     End;
    End;
    If Not Basuo1 Then Begin
     With RKend Do Begin
      NoKTP  := Cari;
      NoPol := Cari1;
      Gotoxy(25,11);Write('Nomor Rangka      : ');
      Gotoxy(25,12);Write('Nomor Mesin       : ');
      Gotoxy(25,13);Write('Nomor BPKB        : ');
      Gotoxy(25,14);Write('Tahun Pembuatan   : ');
      Gotoxy(25,15);Write('Merk / Type       : ');
      Gotoxy(25,16);Write('Jenis Kendaraan   : ');
      Gotoxy(25,17);Write('Fungsi Kendaraan  : ');
      Gotoxy(25,18);Write('Warna             : ');
      Gotoxy(25,19);Write('Bahan Bakar       : ');
      Gotoxy(25,20);Write('Negara Asal       : ');
      Gotoxy(25,22);Write('Simpan Data [Y/T]  : ');
      Gotoxy(45,11);Readln(NoR);
      Gotoxy(45,12);Readln(NoM);
      Gotoxy(45,13);Readln(NoBPKB);
      Gotoxy(45,14);Readln(ThP);
      Gotoxy(45,15);Readln(Merk);
      Gotoxy(45,16);Readln(JnK);
      Gotoxy(45,17);Readln(Fungsi);
      Gotoxy(45,18);Readln(Warna);
      Gotoxy(45,19);Readln(BBM);
      Gotoxy(45,20);Readln(NegAsal);
      Gotoxy(46,22);Simpan:=ReadKey;Write(Simpan);
      If UpCase(Simpan) = 'Y' Then Begin
       Seek(FKend ,FileSize(FKend));
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
  Gotoxy(25,23);Write('Ada Data Lagi [Y/T]: ');Lagi:=ReadKey;Write(Lagi);
 End;
 Close(FMohon);
 Close(FKend);
End;
