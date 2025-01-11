import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<String> _pages = ["Home", "Search", "Profile", "Settings"];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PixelPerfect(
      assetPath: 'assets/pixel.png',
      scale: 3.7,
      child: Scaffold(
        body: Stack(
          children: [
            // Background image
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/background.jpeg', // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),

            Positioned.fill(
              child: Container(
                  decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    stops: [0.45, 0.65],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              )),
            ),
            // Page content
            Center(
              child: Text(
                _pages[_selectedIndex],
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF0F1115),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/Card.svg'), label: 'Explore'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/likes.svg'), label: 'Likes'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/messages.svg'),
                label: 'Messages'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/User.svg'), label: 'Profile'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
