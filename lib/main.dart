import 'package:flutter/material.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const FoodHomePage(),
    );
  }
}

class FoodHomePage extends StatelessWidget {
  const FoodHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Food & Snacks'),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ส่วนที่ 1: อาหาร (Main Dishes)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'จานหลักยอดนิยม',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFoodCard('กะเพราไข่ดาว', 'https://images.unsplash.com/photo-1562607348-976151697627?q=80&w=400'),
                  _buildFoodCard('ข้าวผัดปู', 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?q=80&w=400'),
                  _buildFoodCard('ต้มยำกุ้ง', 'https://images.unsplash.com/photo-1548943487-a2e4e43b4853?q=80&w=400'),
                  _buildFoodCard('ส้มตำไทย', 'https://images.unsplash.com/photo-1563379091339-03b21bc4a4f8?q=80&w=400'),
                ],
              ),
            ),

            const Divider(height: 40, thickness: 2),

            // ส่วนที่ 2: ของว่าง (Snacks)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'ของว่างทานเล่น',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            // ใช้ GridView หรือ Column เพื่อให้อยู่ด้านบน Floating Action Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
                children: [
                  _buildSnackCard('ปาท่องโก๋', 'https://images.unsplash.com/photo-1505253149613-112d21d9f6a9?q=80&w=400'),
                  _buildSnackCard('ขนมครก', 'https://images.unsplash.com/photo-1599481238505-b8b0537a3f77?q=80&w=400'),
                  _buildSnackCard('ลูกชิ้นปิ้ง', 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?q=80&w=400'),
                ],
              ),
            ),
            const SizedBox(height: 80), // เผื่อที่ไว้สำหรับ Floating Button
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }

  // Widget สำหรับการสร้าง Card อาหาร
  Widget _buildFoodCard(String name, String imageUrl) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(imageUrl, height: 140, width: 180, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          IconButton(
            icon: const Icon(Icons.arrow_circle_right, color: Colors.orange),
            onPressed: () {
              // TODO: เชื่อมลิ้งค์ไปหน้าต่อไป
            },
          )
        ],
      ),
    );
  }

  // Widget สำหรับการสร้าง Card ของว่าง
  Widget _buildSnackCard(String name, String imageUrl) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(imageUrl, width: double.infinity, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {},
                  child: const Text('ดูรายละเอียด'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}