import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  final Map<String, dynamic> buku;
  Detailpage({required this.buku});

  @override
  State<Detailpage> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<Detailpage> {
  String? catatanPeminjam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Buku",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.buku["judul"],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Pengarang ${widget.buku["pengarang"]}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Tahun Terbit ${widget.buku["tahunTerbit"]}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Genre ${widget.buku["genre"]}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Rating: ${widget.buku["rating"]}",
              style: TextStyle(fontSize: 16),
            ),
            Text("Catatan Pemintajaman:", style: TextStyle(fontSize: 16)),
            Text(catatanPeminjam ?? "(Tidak ada catatan)"),
          ],
        ),
      ),
    );
  }
}
