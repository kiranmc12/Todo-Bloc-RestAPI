import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc_bloc.dart';
import 'package:todo_bloc/constants/constants.dart';
import 'package:todo_bloc/model/todo_model.dart';
import 'package:todo_bloc/view/widgets/text_field_widget.dart';

class ScreenAdd extends StatelessWidget {
  ScreenAdd({Key? key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Make Your Todo",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Kheight20,
                TextFieldWidget(
                  hintText: "Title",
                  controller: titleController,
                  height: 75,
                ),
                Kheight20,
                TextFieldWidget(
                  hintText: "Description",
                  maximumLine: 6,
                  height: 170,
                  controller: descriptionController,
                ),
                Kheight20,
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<TodoBlocBloc, TodoBlocState>(
                        builder: (context, state) {
                          if (state.isSaving) {
                            return SizedBox(
                              width: 255,
                              height: 45,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          return ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Color(0xFF2C3E50),
                                ),
                                fixedSize:
                                    MaterialStatePropertyAll(Size(100, 45))),
                            onPressed: () {
                              validate(context);
                            },
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.white, letterSpacing: 1),
                            ),
                          );
                        },
                      ),
                   
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validate(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final newTodo = Todo(
          title: titleController.text,
          description: descriptionController.text,
          isCompleted: true);

      try {
        context.read<TodoBlocBloc>().add(TodoAddEvent(todo: newTodo));
      } catch (e) {
        print(e.toString());
      }
      formKey.currentState!.reset();
    }
  }
}
