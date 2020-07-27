Begin
 BukaBBN;BukaKendaraan;
 Lagi := 'Y';
 Basuo := False;
 Basuo1 := False;
 While UpCase(Lagi) = 'Y' Do Begin
  Rec1 := FileSize(FBBN);
  Rec2 := FileSize(FKend);
  ClrScr;
  Gotoxy(30,6);Write('KOREKSI DATA KENDARAAN');
  Gotoxy(25,8);Write('Nomor KTP        : ');Readln(Cari);
  Gotoxy(25,9);Write('Nomor Polisi     : ');Readln(Cari1);
  For J := 1 To Rec2 Do Begin
   Seek(FKend, J-1);
   Read(FKend, RKend);
   If (RKend.NoKTP = Cari) And (RKend.NoPol = Cari1) Then Begin
    Basuo := True;
    With RKend Do Begin
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
     Gotoxy(25,21);Write('Koreksi Data [Y/T] : ');
     Gotoxy(45,11);Write(NoR);
     Gotoxy(45,12);Write(NoM);
     Gotoxy(45,13);Write(NoBPKB);
     Gotoxy(45,14);Write(JnK);
     Gotoxy(45,15);Write(Merk);
     Gotoxy(45,16);Write(ThP);
     Gotoxy(45,17);Write(Fungsi);
     Gotoxy(45,18);Write(Warna);
     Gotoxy(45,19);Write(BBM);
     Gotoxy(45,20);Write(NegAsal);
     Gotoxy(46,22);Simpan:=ReadKey;Write(Simpan);
     If UpCase(Simpan) = 'Y' Then Begin
      ClrScr;
      Gotoxy(30,6);Write('KOREKSI DATA KENDARAAN');
      Gotoxy(25,8);Write('Nomor KTP        : ',Cari);
      Gotoxy(25,9);Write('Nomor Polisi     : ');Readln(Cari2);
      For K := 1 To Rec2 Do Begin
       Seek(FKend, J-1);
       Read(FKend, RKend);
       If (RKend.NoPol = Cari2) And (J<>K) Then Begin
        Basuo1 := True;
        ClrScr;
        Gotoxy(23,22);Write('Data Tersebut Telah Ada Dalam File.....');
       End;
      End;
      If Not Basuo1 Then Begin
       NoPol := Cari2;
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
       Gotoxy(25,21);Write('Simpan Data [Y/T]  : ');
       Gotoxy(45,11);Readln(NoR);
       Gotoxy(45,12);Readln(NoM);
       Gotoxy(45,13);Readln(NoBPKB);
       Gotoxy(45,14);Readln(JnK);
       Gotoxy(45,15);Readln(Merk);
       Gotoxy(45,16);Readln(ThP);
       Gotoxy(45,17);Readln(Fungsi);
       Gotoxy(45,18);Readln(Warna);
       Gotoxy(45,19);Readln(BBM);
       Gotoxy(45,20);Readln(NegAsal);
       Gotoxy(46,22);Simpan:=ReadKey;Write(Simpan);
       If UpCase(Simpan) = 'Y' Then Begin
        Seek(FKend ,J-1);
        Write(FKend ,RKend);
        For I := 1 To FileSize(FBBN) Do Begin
         Seek(FBBN, I-1);
         Read(FBBN,RBBN);
         If RBBN.No_Pol = Cari1 Then Begin
          RBBN.No_Pol := Cari2;
          Seek(FBBN, I-1);
          Write(FBBN,RBBN);
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
  Gotoxy(25,23);Write('Ada Data Lagi [Y/T]: ');Lagi:=ReadKey;Write(Lagi);
 End;
 Close(FBBN);
 Close(FKend);
End;
