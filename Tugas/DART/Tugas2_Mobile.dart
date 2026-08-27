double hitungRataRata(List<int> nilai){
  int total = 0;

  for (int n in nilai) {
    total += n;
  }

  return total / nilai.length;
}

String tentukanGrade(double rataRata) {
  if (rataRata >= 90) {
    return 'A';
  } else if (rataRata >= 80) {
    return 'B';
  } else if (rataRata >= 70) {
    return 'C';
  } else if (rataRata >= 60) {
    return 'D';
  } else {
    return 'E';
  }
}

bool cekKelulusan({required double rataRata, required int absensi}) {
  return rataRata >= 60 && absensi <= 3;
}

void main(){
  Map<String, Map<String, dynamic>> mahasiswa = {
    "mhs1": {"nama": "Widya", "nilai": [90, 60,85], "absensi": 2},
    "mhs2": {"nama": "Djuleha", "nilai": [80,70,90], "absensi": 1},
    "mhs3": {"nama": "Laudya", "nilai": [60,55,70], "absensi": 1},
    "mhs4": {"nama": "Asty", "nilai": [90, 90,80], "absensi": 3},
    "mhs5": {"nama": "Muthia", "nilai": [80, 70,85], "absensi": 3}
  };

  print("=== LAPORAN NILAI MAHASISWA ===");
  double totalSemuaNilai = 0;
  int jumlahMahasiswa = mahasiswa.length;

  double nilaiTertinggi = 0;
  double nilaiTerendah = 100;
  
  for (var data in mahasiswa.values){
    String nama = data["nama"];
    List<int> nilai = data["nilai"];
    int absensi = data["absensi"];

    double rataRata = hitungRataRata(nilai);
    String grade = tentukanGrade(rataRata);
    bool Lulus = cekKelulusan(rataRata: rataRata, absensi: absensi);

    String statusKelulusan = Lulus ? "Lulus" : "Tidak Lulus";

    print("\nNama: $nama");
    print("Nilai: $nilai");
    print("Rata-rata: ${rataRata.toStringAsFixed(1)}");
    print("Grade: $grade");
    print("Status: $statusKelulusan");

    totalSemuaNilai += rataRata;

    if(rataRata > nilaiTertinggi){
      nilaiTertinggi = rataRata;
    }

    if(rataRata < nilaiTerendah){
      nilaiTerendah = rataRata;
    }
  }

  double rataRataKeseluruhan = totalSemuaNilai / jumlahMahasiswa;

print("\n=== STATISTIK KELAS ===");
print("Nilai Tertinggi: ${nilaiTertinggi.toStringAsFixed(1)}");
print("Nilai Terendah: ${nilaiTerendah.toStringAsFixed(1)}");
print("Rata-rata kelas: ${rataRataKeseluruhan.toStringAsFixed(1)}");

}