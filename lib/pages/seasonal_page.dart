import 'package:flutter/material.dart';

class SeasonalPage extends StatelessWidget {
  const SeasonalPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: TextFormField(),
          ),
          SingleChildScrollView(
            child: Column(
              
            ),
          ),
        ],
      ),
      
    );
  }
}