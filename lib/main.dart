import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: const Color.fromARGB(255, 133, 18, 179),
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 1;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String?, String?>> chats = [
      {
        "name": "JS <=> Testing",
        "message": "Saif: New ReleaseName: Tutors",
        "time": "Thursday",
      },
      {
        "name": "End-User Testing [QC] Team",
        "message": "You: [camera emoji]",
        "time": "Thursday",
      },
      {
        "name": "Food Court 🍗🥩🥪",
        "message": "Amira: done, thank youuu",
        "time": "Thursday",
      },
      {
        "name": "Dina Ali",
        "message": "متقلقش ان شاء الله هنقولكو قبلها بوقت كافي",
        "time": "Thursday",
      },
      {
        "name": "Esraa Saeed",
        "message": "You: لأ دا حصل في الميتنج 😂",
        "time": "Thursday",
      },
      {"name": "Haya Khaled", "message": "You: tmam", "time": "Thursday"},
      {
        "name": "Abdualeem Hosny",
        "message": "You: 31813604845",
        "time": "Thursday",
      },
      {
        "name": "Zeinab Mabd",
        "message": "You: mahmoud.abouhawis@nagwa.com",
        "time": "Thursday",
      },
      {
        "name": "Radwa Muhammad",
        "message": "بعتلها في ميتينج لما تخلص هترد عليا",
        "time": "Thursday",
      },
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          leading: photo(),
          titleSpacing: 6,
          title: const Text(
            "Chat",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actionsPadding: const EdgeInsets.only(right: 3),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            PopupMenuButton(itemBuilder: (BuildContext context) => []),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListServices(),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("Recent", style: TextStyle(fontSize: 15)),
                  ),
                  for (final msg in chats)
                    Chat(
                      title: msg['name'],
                      day: msg['time'],
                      lastMsg: msg['message'],
                    ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: _buildBorderedIcon(Icons.home, _currentIndex == 0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildBorderedIcon(Icons.chat, _currentIndex == 1),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: _buildBorderedIcon(
                Icons.record_voice_over,
                _currentIndex == 2,
              ),
              label: 'Walkie Talkie',
            ),

            BottomNavigationBarItem(
              icon: _buildBorderedIcon(
                Icons.calendar_today,
                _currentIndex == 3,
              ),
              label: 'Planner',
            ),
            BottomNavigationBarItem(
              icon: _buildBorderedIcon(Icons.more_horiz, _currentIndex == 4),
              label: 'More',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.edit),
        ),
      ),
    );
  }
}

Widget _buildBorderedIcon(IconData iconData, bool isSelected) {
  return Padding(
    padding: const EdgeInsets.all(6),
    child: Icon(
      iconData,
      size: 20,
      color: Colors.white,
      shadows: [
        Shadow(
          color:
              isSelected
                  ? const Color.fromARGB(255, 133, 18, 179)
                  : const Color.fromARGB(255, 0, 0, 0),
          blurRadius: 6,
        ),
      ],
    ),
  );
}

Widget ListServices() {
  return SizedBox(
    height: 30,
    child: Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 12), child: SortButton()),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 17),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildChip('Unread', 80),
                _buildDivider(),
                _buildChip('@Mensions', 110),
                _buildChip('Channels', 90),
                _buildChip('Chats', 70),
                _buildChip('Meetings', 90),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildChip(String label, double width) {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(20),
    child: Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 179, 167, 167),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        width: width,
        child: Center(child: Text(label, style: const TextStyle(fontSize: 15))),
      ),
    ),
  );
}

Widget _buildDivider() {
  return const Padding(
    padding: EdgeInsets.only(left: 5),
    child: SizedBox(
      width: 1,
      height: 10,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Color.fromARGB(255, 179, 167, 167)),
      ),
    ),
  );
}

class SortButton extends StatelessWidget {
  const SortButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTapDown: (_) {},
      onTap: () {},
      onTapCancel: (){},
      onHighlightChanged: (_){},
      onSecondaryTap: (){},
      child: SizedBox(
        width: 30,
        height: 30,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 2,
              child: Transform.flip(
                flipX: true,
                child: Icon(Icons.sort, size: 17, color: Colors.black),
              ),
            ),
            Positioned(
              left: 10,
              top: 9.5,
              child: SvgPicture.asset(
                'lib/assests/arrow.svg',
                color: Colors.black,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget photo() {
  return const Padding(
    padding: EdgeInsets.all(9.6),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(80)),
      child: Image(
        image: AssetImage("lib/assests/OIP.jpeg"),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget ChatPhoto() {
  return Padding(
    padding: EdgeInsets.all(10),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Image(
        image: AssetImage("lib/assests/OIP.jpeg"),
        fit: BoxFit.cover,
        height: 50,
        width: 50,
      ),
    ),
  );
}

Widget Chat({
  required String? title,
  required String? day,
  required String? lastMsg,
}) {
  return Container(
    height: 72,
    child: Row(
      children: [
        ChatPhoto(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(title!, style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 13),
                      child: Text(day!),
                    ),
                  ],
                ),
              ),
              Text(lastMsg!, style: TextStyle(fontSize: 13)),
            ],
          ),
        ),
      ],
    ),
  );
}
