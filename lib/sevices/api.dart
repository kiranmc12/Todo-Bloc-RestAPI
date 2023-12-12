import 'dart:convert';

import 'package:todo_bloc/model/todo_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  ApiServices._();
  static final ApiServices instance = ApiServices._();

  factory ApiServices() => instance;

  static const String endpoint = "https://api.nstack.in/v1/todos";

  Future<List<Todo>> fetchTodos() async {
    try {
      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> items = responseData['items'];
        return items.map((json) => Todo.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch todos');
      }
    } catch (e) {
      print('Error fetching todos: $e');
      throw Exception('Failed to fetch todos');
    }
  }

  Future<void> createTodo(Todo todo) async {
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        body: {
          'title': todo.title,
          'description': todo.description,
          'is_completed': 'true',
        },
      );

      if (response.statusCode == 201) {
        print("Todo Created");
      } else {
        print('Failed to create todo ${response.statusCode}');
      }
    } catch (e) {
      print('Error creating todo: $e');
      throw Exception('Failed to create todo');
    }
  }
}
