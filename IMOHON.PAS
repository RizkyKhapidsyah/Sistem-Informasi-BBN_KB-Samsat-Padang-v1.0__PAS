Const   {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd1  = '                             DINAS PENDAPATAN DAERAH';
 Jd2  = '                    SISTEM MENUNGGAL SATU ATAP ( SAMSAT ) PADANG';
 Jd3  = '                           LAPORAN DATA PEMOHON BBN-KB';
        {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd4  = '旼컴컫컴컴컴컴컴컴컴컴컴컴컴쩡컴컴컴컴컴컴컴컴컴컫컴컴컴컴컴컴컴컫컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴쩡컴컴컴컴컴컴컴�';
 Jd4a = '컴컴컴컫컴컴컴�';
 Jd5  = '� No �    NOMOR KTP         �      N A M A       �   PEKERJAAN   �          A L A M A T         �    NOMOR      �';
 Jd5a = ' NOMOR 쿙OMOR �';
 Jd6  = '�    �                      �                    �               �          P E M O H O N       �   TELEPON     �';
 Jd6a = '  S B  쿏AFTAR�';
 Jd7  = '쳐컴컵컴컴컴컴컴컴컴컴컴컴컴탠컴컴컴컴컴컴컴컴컴컵컴컴컴컴컴컴컴컵컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴탠컴컴컴컴컴컴컴�';
 Jd7a = '컴컴컴컵컴컴컴�';
 Jd8  = '읕컴컨컴컴컴컴컴컴컴컴컴컴컴좔컴컴컴컴컴컴컴컴컴컨컴컴컴컴컴컴컴컨컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴좔컴컴컴컴컴컴컴�';
 Jd8a = '컴컴컴컨컴컴컴�';
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
    Writeln(Lst,'�',Nu:4,'�',Ktp:Length(KTP),' ':22-Length(KTP),'�',Nama:Length(Nama),
            ' ':20-Length(Nama),
            '�',Kerja:Length(Kerja),' ':15-Length(Kerja),'�',Alm_P:Length(Alm_P),' ':30-Length(Alm_P),
            '�',NoTelp:Length(NoTelp),' ':15-Length(NoTelP),'�',NoSb:7,
            '�',NoPend:6,'�');
   End;
  End;
 End;
 Writeln(Lst,Jd8,Jd8a);
 Close(FMohon);
End;