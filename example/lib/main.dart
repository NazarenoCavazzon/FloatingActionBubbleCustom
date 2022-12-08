import 'package:example/home.dart';
import 'package:floating_action_bubble_custom/floating_action_bubble_custom.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating Action Bubble Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: MyHomePage(
          title: 'Floating Action Bubble Demo',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
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
        title: Text(widget.title),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Homepage(),
                ),
              );
              _animationController.reverse();
            },
          ),
        ],
      ),
    );
  }
}
