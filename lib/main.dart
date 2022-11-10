import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Contatos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final avatar = const CircleAvatar(
    backgroundImage: NetworkImage(
        'https://www.ofuxico.com.br/wp-content/uploads/2022/09/Taylor-Swift-Midnights-album.jpg'),
    radius: 150,
  );

  final nome = const Text(
    'Taylor Midnights',
    style: TextStyle(
      fontSize: 30,
      color: Colors.deepPurpleAccent,
    ),
    textAlign: TextAlign.center,
  );

  final botaoTelefone = IconButton(
    onPressed: () {
      launchUrl(Uri(scheme: 'tel', path: '99999-9999'));
    },
    icon: const Icon(Icons.phone),
    color: Colors.deepPurpleAccent,
  );

  final botaoEmail = IconButton(
    onPressed: () {
      launchUrl(Uri(scheme: 'mailto', path: 'tayswift13@gmail.com'));
    },
    icon: const Icon(Icons.mail),
    color: Colors.deepPurpleAccent,
  );

  final botaoSMS = IconButton(
    onPressed: () {
      launchUrl(Uri(scheme: 'sms', path: '99999-9999'));
    },
    icon: const Icon(Icons.sms),
    color: Colors.deepPurpleAccent,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Contatos',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          avatar,
          SizedBox(
            height: 20,
          ),
          nome,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              botaoTelefone,
              botaoEmail,
              botaoSMS,
            ],
          )
        ],
      ),
    );
  }
}
