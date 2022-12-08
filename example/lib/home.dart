import 'package:floating_action_bubble_custom/floating_action_bubble_custom.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() {
    return HomepageState();
  }
}

class HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _animationController,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HeroTag Example"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      //Init Floating Action Bubble
      floatingActionButton: FloatingActionBubble(
        // animation controller
        animation: _animation,

        // On pressed change animation state
        onPress: () => _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward(),

        // Floating Action button Icon color
        iconColor: Colors.blue,

        // Floating Action button Icon
        iconData: Icons.ac_unit,
        backgroundColor: Colors.white,
        // Menu items
        items: <Widget>[
          // Floating action menu item
          BubbleMenu(
            title: "Settings",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.settings,
            style: const TextStyle(fontSize: 16, color: Colors.white),
            onPressed: () {
              _animationController.reverse();
            },
          ),
          // Floating action menu item
          BubbleMenu(
            title: "Profile",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.people,
            style: const TextStyle(fontSize: 16, color: Colors.white),
            onPressed: () {
              _animationController.reverse();
            },
          ),
          //Floating action menu item
          BubbleMenu(
            title: "Home",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.home,
            style: const TextStyle(fontSize: 16, color: Colors.white),
            onPressed: () {
              _animationController.reverse();
            },
          ),
        ],
      ),
    );
  }
}
