import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/Components/modals.dart';
import 'package:testing/Components/mytext.dart';

import 'onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      // home: const Onboard(),
      routes: {
        '/': (context) => Mywidget(),
        'login': (context) => const Myname(),
        'onboard': (context) => const Onboard(),
      },
      // home: Mywidget(),
    );
  }
}

// ignore: must_be_immutable
class Mywidget extends StatefulWidget {
  Mywidget({super.key});
  Mymodal modal = Mymodal();

  @override
  State<Mywidget> createState() => _MywidgetState();
}

class _MywidgetState extends State<Mywidget> {
  @override
  void initState() {
    toGo();
    super.initState();
  }

  void toGo() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    var ans = pref.getBool('appUsed');
    if (ans == true) {
      Navigator.pushNamed(context, 'login');
    } else {
      Navigator.pushNamed(context, 'onboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Screen title',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 3,
          titleSpacing: 0.5,
          backgroundColor: Colors.amber[900],
        ),
        backgroundColor: Colors.black12,
        body: Center(
          child: Padding(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () => {
                          Mymodal()
                              .showMyModal(context, 'This is my demo modal')
                        },
                    // ignore: prefer_const_constructors
                    child: MyText(color: Colors.orange, text: 'click')),
                ElevatedButton(
                    onPressed: () => {
                          MySecondModal().showMySpinal(context, 'Loading...'),
                        },
                    child: const MyText(color: Colors.orange, text: 'click me'))
              ],
            ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       MyText(color: Colors.blue, text: 'Samuel'),
            //       MyText(color: Colors.green, text: 'Samuel  green'),
            //       MyText(color: Colors.white, text: 'Samuel red'),
            //       Icon(
            //         Icons.accessibility_new_outlined,
            //         color: Colors.white,
            //       )
            //     ],
            //   ),
            // ),
          ),
        ));
  }
}

class Myname extends StatelessWidget {
  const Myname({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Text("Login page"));
  }
}
