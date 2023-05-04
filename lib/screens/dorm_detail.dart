import 'package:flutter/material.dart';

class DormDetail extends StatefulWidget {
  const DormDetail({super.key});

  @override
  State<DormDetail> createState() => _DormDetailState();
}

class _DormDetailState extends State<DormDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: Stack(
          children: [
            Card(
              color: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 8,
              child: const Center(
                child: Text('1'),
              ),
            ),
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR00L8GRKSQVHDXAnex599APwTABc7_5WRD_w&usqp=CAU',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              right: 20.0,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(122, 150, 150, 150),
                  borderRadius: BorderRadius.circular(21.0),
                ),
                child: IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {
                    // Add your code here to handle the button press event
                    // For example, you can show a snackbar or navigate to a new screen
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
