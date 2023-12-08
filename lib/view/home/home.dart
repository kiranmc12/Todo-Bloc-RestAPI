import 'package:flutter/material.dart';
import 'package:todo_bloc/view/screen_add/screen_add.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key});

  get kHeight20 => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "All Notes",
          style: TextStyle(fontSize: 25,color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            // Replace TodoCardTileWidget with your desired UI widget
            return ListTile(
              title: Text("Note ${index + 1}",style: TextStyle(color: Colors.white),),
              // Add other UI elements as needed
            );
          },
          itemCount: 10, // Replace with the actual number of notes or items
          separatorBuilder: (context, index) => SizedBox(height: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenAdd(),
          ),
        ),
      ),
    );
  }
}
