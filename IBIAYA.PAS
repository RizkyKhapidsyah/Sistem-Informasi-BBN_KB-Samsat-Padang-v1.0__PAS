Const   {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd1  = '                             DINAS PENDAPATAN DAERAH';
 Jd2  = '                    SISTEM MENUNGGAL SATU ATAP ( SAMSAT ) PADANG';
 Jd3  = '                           LAPORAN DATA BIAYA BBN-KB';
        {1234567891123456789212345678931234567894123456789512345678961234567897123456789}
 Jd4  = '������������������������������������������������������������������������������������������������������Ŀ';
 Jd5  = '� No �    KODE KASIR      �  NOMOR   � TANGGAL  � PKB P    � BBN-KB P � SWDKLLJ P�   PNKB   �   LEGES  �';
 Jd6  = '�    �    NAMA KASIR      �  POLISI  �  BIAYA   � PKB D    � BBN-KB D � SWDKLLJ D�          �    ADM   �';
 Jd7  = '������������������������������������������������������������������������������������������������������Ĵ';
 Jd8  = '��������������������������������������������������������������������������������������������������������';
Begin
 ClrScr;
 BukaBiaya;
 Nu := 0;
 Rec1 := FileSize(FBiaya);
 Writeln(Lst,' ');
 Writeln(Lst,' ');
 Writeln(Lst,' ');
 Writeln(Lst,Jd1);
 Writeln(Lst,Jd2);
 Writeln(Lst,Jd3);
 Writeln(Lst,' ');
 Writeln(Lst,Jd4);
 Writeln(Lst,Jd5);
 Writeln(Lst,Jd6);
 Writeln(Lst,Jd7);
 For I := 1 To Rec1 Do Begin
  Seek(FBiaya, I-1);
  Read(FBiaya, RBiaya);
  If RBiaya.No_PolB <> ' ' Then Begin
   With RBiaya Do Begin
    Nu := Nu + 1;
    Writeln(Lst,'�',Nu:4,'�',KdK:Length(Kdk),' ':20-Length(KdK),'�',No_PolB:10,'�',TglB:2,'-',BlB:2,'-',ThB:4,'�',PkbP:10,
            '�',BBNP:10,'�',SwdP:10,'�',Pnkb:10,'�',Leges:10,'�');
    Writeln(Lst,'�',' ':4,'�',NmK:Length(Nmk),' ':20-Length(NmK),'�',' ':10,'�',' ':10,'�',PkbD:10,
            '�',BBNd:10,'�',Swdd:10,'�',' ':10,'�',Adm:10,'�');
   End;
  End;
 End;
 Writeln(Lst,Jd8);
 Close(FBiaya);
End;