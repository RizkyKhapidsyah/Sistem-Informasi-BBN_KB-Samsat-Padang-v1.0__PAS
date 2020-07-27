Const   {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd1  = '                             DINAS PENDAPATAN DAERAH';
 Jd2  = '                    SISTEM MENUNGGAL SATU ATAP ( SAMSAT ) PADANG';
 Jd3  = '                           LAPORAN DATA KENDARAAN BBN-KB';
        {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd4  = 'ÚÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ';
 Jd4a = 'ÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿';
 Jd5  = '³ No ³    NOMOR KTP         ³      N A M A       ³ JN. KENDARAAN ³         MERK / TYPE          ³ NOMOR RANGKA  ';
 Jd5a = '³NO. POLISI³   WARNA       ³';
 Jd6  = '³    ³                      ³                    ³    FUNGSI     ³       TAHUN PEMBUATAN        ³ NOMOR MESIN   ';
 Jd6a = '³NO. BPKB  ³ NEGARA ASAL   ³';
 Jd7  = 'ÃÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ';
 Jd7a = 'ÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´';
 Jd8  = 'ÀÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ';
 Jd8a = 'ÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ';
Begin
 ClrScr;
 BukaPemohon;BukaKendaraan;
 Nu := 0;
 Rec1 := FileSize(FMohon);
 Rec2 := FileSize(FKend);
 Writeln(Lst,' ');
 Writeln(Lst,' ');
 Writeln(Lst,' ');
 Writeln(Lst,Jd1);
 Writeln(Lst,Jd2);
 Writeln(Lst,Jd3);
 Writeln(Lst,' ');
 Writeln(Lst,Jd4,Jd4a);
 Writeln(Lst,Jd5,Jd5a);
 Writeln(Lst,Jd6,Jd6a);
 Writeln(Lst,Jd7,Jd7a);
 For J := 1 To Rec2 Do Begin
  Seek(FKend, J-1);
  Read(FKend, RKend);
  If (RKend.NoKTP <> ' ') And (RKend.NoPol <> ' ') Then Begin
   For I := 1 To Rec1 Do Begin
    Seek(FMohon, I-1);
    Read(FMohon, RMohon);
    If RMohon.KTP = RKend.NoKTP Then Begin
     With RKend Do Begin
      Nu := Nu + 1;
      Writeln(Lst,'³',Nu:4,'³',NoKtp:Length(NoKTP),' ':22-Length(NoKTP),'³',RMohon.Nama:Length(RMohon.Nama),
              ' ':20-Length(RMohon.Nama),
              '³',Jnk:Length(Jnk),' ':15-Length(JnK),'³',Merk:Length(Merk),' ':30-Length(Merk),
              '³',NoR:Length(NoR),' ':15-Length(NoR),'³',NoPol:10,
              '³',Warna:Length(Warna),' ':15-Length(Warna),'³');
      Writeln(Lst,'³',' ':4,'³',' ':22,'³',' ':20,
              '³',Fungsi:Length(Fungsi),' ':15-Length(Fungsi),'³',' ':13,Thp:4,' ':13,
              '³',NoM:Length(NoM),' ':15-Length(NoM),'³',NoBPKB:Length(NoBPKB),' ':10-Length(NoBPKB),
              '³',NegAsal:Length(NegAsal),' ':15-Length(NegAsal),'³');
     End;
    End;
   End;
  End;
 End;
 Writeln(Lst,Jd8,Jd8a);
 Close(FMohon);Close(FKend);
End;