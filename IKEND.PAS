Const   {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd1  = '                             DINAS PENDAPATAN DAERAH';
 Jd2  = '                    SISTEM MENUNGGAL SATU ATAP ( SAMSAT ) PADANG';
 Jd3  = '                           LAPORAN DATA KENDARAAN BBN-KB';
        {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd4  = '����������������������������������������������������������������������������������������������������������������';
 Jd4a = '��������������������������Ŀ';
 Jd5  = '� No �    NOMOR KTP         �      N A M A       � JN. KENDARAAN �         MERK / TYPE          � NOMOR RANGKA  ';
 Jd5a = '�NO. POLISI�   WARNA       �';
 Jd6  = '�    �                      �                    �    FUNGSI     �       TAHUN PEMBUATAN        � NOMOR MESIN   ';
 Jd6a = '�NO. BPKB  � NEGARA ASAL   �';
 Jd7  = '����������������������������������������������������������������������������������������������������������������';
 Jd7a = '��������������������������Ĵ';
 Jd8  = '����������������������������������������������������������������������������������������������������������������';
 Jd8a = '����������������������������';
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
      Writeln(Lst,'�',Nu:4,'�',NoKtp:Length(NoKTP),' ':22-Length(NoKTP),'�',RMohon.Nama:Length(RMohon.Nama),
              ' ':20-Length(RMohon.Nama),
              '�',Jnk:Length(Jnk),' ':15-Length(JnK),'�',Merk:Length(Merk),' ':30-Length(Merk),
              '�',NoR:Length(NoR),' ':15-Length(NoR),'�',NoPol:10,
              '�',Warna:Length(Warna),' ':15-Length(Warna),'�');
      Writeln(Lst,'�',' ':4,'�',' ':22,'�',' ':20,
              '�',Fungsi:Length(Fungsi),' ':15-Length(Fungsi),'�',' ':13,Thp:4,' ':13,
              '�',NoM:Length(NoM),' ':15-Length(NoM),'�',NoBPKB:Length(NoBPKB),' ':10-Length(NoBPKB),
              '�',NegAsal:Length(NegAsal),' ':15-Length(NegAsal),'�');
     End;
    End;
   End;
  End;
 End;
 Writeln(Lst,Jd8,Jd8a);
 Close(FMohon);Close(FKend);
End;