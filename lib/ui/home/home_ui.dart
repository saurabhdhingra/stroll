import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stroll/ui/home/widgets/option_tile.dart';
import 'package:stroll/ui/widgets/super_script.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // All the variables and constants (if any on a screen) are declared here
  // above the lifecycle methods like initState() and dispose()

  int selectedOption = 2;

  final List<String> options = [
    "Love being best",
    "I am a team player",
    "Contributions beyond code",
    "Good with design"
  ];

  final optionLabel = "ABCD";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundImage(),
          _gradientFade(),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 60),
                _title(),
                _metrics(),
                const SizedBox(height: 300),
                _imageAndQuestion(),
                _underQuote(),
                _optionsGrid(),
                _footNoteOptions()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

// I like to declare all my UI elements like this in the form of methods,
// allows for easier readability.

  Align _backgroundImage() {
    return Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        'assets/background.jpeg',
        fit: BoxFit.cover,
      ),
    );
  }

  Positioned _gradientFade() {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black],
            stops: [0.45, 0.7],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  Row _title() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Stroll Bonfire",
          style: TextStyle(
            fontSize: 34,
            fontFamily: 'Proxima_Nova',
            fontWeight: FontWeight.w700,
            color: Color(0xFFCCC8FF),
            shadows: [
              Shadow(
                color: Color(0xFFB3ADF6),
              ),
            ],
          ),
        ),
        Icon(Icons.keyboard_arrow_down, color: Colors.white)
      ],
    );
  }

  Row _metrics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/clock.png',
          height: 16,
        ),
        const SizedBox(width: 6),
        const Text(
          "22h 00m",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        SvgPicture.asset(
          'assets/User.svg',
          height: 22,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        const Text(
          "103",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  Padding _imageAndQuestion() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.0),
      child: SizedBox(
        width: 345,
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/Pic.jpg'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Saurabh Dhingra, 22",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 250,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Why you should hire me at Stroll ?",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Proxima_Nova',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text _underQuote() {
    return Text(
      "\" Actually I should be asking when you are hiring me. \"",
      style: GoogleFonts.montserrat(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  SizedBox _optionsGrid() {
    return SizedBox(
      height: 165,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2.5),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedOption = index;
              });
              HapticFeedback.heavyImpact();
            },
            child: OptionTile(
              label: optionLabel[index],
              text: options[index],
              isSelected: selectedOption == index,
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBar _bottomBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF0F1115),
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/Card.svg'), label: 'Explore'),
        BottomNavigationBarItem(
            icon: SuperScript(
              parent: SvgPicture.asset('assets/likes.svg'),
              text: '',
            ),
            label: 'Likes'),
        BottomNavigationBarItem(
            icon: SuperScript(
              parent: SvgPicture.asset('assets/messages.svg'),
              text: '10',
            ),
            label: 'Messages'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/User.svg'), label: 'Profile'),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }

  Padding _footNoteOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hire me. Let's see how well\nI was able to impress you.",
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 108,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF232A2E),
                      border:
                          Border.all(color: const Color(0xFF8B88EF), width: 2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(CupertinoIcons.mic_fill,
                        color: Color(0xFF8B88EF), size: 38)),
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B88EF),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(CupertinoIcons.arrow_right,
                        color: Colors.black, size: 38)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
