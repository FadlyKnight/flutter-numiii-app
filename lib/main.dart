import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Widget Flutter (State: Stateless)
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon Shop',
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Poppins'),
      home: const HomePage(),
    );
  }
}

// Widget Flutter (State: Stateful)
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _searchQuery = '';

  // Controller untuk EditText/TextField
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _updateSearchQuery(String text) {
    setState(() {
      _searchQuery = text;
    });
    print('Searching for: $_searchQuery');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Widget Flutter (Scaffold: AppBar)
      appBar: AppBar(
        title: const Text('PokeShop'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Implementasi keranjang belanja
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Keranjang Belanja Pokemon')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Implementasi notifikasi
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifikasi Pokemon Baru')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // Widget Flutter (Layout: Column)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Widget Flutter (Basic: EditText/TextField)
              TextField(
                controller: _searchController,
                onChanged: _updateSearchQuery,
                decoration: InputDecoration(
                  hintText: 'Cari Pokemon favoritmu...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),

              // Banner Promo (Container)
              // Widget Flutter (Scaffold: Container)
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red[300],
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://fakeimg.pl/400x150?text=Pokemon+Sale',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Kategori Pokemon
              // Widget Flutter (Basic: Text)
              const Text(
                'Kategori Pokemon',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Widget Flutter (Layout: Row in ListView)
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    PokemonCategory(
                      icon: Icons.local_fire_department,
                      color: Colors.redAccent,
                      text: 'Api',
                    ),
                    PokemonCategory(
                      icon: Icons.water_drop,
                      color: Colors.blueAccent,
                      text: 'Air',
                    ),
                    PokemonCategory(
                      icon: Icons.bolt,
                      color: Colors.yellowAccent,
                      text: 'Listrik',
                    ),
                    PokemonCategory(
                      icon: Icons.grass,
                      color: Colors.greenAccent,
                      text: 'Rumput',
                    ),
                    PokemonCategory(
                      icon: Icons.psychology,
                      color: Colors.purpleAccent,
                      text: 'Psikis',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Pokemon Populer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pokemon Populer',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  // Widget Flutter (Basic: Button)
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman semua Pokemon
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Melihat semua Pokemon')),
                      );
                    },
                    child: const Text('Lihat Semua'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
                children: const [
                  PokemonItem(
                    name: 'Pikachu',
                    price: 'Rp 250.000',
                    imageUrl: 'https://fakeimg.pl/150?text=Pikachu',
                    rating: '4.8',
                    type: 'Listrik',
                  ),
                  PokemonItem(
                    name: 'Charizard',
                    price: 'Rp 500.000',
                    imageUrl: 'https://fakeimg.pl/150?text=Charizard',
                    rating: '4.9',
                    type: 'Api/Terbang',
                  ),
                  PokemonItem(
                    name: 'Bulbasaur',
                    price: 'Rp 220.000',
                    imageUrl: 'https://fakeimg.pl/150?text=Bulbasaur',
                    rating: '4.5',
                    type: 'Rumput/Racun',
                  ),
                  PokemonItem(
                    name: 'Squirtle',
                    price: 'Rp 220.000',
                    imageUrl: 'https://fakeimg.pl/150?text=Squirtle',
                    rating: '4.6',
                    type: 'Air',
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Featured Pokemon - Contoh StatefulWidget lain
              const Text(
                'Pokemon Langka',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const FeaturedPokemon(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pencarian'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

// Contoh StatelessWidget
class PokemonCategory extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final String? type;

  const PokemonCategory({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 40),
          ),
          const SizedBox(height: 8),
          Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

// Contoh StatelessWidget dengan Basic Widgets
class PokemonItem extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final String rating;
  final String type;

  const PokemonItem({
    Key? key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, //
        children: [
          // Widget Flutter (Basic: Image)
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  type,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                const SizedBox(height: 3),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.red[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const Spacer(),
                    // Widget Flutter (Basic: Button - IconButton)
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.red,
                        size: 20,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$name ditambahkan ke keranjang'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Contoh StatefulWidget lain - Featured Pokemon dengan counter
class FeaturedPokemon extends StatefulWidget {
  const FeaturedPokemon({Key? key}) : super(key: key);

  @override
  State<FeaturedPokemon> createState() => _FeaturedPokemonState();
}

class _FeaturedPokemonState extends State<FeaturedPokemon> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Widget Flutter (Layout: Row)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Widget Flutter (Basic: Image)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://fakeimg.pl/150?text=Mewtwo',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Widget Flutter (Basic: Text)
                    const Text(
                      'Mewtwo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Psikis',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Rp 1.500.000',
                      style: TextStyle(
                        color: Colors.red[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '5.0',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'Pokemon legenda terkuat, hasil eksperimen genetik dengan DNA MeSangat langka dan memiliki kemampuan psikis yang luar biasa.',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 15),
          // Widget Kuantitas
          Row(
            children: [
              const Text(
                'Jumlah:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 15),
              // Widget Flutter (Basic: Button - IconButton)
              IconButton(
                onPressed: _decrementQuantity,
                icon: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(Icons.remove, size: 16),
                ),
              ),
              Text(
                '$_quantity',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: _incrementQuantity,
                icon: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(Icons.add, size: 16, color: Colors.red[700]),
                ),
              ),
              const Spacer(),
              // Widget Flutter (Basic: Button - ElevatedButton)
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Mewtwo ($_quantity) ditambahkan ke keranjang',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                ),
                child: const Text('Beli Sekarang'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
