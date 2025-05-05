import 'package:flutter/material.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _emailInput = '';

  // Controller untuk EditText/TextField
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _updateSearchQuery(String text) {
    setState(() {
      _emailInput = text;
    });
    print('Searching for: $_emailInput');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: width,
                height: height * 0.45,
                child: Image.network(
                  'https://media-hosting.imagekit.io/1b5d57a4229644fa/pokemon-banner.jpg?Expires=1840987701&Key-Pair-Id=K2ZIVPTIP2VGHC&Signature=eGWEfgC63Quglf8BUGA8Ek7Nqs2VZH5h1f4PLDNxwj3jw7RycVBIuypad3VUg4NAAkSI3TWMQy8zkAn8XEwdqyuOEjpePEtS1ArHS1rSg9PdIbSSx6RgApbOl9SHlQ28HV56R4QunpSFXISd62k4kI1w~aRrw6~qpThdJW3DjXqv2tT0-20rEbMF6gK9pux8vKZdzh4mhKlGCcejUVnreKs~pfbLBT~g~SKGs8sidRTBXPNsGQDdnxdD4Ps1pFRXjSi6Tj4E62bPynT5m6nstv4XOHJgN80gKFeJ1Dob3u9Qk8Znq3HdU-wPQTj-DeepDe2TyEt54wR9OvE-xf4Ttg__',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              TextField(
                controller: _searchController,
                onChanged: _updateSearchQuery,
                decoration: InputDecoration(
                  hintText: 'Email',
                  suffixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Forget password?', style: TextStyle(fontSize: 12.0)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                      ),
                      child: const Text('Login'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Selamat Datang, $_emailInput'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selamat Datang, $_emailInput')),
                  );
                },
                child: Text.rich(
                  TextSpan(
                    text: 'Don\'t have an account? ',
                    children: [
                      TextSpan(
                        text: 'Signup',
                        style: TextStyle(color: Color(0xffEE7B23)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
