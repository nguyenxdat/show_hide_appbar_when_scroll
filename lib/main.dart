import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;
  bool _showBottomBar = true;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(_calScroll);
  }

  void _calScroll() {
    if (_scrollViewController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!isScrollingDown) {
        isScrollingDown = true;
        _showAppbar = false;
        _showBottomBar = false;
        setState(() {});
      }
    }

    if (_scrollViewController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (isScrollingDown) {
        isScrollingDown = false;
        _showAppbar = true;
        _showBottomBar = true;
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    _scrollViewController.removeListener(_calScroll);
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ActionBar(showAppbar: _showAppbar),
            Content(scrollViewController: _scrollViewController),
            BottomBar(showBottomBar: _showBottomBar)
          ],
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required bool showBottomBar,
  }) : _showBottomBar = showBottomBar, super(key: key);

  final bool _showBottomBar;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.red,
      height: _showBottomBar ? 56.0 : 0.0,
      duration: Duration(milliseconds: 200),
      child: Center(
        child: Text('Bottom bar'),
      ),
    );
  }
}

class ActionBar extends StatelessWidget {
  const ActionBar({
    Key? key,
    required bool showAppbar,
  })   : _showAppbar = showAppbar,
        super(key: key);

  final bool _showAppbar;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: _showAppbar ? 56.0 : 0.0,
      duration: Duration(milliseconds: 200),
      child: AppBar(
        title: Text('Scroll Demo'),
        actions: <Widget>[
          //add buttons here
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key? key,
    required ScrollController scrollViewController,
  })   : _scrollViewController = scrollViewController,
        super(key: key);

  final ScrollController _scrollViewController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: _scrollViewController,
        child: Column(
          children: <Widget>[
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at massa ac urna pellentesque viverra. In non sem tempus, feugiat sem eu, blandit nunc. Sed fringilla felis id eros tincidunt feugiat. Proin aliquam elit dolor, at lobortis diam scelerisque sit amet. Vivamus nec fringilla tellus. Morbi condimentum ipsum sed libero facilisis interdum. Proin nec tempor ante, eu tempor velit. Donec ut maximus nulla. Praesent dignissim molestie leo ut malesuada. Sed accumsan enim a purus suscipit, ut blandit enim vestibulum. Phasellus commodo felis ante, ut sollicitudin sem ultricies sit amet. Aenean id justo id sem euismod semper. Mauris nunc tortor, consectetur eu nibh eu, elementum finibus felis. Pellentesque quis mauris eu nisi pharetra auctor. Nam nulla mauris, rhoncus scelerisque lorem tempor, varius fringilla libero. In congue diam sit amet orci dapibus, quis cursus nunc iaculis.'),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at massa ac urna pellentesque viverra. In non sem tempus, feugiat sem eu, blandit nunc. Sed fringilla felis id eros tincidunt feugiat. Proin aliquam elit dolor, at lobortis diam scelerisque sit amet. Vivamus nec fringilla tellus. Morbi condimentum ipsum sed libero facilisis interdum. Proin nec tempor ante, eu tempor velit. Donec ut maximus nulla. Praesent dignissim molestie leo ut malesuada. Sed accumsan enim a purus suscipit, ut blandit enim vestibulum. Phasellus commodo felis ante, ut sollicitudin sem ultricies sit amet. Aenean id justo id sem euismod semper. Mauris nunc tortor, consectetur eu nibh eu, elementum finibus felis. Pellentesque quis mauris eu nisi pharetra auctor. Nam nulla mauris, rhoncus scelerisque lorem tempor, varius fringilla libero. In congue diam sit amet orci dapibus, quis cursus nunc iaculis.'),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at massa ac urna pellentesque viverra. In non sem tempus, feugiat sem eu, blandit nunc. Sed fringilla felis id eros tincidunt feugiat. Proin aliquam elit dolor, at lobortis diam scelerisque sit amet. Vivamus nec fringilla tellus. Morbi condimentum ipsum sed libero facilisis interdum. Proin nec tempor ante, eu tempor velit. Donec ut maximus nulla. Praesent dignissim molestie leo ut malesuada. Sed accumsan enim a purus suscipit, ut blandit enim vestibulum. Phasellus commodo felis ante, ut sollicitudin sem ultricies sit amet. Aenean id justo id sem euismod semper. Mauris nunc tortor, consectetur eu nibh eu, elementum finibus felis. Pellentesque quis mauris eu nisi pharetra auctor. Nam nulla mauris, rhoncus scelerisque lorem tempor, varius fringilla libero. In congue diam sit amet orci dapibus, quis cursus nunc iaculis.'),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at massa ac urna pellentesque viverra. In non sem tempus, feugiat sem eu, blandit nunc. Sed fringilla felis id eros tincidunt feugiat. Proin aliquam elit dolor, at lobortis diam scelerisque sit amet. Vivamus nec fringilla tellus. Morbi condimentum ipsum sed libero facilisis interdum. Proin nec tempor ante, eu tempor velit. Donec ut maximus nulla. Praesent dignissim molestie leo ut malesuada. Sed accumsan enim a purus suscipit, ut blandit enim vestibulum. Phasellus commodo felis ante, ut sollicitudin sem ultricies sit amet. Aenean id justo id sem euismod semper. Mauris nunc tortor, consectetur eu nibh eu, elementum finibus felis. Pellentesque quis mauris eu nisi pharetra auctor. Nam nulla mauris, rhoncus scelerisque lorem tempor, varius fringilla libero. In congue diam sit amet orci dapibus, quis cursus nunc iaculis.'),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at massa ac urna pellentesque viverra. In non sem tempus, feugiat sem eu, blandit nunc. Sed fringilla felis id eros tincidunt feugiat. Proin aliquam elit dolor, at lobortis diam scelerisque sit amet. Vivamus nec fringilla tellus. Morbi condimentum ipsum sed libero facilisis interdum. Proin nec tempor ante, eu tempor velit. Donec ut maximus nulla. Praesent dignissim molestie leo ut malesuada. Sed accumsan enim a purus suscipit, ut blandit enim vestibulum. Phasellus commodo felis ante, ut sollicitudin sem ultricies sit amet. Aenean id justo id sem euismod semper. Mauris nunc tortor, consectetur eu nibh eu, elementum finibus felis. Pellentesque quis mauris eu nisi pharetra auctor. Nam nulla mauris, rhoncus scelerisque lorem tempor, varius fringilla libero. In congue diam sit amet orci dapibus, quis cursus nunc iaculis.'),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at massa ac urna pellentesque viverra. In non sem tempus, feugiat sem eu, blandit nunc. Sed fringilla felis id eros tincidunt feugiat. Proin aliquam elit dolor, at lobortis diam scelerisque sit amet. Vivamus nec fringilla tellus. Morbi condimentum ipsum sed libero facilisis interdum. Proin nec tempor ante, eu tempor velit. Donec ut maximus nulla. Praesent dignissim molestie leo ut malesuada. Sed accumsan enim a purus suscipit, ut blandit enim vestibulum. Phasellus commodo felis ante, ut sollicitudin sem ultricies sit amet. Aenean id justo id sem euismod semper. Mauris nunc tortor, consectetur eu nibh eu, elementum finibus felis. Pellentesque quis mauris eu nisi pharetra auctor. Nam nulla mauris, rhoncus scelerisque lorem tempor, varius fringilla libero. In congue diam sit amet orci dapibus, quis cursus nunc iaculis.'),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at massa ac urna pellentesque viverra. In non sem tempus, feugiat sem eu, blandit nunc. Sed fringilla felis id eros tincidunt feugiat. Proin aliquam elit dolor, at lobortis diam scelerisque sit amet. Vivamus nec fringilla tellus. Morbi condimentum ipsum sed libero facilisis interdum. Proin nec tempor ante, eu tempor velit. Donec ut maximus nulla. Praesent dignissim molestie leo ut malesuada. Sed accumsan enim a purus suscipit, ut blandit enim vestibulum. Phasellus commodo felis ante, ut sollicitudin sem ultricies sit amet. Aenean id justo id sem euismod semper. Mauris nunc tortor, consectetur eu nibh eu, elementum finibus felis. Pellentesque quis mauris eu nisi pharetra auctor. Nam nulla mauris, rhoncus scelerisque lorem tempor, varius fringilla libero. In congue diam sit amet orci dapibus, quis cursus nunc iaculis.'),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at massa ac urna pellentesque viverra. In non sem tempus, feugiat sem eu, blandit nunc. Sed fringilla felis id eros tincidunt feugiat. Proin aliquam elit dolor, at lobortis diam scelerisque sit amet. Vivamus nec fringilla tellus. Morbi condimentum ipsum sed libero facilisis interdum. Proin nec tempor ante, eu tempor velit. Donec ut maximus nulla. Praesent dignissim molestie leo ut malesuada. Sed accumsan enim a purus suscipit, ut blandit enim vestibulum. Phasellus commodo felis ante, ut sollicitudin sem ultricies sit amet. Aenean id justo id sem euismod semper. Mauris nunc tortor, consectetur eu nibh eu, elementum finibus felis. Pellentesque quis mauris eu nisi pharetra auctor. Nam nulla mauris, rhoncus scelerisque lorem tempor, varius fringilla libero. In congue diam sit amet orci dapibus, quis cursus nunc iaculis.'),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at massa ac urna pellentesque viverra. In non sem tempus, feugiat sem eu, blandit nunc. Sed fringilla felis id eros tincidunt feugiat. Proin aliquam elit dolor, at lobortis diam scelerisque sit amet. Vivamus nec fringilla tellus. Morbi condimentum ipsum sed libero facilisis interdum. Proin nec tempor ante, eu tempor velit. Donec ut maximus nulla. Praesent dignissim molestie leo ut malesuada. Sed accumsan enim a purus suscipit, ut blandit enim vestibulum. Phasellus commodo felis ante, ut sollicitudin sem ultricies sit amet. Aenean id justo id sem euismod semper. Mauris nunc tortor, consectetur eu nibh eu, elementum finibus felis. Pellentesque quis mauris eu nisi pharetra auctor. Nam nulla mauris, rhoncus scelerisque lorem tempor, varius fringilla libero. In congue diam sit amet orci dapibus, quis cursus nunc iaculis.'),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at massa ac urna pellentesque viverra. In non sem tempus, feugiat sem eu, blandit nunc. Sed fringilla felis id eros tincidunt feugiat. Proin aliquam elit dolor, at lobortis diam scelerisque sit amet. Vivamus nec fringilla tellus. Morbi condimentum ipsum sed libero facilisis interdum. Proin nec tempor ante, eu tempor velit. Donec ut maximus nulla. Praesent dignissim molestie leo ut malesuada. Sed accumsan enim a purus suscipit, ut blandit enim vestibulum. Phasellus commodo felis ante, ut sollicitudin sem ultricies sit amet. Aenean id justo id sem euismod semper. Mauris nunc tortor, consectetur eu nibh eu, elementum finibus felis. Pellentesque quis mauris eu nisi pharetra auctor. Nam nulla mauris, rhoncus scelerisque lorem tempor, varius fringilla libero. In congue diam sit amet orci dapibus, quis cursus nunc iaculis.'),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at massa ac urna pellentesque viverra. In non sem tempus, feugiat sem eu, blandit nunc. Sed fringilla felis id eros tincidunt feugiat. Proin aliquam elit dolor, at lobortis diam scelerisque sit amet. Vivamus nec fringilla tellus. Morbi condimentum ipsum sed libero facilisis interdum. Proin nec tempor ante, eu tempor velit. Donec ut maximus nulla. Praesent dignissim molestie leo ut malesuada. Sed accumsan enim a purus suscipit, ut blandit enim vestibulum. Phasellus commodo felis ante, ut sollicitudin sem ultricies sit amet. Aenean id justo id sem euismod semper. Mauris nunc tortor, consectetur eu nibh eu, elementum finibus felis. Pellentesque quis mauris eu nisi pharetra auctor. Nam nulla mauris, rhoncus scelerisque lorem tempor, varius fringilla libero. In congue diam sit amet orci dapibus, quis cursus nunc iaculis.'),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at massa ac urna pellentesque viverra. In non sem tempus, feugiat sem eu, blandit nunc. Sed fringilla felis id eros tincidunt feugiat. Proin aliquam elit dolor, at lobortis diam scelerisque sit amet. Vivamus nec fringilla tellus. Morbi condimentum ipsum sed libero facilisis interdum. Proin nec tempor ante, eu tempor velit. Donec ut maximus nulla. Praesent dignissim molestie leo ut malesuada. Sed accumsan enim a purus suscipit, ut blandit enim vestibulum. Phasellus commodo felis ante, ut sollicitudin sem ultricies sit amet. Aenean id justo id sem euismod semper. Mauris nunc tortor, consectetur eu nibh eu, elementum finibus felis. Pellentesque quis mauris eu nisi pharetra auctor. Nam nulla mauris, rhoncus scelerisque lorem tempor, varius fringilla libero. In congue diam sit amet orci dapibus, quis cursus nunc iaculis.'),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at massa ac urna pellentesque viverra. In non sem tempus, feugiat sem eu, blandit nunc. Sed fringilla felis id eros tincidunt feugiat. Proin aliquam elit dolor, at lobortis diam scelerisque sit amet. Vivamus nec fringilla tellus. Morbi condimentum ipsum sed libero facilisis interdum. Proin nec tempor ante, eu tempor velit. Donec ut maximus nulla. Praesent dignissim molestie leo ut malesuada. Sed accumsan enim a purus suscipit, ut blandit enim vestibulum. Phasellus commodo felis ante, ut sollicitudin sem ultricies sit amet. Aenean id justo id sem euismod semper. Mauris nunc tortor, consectetur eu nibh eu, elementum finibus felis. Pellentesque quis mauris eu nisi pharetra auctor. Nam nulla mauris, rhoncus scelerisque lorem tempor, varius fringilla libero. In congue diam sit amet orci dapibus, quis cursus nunc iaculis.'),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at massa ac urna pellentesque viverra. In non sem tempus, feugiat sem eu, blandit nunc. Sed fringilla felis id eros tincidunt feugiat. Proin aliquam elit dolor, at lobortis diam scelerisque sit amet. Vivamus nec fringilla tellus. Morbi condimentum ipsum sed libero facilisis interdum. Proin nec tempor ante, eu tempor velit. Donec ut maximus nulla. Praesent dignissim molestie leo ut malesuada. Sed accumsan enim a purus suscipit, ut blandit enim vestibulum. Phasellus commodo felis ante, ut sollicitudin sem ultricies sit amet. Aenean id justo id sem euismod semper. Mauris nunc tortor, consectetur eu nibh eu, elementum finibus felis. Pellentesque quis mauris eu nisi pharetra auctor. Nam nulla mauris, rhoncus scelerisque lorem tempor, varius fringilla libero. In congue diam sit amet orci dapibus, quis cursus nunc iaculis.'),
          ],
        ),
      ),
    );
  }
}
