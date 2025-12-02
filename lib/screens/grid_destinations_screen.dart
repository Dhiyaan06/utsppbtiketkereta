import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/custom_widgets.dart';

class GridDestinationsScreen extends StatelessWidget {
  const GridDestinationsScreen({super.key});

  final List<Map<String, String>> destinations = const [
    {"name": "JAKARTA", "img": "assets/jakarta.jpg"},
    {"name": "BANDUNG", "img": "assets/bandung.jpg"},
    {"name": "SOLO", "img": "assets/solo.png"},
    {"name": "SEMARANG", "img": "assets/semarang.jpg"},
    {"name": "YOGYAKARTA", "img": "assets/yogyakarta.jpg"},
    {"name": "PANGANDARAN", "img": "assets/pangandaran.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    int gridCount = MediaQuery.of(context).size.width > 600 ? 3 : 2;

    return Scaffold(
      body: Column(
        children: [
          const AppHeader(),
          const NavBar(activePage: "Destinations"),
          
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: const BoxDecoration(
                color: AppColors.cream,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: destinations.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75, 
                ),
                itemBuilder: (context, index) {
                  return _buildDestinationCard(destinations[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationCard(Map<String, String> data) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(data['img']!), 
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                data['name']!,
                style: const TextStyle(
                  color: AppColors.gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 1.2
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}