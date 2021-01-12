import 'package:flutter/material.dart';

class AddCommodity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController mycontroller = TextEditingController();
    TextEditingController mycontroller1 = TextEditingController();
    TextEditingController mycontroller2 = TextEditingController();
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter Your Name',
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter Your Name',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
