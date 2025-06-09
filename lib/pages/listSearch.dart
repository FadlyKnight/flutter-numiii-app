// ignore: file_names
// Mengabaikan warning terkait penamaan file yang tidak sesuai konvensi Dart (seharusnya snake_case).

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// Import library http untuk melakukan HTTP request (dengan alias `http`).

import 'dart:convert';
// Import library untuk mengkonversi data JSON dari API ke dalam bentuk Dart.

class ListSearchPage extends StatefulWidget {
  const ListSearchPage({super.key});
  @override
  State<ListSearchPage> createState() => _ListSearchPageState();
}

class _ListSearchPageState extends State<ListSearchPage> {
  List<String> pokemonList = [];
  // List untuk menyimpan nama-nama Pokémon yang diambil dari API.

  bool isLoading = true;
  // Boolean untuk melacak apakah data sedang dimuat.

  @override
  void initState() {
    super.initState();
    fetchPokemonList();
    // Memanggil method untuk fetch data dari API ketika widget pertama kali dibangun.
  }

  Future<void> fetchPokemonList() async {
    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100');
    // URL API Pokémon untuk mengambil 100 data pertama.

    final response = await http.get(url);
    // Mengirim HTTP GET request ke API.

    if (response.statusCode == 200) {
      // Jika berhasil mendapatkan respon (kode status 200).
      final data = json.decode(response.body);
      // Decode data JSON dari response body.

      final results = data['results'] as List;
      // Ambil list hasil dari key 'results' pada data JSON.

      setState(() {
        pokemonList = results.map((pokemon) => pokemon['name'] as String).toList();
        // Ubah setiap objek dalam list menjadi hanya string nama Pokémon, lalu simpan ke state.

        isLoading = false;
        // Data selesai dimuat, ubah status loading menjadi false.
      });
    } else {
      // Jika gagal mendapatkan data dari API.
      setState(() {
        isLoading = false;
        // Tetap ubah status loading ke false agar bisa tampilkan error atau state kosong.
      });
      print('Failed to load Pokémon');
      // Tampilkan log error di console.
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
      // Jika sedang loading, tampilkan spinner loading di tengah layar.
    }

    return ListView.builder(
      itemCount: pokemonList.length,
      // Menentukan jumlah item yang akan ditampilkan berdasarkan panjang list Pokémon.

      itemBuilder: (context, index) {
        // Membangun setiap item dalam list.
        return ListTile(
          leading: Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
            // Menampilkan gambar Pokémon berdasarkan indeks (1-based indexing karena nama file sprite dimulai dari 1).

            width: 50,
            height: 50,
            // Atur ukuran gambar agar seragam.
          ),
          title: Text(pokemonList[index].toUpperCase()),
          // Tampilkan nama Pokémon dengan huruf kapital semua.
        );
      },
    );
  }
}
