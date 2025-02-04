class ProdukDigital {
  String namaProduk;
  double harga;
  String kategori;

  ProdukDigital(this.namaProduk, this.harga, this.kategori);

  void terapkanDiskon(double persenDiskon) {
    if (kategori == 'NetworkAutomation') {
      harga -= harga * (persenDiskon / 100);
    }
  }
}

abstract class Karyawan {
  String nama;
  int umur;

  Karyawan(this.nama, this.umur);

  void bekerja(); // Metode abstrak
}

class KaryawanTetap extends Karyawan {
  KaryawanTetap(String nama, int umur) : super(nama, umur);

  @override
  void bekerja() {
    print('$nama (Tetap) sedang bekerja.');
  }
}

class KaryawanKontrak extends Karyawan {
  KaryawanKontrak(String nama, int umur) : super(nama, umur);

  @override
  void bekerja() {
    print('$nama (Kontrak) sedang bekerja.');
  }
}

mixin Kinerja {
  int produktivitas = 0;

  void tingkatkanProduktivitas() {
    produktivitas += 10;
  }

  bool cekProduktivitasManager() {
    return produktivitas > 85;
  }
}

class Manager extends Karyawan with Kinerja {
  Manager(String nama, int umur) : super(nama, umur);

  @override
  void bekerja() {
    print(
        '$nama (Manager) sedang bekerja dengan produktivitas $produktivitas.');
  }
}

enum FaseProyek { Perencanaan, Pengembangan, Evaluasi }

class Proyek {
  FaseProyek faseSaatIni = FaseProyek.Perencanaan;

  void transisiFase(FaseProyek faseBaru) {
    if (faseBaru.index == faseSaatIni.index + 1) {
      faseSaatIni = faseBaru;
      print('Transisi ke fase $faseBaru berhasil.');
    } else {
      print('Transisi tidak valid.');
    }
  }
}

class Perusahaan {
  List<Karyawan> karyawanAktif = [];
  List<Karyawan> karyawanNonAktif = [];
  final int batasMaksimal = 20;

  void tambahKaryawan(Karyawan karyawan) {
    if (karyawanAktif.length < batasMaksimal) {
      karyawanAktif.add(karyawan);
      print('Karyawan ${karyawan.nama} berhasil ditambahkan.');
    } else {
      print('Batas maksimal karyawan aktif tercapai.');
    }
  }

  void resignKaryawan(Karyawan karyawan) {
    karyawanAktif.remove(karyawan);
    karyawanNonAktif.add(karyawan);
    print(
        'Karyawan ${karyawan.nama} telah resign dan dipindahkan ke daftar non-aktif.');
  }
}

void main() {
  var produk = ProdukDigital('Automasi Jaringan', 5000000, 'NetworkAutomation');
  produk.terapkanDiskon(10);
  print('Harga setelah diskon: ${produk.harga}');
  var karyawanTetap = KaryawanTetap('Aghatia', 30);
  karyawanTetap.bekerja();

  var karyawanKontrak = KaryawanKontrak('Chanda', 25);
  karyawanKontrak.bekerja();

  var manager = Manager('Ririn', 40);
  manager.bekerja();
  manager.tingkatkanProduktivitas();
  print('Produktivitas Manager: ${manager.produktivitas}');

  var proyek = Proyek();
  proyek.transisiFase(FaseProyek.Pengembangan);
  proyek.transisiFase(FaseProyek.Evaluasi);

  var perusahaan = Perusahaan();
  perusahaan.tambahKaryawan(karyawanTetap);
  perusahaan.tambahKaryawan(karyawanKontrak);
  perusahaan.tambahKaryawan(manager);
  perusahaan.resignKaryawan(karyawanTetap);
}
