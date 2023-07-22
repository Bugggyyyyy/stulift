import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MyBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Center the icons
          children: [
            Expanded(
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: const Color.fromARGB(255, 73, 79, 239),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_comment_rounded),
                    label: 'Help A Hiker',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bike_scooter),
                    label: 'Need A Biker',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: 'Manage',
                  ),
                ],
                currentIndex: selectedIndex,
                onTap: onItemTapped,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
