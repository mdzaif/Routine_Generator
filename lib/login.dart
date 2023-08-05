import 'package:flutter/material.dart';
import 'HomePage.dart';

//firebase packages
import 'package:cloud_firestore/cloud_firestore.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Routine Generator',
      theme: ThemeData(
        brightness: Brightness.dark, // Enable dark mode
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isLoading = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animationController.repeat(reverse: true);
  }

  // Show sign in result dialog
  void _showLoginResultDialog(bool success) {
    Navigator.pop(context); // Close loading dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(success ? 'Sign in Successful' : 'Incorrect Credentials'),
          content: Text(success
              ? 'Welcome, ${_usernameController.text}!'
              : 'Please check your username and password.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                if (success) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  // Handle sign in process
  Future<void> _handleSignIn() async {
    setState(() {
      _isLoading = true;
    });

    await FirebaseFirestore.instance
        .collection('Admin')
        .doc('wuxCQENIybJB5JCPR98V')
        .get()
        .then((element) {
      if (element.data()?['username'] == _usernameController.text &&
          element.data()?['password'] == _passwordController.text) {
        _showLoginResultDialog(true);
      } else {
        _showLoginResultDialog(false);
      }
    }).catchError((error) {
      print("Error: $error");
      _showLoginResultDialog(false);
    });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Design for Sign in page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routine Generator'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/pciu.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  controller: _usernameController,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  controller: _passwordController,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _isLoading ? null : _handleSignIn,
                child: _isLoading
                    ? CircularProgressIndicator(
                        //strokeWidth: 4.5,
                        //semanticsLabel: 'Signning in...',
                        ) // Show loading indicator
                    : const Text('Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
