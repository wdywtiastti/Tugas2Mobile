import 'package:flutter/material.dart';
import 'Detailpage.dart';

void main(){
  return runApp(Buku());
}

class Buku extends StatelessWidget{
  const Buku({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage ({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

List<Map<String,dynamic>> daftarBuku = [
{
    "judul": "Laskar Pelangi",
    "pengarang": "Andrea Hirata",
    "tahunTerbit": 2005,
    "rating": 4.8,
    "tersedia": true,
    "genre": "Novel",
    "catatanPeminjam": null,
  },

  {
    "judul": "Bumi",
    "pengarang": "Tere Liye",
    "tahunTerbit": 2014,
    "rating": 4.5,
    "tersedia": false,
    "genre": "Fantasi",
    "catatanPeminjam": "Sedang dipinjam oleh Rina.",
  },

  {
    "judul": "Negeri 5 Menara",
    "pengarang": "Ahmad Fuadi",
    "tahunTerbit": 2009,
    "rating": 4.6,
    "tersedia": true,
    "genre": "Novel",
    "catatanPeminjam": null,
  },

  {
    "judul": "Bumi Manusia",
    "pengarang": "Pramoedya Ananta Toer",
    "tahunTerbit": 1980,
    "rating": 4.9,
    "tersedia": true,
    "genre": "Sejarah",
    "catatanPeminjam": null,
  },

  {
    "judul": "Harry Potter dan Batu Bertuah",
    "pengarang": "J.K. Rowling",
    "tahunTerbit": 1997,
    "rating": 4.7,
    "tersedia": true,
    "genre": "Fantasi",
    "catatanPeminjam": null,
  },

  {
    "judul": "Clean Code",
    "pengarang": "Robert C. Martin",
    "tahunTerbit": 2008,
    "rating": 4.7,
    "tersedia": false,
    "genre": "Teknologi",
    "catatanPeminjam": "Digunakan untuk belajar pemrograman.",
  },

];

String katgoriRating(double rating){
  if(rating >= 4.5){
    return "Sangat Baik";
  }else if(rating >= 3.5){
    return "Baik";
  }else{
    return "Cukup";
  }

}

class _HomePageState extends State<HomePage>{
  TextEditingController searchController = TextEditingController();
  String keyword = "";
  String genreDipilih = "";

  List<Map<String,dynamic>> get filterBuku{
    return daftarBuku.where((buku){
      bool cocokJudul =  buku["judul"].toLowerCase().contains(keyword.toLowerCase());
      bool cocokGenre = genreDipilih == "" || buku["genre"] == genreDipilih;
      return cocokJudul && cocokGenre;
    }).toList();
  }

  Set<String> get daftarGenre{
    return daftarBuku.map((buku) => buku["genre"] as String).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Katalog Buku",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.blue
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Cari Buku",
                  icon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                  )
                ),
                onChanged: (value) => setState(() {
                  keyword = value;
                }),
              ),
              SizedBox(height: 8,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(right: 8),
                      child: FilterChip(
                        label: Text("Semua"),
                        selected: genreDipilih == "",
                        onSelected: (value) => setState(() {
                          genreDipilih = "";
                        }),
                      ),
                      
                    ),
                    ...daftarGenre.map((genre){
                      return Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Text(genre),
                          selected: genreDipilih == genre,
                          onSelected: (value) => setState(() {
                            if(value){
                              genreDipilih = genre;
                            }else{
                              genreDipilih = "";
                            }
                          }),
                        ),
                      );
                    })
                    
                  ],
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: filterBuku.length,
                  itemBuilder: (context, index){
                    var buku = filterBuku[index];
                    return InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Detailpage(buku: buku)));
                      } ,
                      child: Card(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(buku["judul"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pengarang ${buku["pengarang"]}", 
                              style: TextStyle(fontSize: 12),),
                              Text("Tahun Terbit ${buku["tahunTerbit"]}",
                              style: TextStyle(fontSize: 12)),
                              Text("Genre ${buku["genre"]}",
                              style: TextStyle(fontSize: 12)),
                              Text("Rating: ${katgoriRating(buku["rating"])}",
                              style: TextStyle(fontSize: 12))
                            ],
                          ),
                          trailing: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: buku["tersedia"] ? Colors.green : Colors.red,
                              borderRadius: BorderRadius.circular(25)
                            ),
                            child: Text(buku["tersedia"] ? "Tersedia" : "Dipinjam",
                            style:  TextStyle(
                              color:  Colors.white
                            ),),
                          ),
                        ),
                      
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}