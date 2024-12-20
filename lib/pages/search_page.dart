import 'package:flutter/material.dart';

class MySearchPage extends StatelessWidget {
  const MySearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //search field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'search products, categories...',
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
