# Floating Action Bubble Custom

A Flutter package to create an animated menu using a Floating Action Button.


![Showcase](https://imgur.com/IbinJsI.gif)

## Example

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating Action Bubble Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: MyHomePage(title: 'Floating Action Bubble Demo'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );
    final curvedAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _animationController,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      //Init Floating Action Bubble
      floatingActionButton: FloatingActionBubble(
        // animation controller
        animation: _animation,
        // On pressed change animation state
        onPressed: () => _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward(),
        // Floating Action button Icon color
        iconColor: Colors.blue,
        // Flaoting Action button Icon
        iconData: Icons.ac_unit,
        backgroundColor: Colors.white,
        // Menu items
        items: <Widget>[
          // Floating action menu item
          BubbleMenu(
            title: 'Settings',
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.settings,
            titleStyle: TextStyle(fontSize: 16 , color: Colors.white),
            onPressed: () {
              _animationController.reverse();
            },
          ),
          // Floating action menu item
          BubbleMenu(
            title: 'Profile',
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.people,
            titleStyle: TextStyle(fontSize: 16 , color: Colors.white),
            onPressed: () {
              _animationController.reverse();
            },
          ),
          //Floating action menu item
          BubbleMenu(
            title: 'Home',
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.home,
            titleStyle: TextStyle(fontSize: 16 , color: Colors.white),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Homepage()));
              _animationController.reverse();
            },
          ),
        ],
      )
    );
  }

}
```

You can check for a more complete example in the [example](https://github.com/NazarenoCavazzon/FloatingActionBubbleCustom/master/example) directory.

## Customize
You can use the pre-built BubbleMenu or your own widget :).

