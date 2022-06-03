import 'package:flutter/material.dart';

class DiscussionPage extends StatelessWidget {
  const DiscussionPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("No Discussions!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(.7)),),
          SizedBox(height: 20,),
          Image.asset("assets/images/package.png", width: 200,),
        ],
      ),)
    );
  }
}