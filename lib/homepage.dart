import 'package:flutter/material.dart';
import 'package:test_pos_printer/print_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pos Printer'),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return const PrintPage();
                },
              ),
            );
          },
          child: const Text(
            'Print',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}
