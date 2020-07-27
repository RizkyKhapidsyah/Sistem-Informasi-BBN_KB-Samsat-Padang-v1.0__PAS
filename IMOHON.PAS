Const   {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd1  = '                             DINAS PENDAPATAN DAERAH';
 Jd2  = '                    SISTEM MENUNGGAL SATU ATAP ( SAMSAT ) PADANG';
 Jd3  = '                           LAPORAN DATA PEMOHON BBN-KB';
        {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd4  = 'зддддбддддддддддддддддддддддбддддддддддддддддддддбдддддддддддддддбддддддддддддддддддддддддддддддбдддддддддддддддб';
 Jd4a = 'дддддддбдддддд©';
 Jd5  = 'Ё No Ё    NOMOR KTP         Ё      N A M A       Ё   PEKERJAAN   Ё          A L A M A T         Ё    NOMOR      Ё';
 Jd5a = ' NOMOR ЁNOMOR Ё';
 Jd6  = 'Ё    Ё                      Ё                    Ё               Ё          P E M O H O N       Ё   TELEPON     Ё';
 Jd6a = '  S B  ЁDAFTARЁ';
 Jd7  = 'цддддеддддддддддддддддддддддеддддддддддддддддддддедддддддддддддддеддддддддддддддддддддддддддддддеддддддддддддддде';
 Jd7a = 'дддддддедддддд╢';
 Jd8  = 'юддддаддддддддддддддддддддддаддддддддддддддддддддадддддддддддддддаддддддддддддддддддддддддддддддаддддддддддддддда';
 Jd8a = 'дддддддадддддды';
Begin
 ClrScr;
 BukaPemohon;
 Nu := 0;
 Rec1 := FileSize(FMohon);
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
 For I := 1 To Rec1 Do Begin
  Seek(FMohon, I-1);
  Read(FMohon, RMohon);
  If RMohon.KTP <> ' ' Then Begin
   With RMohon Do Begin
    Nu := Nu + 1;
    Writeln(Lst,'Ё',Nu:4,'Ё',Ktp:Length(KTP),' ':22-Length(KTP),'Ё',Nama:Length(Nama),
            ' ':20-Length(Nama),
            'Ё',Kerja:Length(Kerja),' ':15-Length(Kerja),'Ё',Alm_P:Length(Alm_P),' ':30-Length(Alm_P),
            'Ё',NoTelp:Length(NoTelp),' ':15-Length(NoTelP),'Ё',NoSb:7,
            'Ё',NoPend:6,'Ё');
   End;
  End;
 End;
 Writeln(Lst,Jd8,Jd8a);
 Close(FMohon);
End;