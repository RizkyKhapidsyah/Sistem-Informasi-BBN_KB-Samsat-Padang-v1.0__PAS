Unit File1;
Interface
Uses Crt;
Type
 Pemohon = Record
  KTP    : String[22];
  Nama   : String[20];
  Alm_P  : String[30];
  Kerja  : String[15];
  NoTelp : String[15];
  NoSb   : String[7];
  NoPend : String[6];
 End;

 Kendaraan = Record
  NoKTP      : String[22];
  NoPol      : String[10];
  NoR        : String[15];
  NoM        : String[15];
  NoBPKB     : String[15];
  JnK        : String[15];
  Merk       : String[15];
  ThP        : String[4];
  Fungsi     : String[30];
  Warna      : String[8];
  NegAsal    : String[15];
  BBM        : String[7];
 End;

 BBN_KB = Record
  No_Pol        : String[10];
  NoPolb        : String[10];
  DP, JP        : Char;
  TglP, BlP, TglK, BlK      : String[2];
  ThnP, ThnK    : String[4];
 End;

 Biaya  = Record
  No_PolB : String[10];
  KdK     : String[6];
  NmK     : String[20];
  PkbP, PkbD, BbnP, BbnD, SwdP, SwdD,
  Pnkb, Leges, Adm  : LongInt;
  TglB, BlB    : String[2];
  ThB          : String[4];
 End;
Var
 FMohon         : File Of Pemohon;
 RMohon         : Pemohon;
 FKend          : File Of Kendaraan;
 RKend          : Kendaraan;
 FBBN           : File Of BBN_KB;
 RBBN           : BBN_KB;
 FBiaya         : File Of Biaya;
 RBiaya         : Biaya;
 Cari,KCari     : String[22];
 Cari1,Cari2    : String[10];
 Basuo,Basuo1,
 Basuo2,Basuo3,Basuo4          : Boolean;
 Rec1,Rec2,Rec3,Rec4,I,J,K,L,
 Nu,TMohon         : Integer;
 TPkbP, TPkbD, TBbnP, TBbnD, TSwdP, TSwdD,
 TPnkb, TLeges, TAdm  : LongInt;
 Lagi, Simpan   : Char;
Procedure BukaPemohon;
Procedure BukaKendaraan;
Procedure BukaBBN;
Procedure BukaBiaya;
Implementation
Procedure BukaPemohon;
Begin
 Assign(FMohon,'Mohon.Dat');
 {$I-}
 Reset(FMohon);
 {$I+}
 If IoResult <> 0 Then ReWrite(FMohon);
End;

Procedure BukaKendaraan;
Begin
 Assign(FKend,'Kend.Dat');
 {$I-}
 Reset(FKend);
 {$I+}
 If IoResult <> 0 Then ReWrite(FKend);
End;

Procedure BukaBBN;
Begin
 Assign(FBBN,'BBN.Dat');
 {$I-}
 Reset(FBBN);
 {$I+}
 If IoResult <> 0 Then ReWrite(FBBN);
End;

Procedure BukaBiaya;
Begin
 Assign(FBiaya,'Biaya.Dat');
 {$I-}
 Reset(FBiaya);
 {$I+}
 If IoResult <> 0 Then ReWrite(FBiaya);
End;
Begin
End.