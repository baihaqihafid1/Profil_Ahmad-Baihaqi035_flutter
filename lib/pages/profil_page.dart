import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Karyawan'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Bagian tengah: kartu profil dengan animasi
          Expanded(
            child: Center(
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOut,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    margin: const EdgeInsets.all(20),
                    color: const Color(0xFFF8F9FA),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // FOTO + INFO UTAMA
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Hero(
                                tag: 'profile',
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundImage:
                                      const AssetImage('assets/profile.png'),
                                  backgroundColor: Colors.grey[200],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Ahmad Baihaqi Hafid",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Web Developer",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                  Text(
                                    "Divisi Information Technology (IT)",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),

                          // TOMBOL DETAIL
                          ElevatedButton.icon(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  title: const Text(
                                    "Detail Karyawan",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text("Nama: Ahmad Baihaqi Hafid"),
                                      Text("NIP: 231080200035"),
                                      Text("Jabatan: Web Developer"),
                                      Text(
                                          "Divisi: Information Technology (IT)"),
                                      Text("Email: haqi@kantor.com"),
                                      Text("No. Telp: +62 856 0653 7914"),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(ctx),
                                      child: const Text(
                                        "Tutup",
                                        style: TextStyle(color: Colors.teal),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(Icons.info_outline),
                            label: const Text("Lihat Detail"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 12),
                              shadowColor: Colors.tealAccent,
                              elevation: 5,
                            ),
                          ),

                          const SizedBox(height: 15),

                          // BONUS: efek klik lucu
                          InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Keren kan animasinya? 😎"),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.teal,
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.favorite, color: Colors.redAccent),
                                SizedBox(width: 8),
                                Text(
                                  "Terima Kasih Sudah Melihat 😄",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Copyright di bawah
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "© 2025 PT XYZ.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
