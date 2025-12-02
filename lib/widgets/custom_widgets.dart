import 'package:flutter/material.dart';
import '../theme.dart';
import '../screens/home_screen.dart'; 
import '../screens/grid_destinations_screen.dart'; 

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 20),
      width: double.infinity, // Memastikan lebar penuh agar bisa ditengah
      child: Column(
        children: [
          Image.asset(
            'assets/logokereta.png',
            width: 150, 
            height: 150,
            fit: BoxFit.contain, 
          ),
          // Jarak sedikit di bawah logo sebelum masuk ke menu
          const SizedBox(height: 10), 
        ],
      ),
    );
  }
}

// Widget Navigasi
class NavBar extends StatelessWidget {
  final String activePage; 

  const NavBar({super.key, required this.activePage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navItem(context, "Home"),
          _navItem(context, "Destinations"),
          _navItem(context, "My Journey"),
          _navItem(context, "Profile"),
        ],
      ),
    );
  }

  Widget _navItem(BuildContext context, String title) {
    bool isActive = activePage == title;

    return GestureDetector(
      onTap: () {
        if (title == "Home" && activePage != "Home") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else if (title == "Destinations" && activePage != "Destinations") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const GridDestinationsScreen()),
          );
        }
      },
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? AppColors.darkRed : AppColors.gold,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}