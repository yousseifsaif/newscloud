import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:newscloud/provider/mood_provider.dart';
import 'package:newscloud/screens/Proflie.dart';
import 'package:newscloud/screens/Setting.dart';
import 'package:newscloud/screens/currency.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import '../category/CategoryList.dart';
import 'Services/notification.dart';
import 'Services/theme.dart';
import 'category/news_list_view_builder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  tz.initializeTimeZones();
  MoodProvider objMood = MoodProvider();
  runApp(ChangeNotifierProvider(create: (context) => objMood, child:const MyApp()));
  objMood.getTheme();
  const MaterialApp(debugShowCheckedModeBanner: false);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeAnimationStyle: AnimationStyle(curve: Curves.decelerate,duration:const Duration(seconds: 2)),
      theme: Provider.of<MoodProvider>(context).isLightMode
          ? MyTheme.lightTheme
          : MyTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: Homepage(Provider.of<MoodProvider>(context).isLightMode),
    );
  }
}

class Homepage extends StatefulWidget {
  static const String pageRoute = 'homeScreen';
  bool isLight;

  Homepage(this.isLight, {super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
Future<void> onRefresh()async{
return await Future.delayed(const Duration(seconds: 2));
}
class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Provider.of<MoodProvider>(context).isLightMode
            ? MyTheme.lightTheme
            : MyTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "News",
                  style: TextStyle( color: Color.fromARGB(255, 104, 100, 100)),
                ),
                Text(
                  "Cloud",
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: const GNavExample(),
        ));
  }
}

class GNavExample extends StatefulWidget {
  const GNavExample({super.key});

  @override
  _GNavExampleState createState() => _GNavExampleState();
}
class _GNavExampleState extends State<GNavExample> {
  int _selectedIndex = 0;

  // Pages for Bottom Navigation
  final List<Widget> _pages = [
    const HomePage(),
    const CurrencyPage(),
    const SettingsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: Padding(
        padding: const  EdgeInsets.fromLTRB(10,3,10,6),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GNav(
            gap: 8,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 13),
            backgroundColor: const Color.fromARGB(255, 239, 238, 238),
            tabBackgroundColor: const Color.fromARGB(69, 193, 189, 189),
            activeColor: Colors.blue,
            color: Colors.black,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.currency_exchange,
                text: 'Currency',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}




  @override
  Widget build(Object context) {

    throw UnimplementedError();
  }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return
LiquidPullToRefresh(
  onRefresh: onRefresh,
  height: 200,
  animSpeedFactor: 2,
  backgroundColor: Colors.black,
  color: Colors.grey,
  borderWidth: 5,
  showChildOpacityTransition: false,
  springAnimationDurationInMilliseconds: 2500,

  child:
      ListView(
      children: const [
        Categorylist(),
        SizedBox(
          height: 32,
        ),
        NewListViewBuilder(
          category: 'general',
        ),
      ],
    ));
  }
}


