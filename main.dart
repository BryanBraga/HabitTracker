import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'add_habit_screen.dart'; // Adicione esta linha

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoramento de Hábitos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitoramento de Hábitos'),
      ),
      body: const Center(
        child: Text('Bem-vindo ao Monitoramento de Hábitos!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdicionarHabitScreen()), // Verifique o nome da classe aqui
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
