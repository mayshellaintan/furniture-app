import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Index untuk Bottom Navigation Bar
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.search, color: Colors.grey, size: 28),
          onPressed: () {},
        ),
        title: Column(
          children: [
            Text(
              "MAKE HOME",
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
                letterSpacing: 1.5,
                fontFamily: 'Georgia',
              ),
            ),
            const Text(
              "BEAUTIFUL",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1.5,
                fontFamily: 'Georgia',
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.grey, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          
          // 1. Kategori (Horizontal ListView)
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildCategoryItem(Icons.star, "Popular", true),
                _buildCategoryItem(Icons.chair_outlined, "Chair", false),
                _buildCategoryItem(Icons.table_restaurant_outlined, "Table", false),
                _buildCategoryItem(Icons.weekend_outlined, "Armchair", false),
                _buildCategoryItem(Icons.bed_outlined, "Bed", false),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // 2. Grid Produk (Dua Kolom)
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              childAspectRatio: 0.6, // Mengatur rasio tinggi kartu produk
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                _buildProductCard("Black Simple Lamp", "\$ 12.00", "assets/images/Media.jpg"),
                _buildProductCard("Minimal Stand", "\$ 25.00", "assets/images/Media (1).jpg"),
                _buildProductCard("Coffee Chair", "\$ 12.00", "assets/images/Media (2).jpg"),
                _buildProductCard("Simple Desk", "\$ 12.00", "assets/images/Media (3).jpg"),
              ],
            ),
          ),
        ],
      ),
      
      // 3. Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color(0xFF242424),
        unselectedItemColor: Colors.grey[400],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 28), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border, size: 28), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none, size: 28), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 28), label: ""),
        ],
      ),
    );
  }

  // Widget untuk Item Kategori
  Widget _buildCategoryItem(IconData icon, String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF242424) : Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon, 
              color: isSelected ? Colors.white : Colors.grey[600],
              size: 26,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFF242424) : Colors.grey[500],
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  // Widget untuk Kartu Produk
  Widget _buildProductCard(String name, String price, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                // Penanganan jika gambar tidak ditemukan
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image_not_supported, color: Colors.grey),
                  );
                },
              ),
            ),
            // Tombol Shopping Bag di dalam gambar
            Positioned(
              bottom: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.shopping_bag, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          name, 
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          price, 
          style: const TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 16, 
            color: Color(0xFF242424),
          ),
        ),
      ],
    );
  }
}
