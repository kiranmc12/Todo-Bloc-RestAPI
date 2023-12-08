import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc_bloc.dart';
import 'package:todo_bloc/view/screen_add/screen_add.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  const Text(
          "All Notes",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(8.0),
        child: BlocBuilder<TodoBlocBloc, TodoBlocState>(
          builder: (context, state) {
            return ListView.separated(
              itemBuilder: (context, index) {
              return const ListTile(
                  title: Text("Helloooo",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
              itemCount: 10, // Replace with the actual number of notes or items
              separatorBuilder: (context, index) => const SizedBox(height: 20),
            );
          },
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
