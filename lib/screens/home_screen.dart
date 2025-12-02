import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/custom_widgets.dart';
import 'grid_destinations_screen.dart';
import 'detail_ticket_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            // Set activePage ke "Home" agar tombol Home menyala
            const NavBar(activePage: "Home"),
            
            Container(
              constraints: BoxConstraints(minHeight: size.height * 0.7),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.cream,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchCard(),
                  
                  const SizedBox(height: 30),
                  
                  const Text(
                    "Ticket Options",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // --- LIST TIKET ---
                  // Tiket 1: Royal Executive (Malam)
                  InkWell(
                    onTap: () {
                      _goToDetail(
                        context, 
                        "Royal Executive", 
                        "Rp. 850.000",
                        "assets/yogyakarta.jpg",
                        [
                          {"time": "19:00 WIB", "station": "Jakarta"},
                          {"time": "22:30 WIB", "station": "Cirebon"},
                          {"time": "23:00 WIB", "station": "Kebumen"},
                          {"time": "02:00 WIB", "station": "Yogyakarta"},
                        ]
                      );
                    },
                    child: _buildTicketCard(
                      className: "Royal Executive",
                      price: "Rp. 850.000",
                      departTime: "19:00",
                      arriveTime: "02:00",
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Tiket 2: Premier Luxury (Pagi)
                  InkWell(
                    onTap: () {
                       _goToDetail(
                        context, 
                        "Premier Luxury", 
                        "Rp. 1.250.000",
                        "assets/yogyakarta.jpg",
                        [
                          {"time": "08:00 WIB", "station": "Jakarta"},
                          {"time": "11:00 WIB", "station": "Bandung"},
                          {"time": "13:00 WIB", "station": "Tasikmalaya"},
                          {"time": "15:00 WIB", "station": "Yogyakarta"},
                        ]
                      );
                    },
                    child: _buildTicketCard(
                      className: "Premier Luxury",
                      price: "Rp. 1.250.000",
                      departTime: "08:00",
                      arriveTime: "15:00",
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Tiket 3: Business Class (Siang)
                  InkWell(
                    onTap: () {
                       _goToDetail(
                        context, 
                        "Business Class", 
                        "Rp. 550.000",
                        "assets/yogyakarta.jpg", 
                         [
                          {"time": "10:30 WIB", "station": "Jakarta"},
                          {"time": "13:30 WIB", "station": "Cirebon"},
                          {"time": "15:00 WIB", "station": "Purwokerto"},
                          {"time": "18:15 WIB", "station": "Yogyakarta"},
                        ]
                      );
                    },
                    child: _buildTicketCard(
                      className: "Business Class",
                      price: "Rp. 550.000",
                      departTime: "10:30",
                      arriveTime: "18:15",
                    ),
                  ),

                  const SizedBox(height: 20),
                  
                  // Tombol Lihat Semua Tujuan
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkRed,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const GridDestinationsScreen()),
                        );
                      },
                      child: const Text("View All Destinations", style: TextStyle(color: AppColors.gold)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goToDetail(BuildContext context, String name, String price, String image, List<Map<String, String>> itinerary) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailTicketScreen(
          ticketName: name, 
          ticketPrice: price,
          bgImage: image, 
          itineraryList: itinerary, 
        )
      ),
    );
  }

  Widget _buildSearchCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cream,
        border: Border.all(color: AppColors.gold, width: 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
        ]
      ),
      child: Column(
        children: [
          const Text("Plan Your Journey", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gold)),
          const Divider(color: AppColors.gold),
          _inputRow(Icons.location_on, "Departure"),
          _inputRow(Icons.location_on_outlined, "Arrival"),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _inputRow(Icons.calendar_today, "Date")),
              const SizedBox(width: 10),
              Expanded(child: _inputRow(Icons.person, "Guests")),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.darkRed,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Text("SEARCH JOURNEYS", style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  Widget _inputRow(IconData icon, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.gold),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: const TextStyle(color: AppColors.black),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTicketCard({
    required String className, 
    required String price,
    required String departTime,
    required String arriveTime
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.darkRed,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Text(className, style: const TextStyle(color: AppColors.gold, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Jakarta - Yogyakarta", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.circle, size: 12, color: AppColors.gold),
                        const SizedBox(width: 5),
                        Text("$departTime WIB Jakarta"),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: 20, 
                      width: 1, 
                      color: Colors.grey
                    ),
                     Row(
                      children: [
                        const Icon(Icons.circle, size: 12, color: AppColors.gold),
                        const SizedBox(width: 5),
                        Text("$arriveTime WIB Yogyakarta"),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.gold,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text("BOOK NOW", style: TextStyle(color: AppColors.darkRed, fontWeight: FontWeight.bold)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}