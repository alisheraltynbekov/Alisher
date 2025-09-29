import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showFirstImage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image and Button Demo')),
      body: Stack(
        children: [
          Image.asset(
            showFirstImage ? 'assets/image1.jpg' : 'assets/image2.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(color: Colors.black54),
          const Center(
            child: Text(
              'Welcome to Flutter',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('SnackBar shown!')),
                );
              },
              child: const Text('Show SnackBar'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // TODO: Add navigation here if needed
              },
              child: const Text('Go to Second Screen'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                setState(() => showFirstImage = !showFirstImage);
              },
              child: const Text('Toggle Image'),
            ),
          ],
        ),
      ),
    );
  }
}
