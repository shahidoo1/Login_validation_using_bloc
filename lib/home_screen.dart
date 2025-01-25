import 'package:flutter/material.dart';

class HomeScreeen extends StatefulWidget {
  final String eamil;
  final String Passsword;
  const HomeScreeen({super.key, required this.eamil, required this.Passsword});

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Welcome"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display email and password from widget properties
                Text('Email: ${widget.eamil}'),
              ],
            ),
            const SizedBox(height: 10), // Add some spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Password: ${widget.Passsword}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
