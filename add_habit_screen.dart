import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdicionarHabitScreen  extends StatefulWidget {
  @override
  _AdicionarScreenState createState() => _AdicionarScreenState();
}

class _AdicionarScreenState extends State<AdicionarHabitScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String _frequency = 'Diário';

  void _addHabit() {
    if (_formKey.currentState!.validate()) {
      FirebaseFirestore.instance.collection('habits').add({
        'name': _nameController.text,
        'frequency': _frequency,
        'startDate': Timestamp.now(),
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Hábito'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome do Hábito'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o nome do hábito';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _frequency,
                decoration: const InputDecoration(labelText: 'Frequência'),
                items: ['Diário', 'Semanal', 'Mensal']
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _frequency = value!;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _addHabit,
                child: const Text('Adicionar Hábito'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
