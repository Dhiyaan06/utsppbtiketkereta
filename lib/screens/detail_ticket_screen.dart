import 'package:flutter/material.dart';
import '../theme.dart';

class DetailTicketScreen extends StatelessWidget {
  // Menerima data dari Home
  final String ticketName;
  final String ticketPrice;
  final String bgImage; // Gambar dinamis dari assets
  final List<Map<String, String>> itineraryList;

  const DetailTicketScreen({
    super.key, 
    required this.ticketName,
    required this.ticketPrice,
    required this.bgImage,
    required this.itineraryList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              // --- HEADER DENGAN GAMBAR + EFEK MERAH ---
              Stack(
                children: [
                  // LAPISAN 1 (BAWAH)
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(bgImage), 
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // LAPISAN 2 (ATAS)
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          // Merah agak transparan di atas
                          AppColors.darkRed.withAlpha(128), 
                          // Merah lebih pekat di bawah agar teks putih jelas
                          AppColors.darkRed.withAlpha(230), 
                        ],
                      ),
                    ),
                  ),

                  // LAPISAN 3 (PALING ATAS)
                  Positioned(
                    top: 40,
                    left: 20,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: AppColors.gold),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(ticketName, style: const TextStyle(color: AppColors.gold, fontSize: 24, fontWeight: FontWeight.bold)),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             const Text("Jakarta - Yogyakarta", style: TextStyle(color: Colors.white, fontSize: 16)),
                             Text(ticketPrice, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                           ],
                         )
                      ],
                    ),
                  )
                ],
              ),

              // --- KONTEN ITINERARY & FACILITIES ---
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Itinerary", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.darkRed)),
                              const SizedBox(height: 20),
                              ...itineraryList.asMap().entries.map((entry) {
                                int idx = entry.key;
                                Map<String, String> data = entry.value;
                                return _timelineItem(
                                  data['time']!, 
                                  data['station']!, 
                                  idx == 0, 
                                  idx == itineraryList.length - 1
                                );
                              }),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Facilities", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.darkRed)),
                              const SizedBox(height: 20),
                              _facilityItem(Icons.weekend, "Lounge"),
                              _facilityItem(Icons.restaurant, "Meals"),
                              _facilityItem(Icons.tv, "Hiburan"),
                              _facilityItem(Icons.usb, "USB"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkRed,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                    ),
                    onPressed: (){}, 
                    child: const Text("Book Now", style: TextStyle(color: AppColors.gold, fontSize: 18)),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  // Widget Timeline Lurus
  Widget _timelineItem(String time, String city, bool isFirst, bool isLast) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch, 
        children: [
          SizedBox(
            width: 80, 
            child: Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
            )
          ),
          Column(
            children: [
              Icon(Icons.circle, size: 12, color: AppColors.darkRed),
              if (!isLast) 
                Expanded(
                  child: Container(
                    width: 2, 
                    color: Colors.grey[300],
                  ),
                )
            ],
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Text(city, style: const TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _facilityItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.gold, size: 28),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}