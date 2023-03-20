
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification",style: TextStyle(color: Colors.red),),
         leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        )
        
        
      ,body: ListView(
        children:  const <Widget> [
           SizedBox(height: 10),
         Text('................................'),
       Divider(),
        Text('.................................'),
       Divider(),
        Text('.................................')

            
         ] )
        ,
      );
    
    
  }
}