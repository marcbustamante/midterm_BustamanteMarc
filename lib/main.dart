import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MarcLeobenzBustamante_MidtermExam',
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final List<Map<String, dynamic>> items = [
    {'name': 'Science', 'details': 'the study of the universe around us and within us', 'isAdded': false},
    {'name': 'Mathematics', 'details': 'the science that deals with the logic of shape', 'isAdded': false},
    {'name': 'History', 'details': 'an academic discipline which uses a narrative to describe, examine, question, and analyze past events, and investigate', 'isAdded': false},
    {'name': 'English', 'details': 'the in-depth study of written and verbal communication in English', 'isAdded': false},
    {'name': 'PE', 'details': 'the course where students learn about fitness, the state of being physically healthy, and developing physical fitness.', 'isAdded': false},
    {'name': 'IT', 'details': 'is a set of related fields that encompass computer systems, software, programming languages, and data and information processing.', 'isAdded': false},
    {'name': 'TLE', 'details': 'one of the learning areas of the Secondary Education Curriculum used in Philippine secondary schools.', 'isAdded': false},
    {'name': 'Law', 'details': 'the holder of the rights and obligations under the law which can be either individuals (persons) or legal entities (companies, organizations, institutions).', 'isAdded': false},
    {'name': 'Psychology', 'details': 'the study of the connections between the mind and behavior.', 'isAdded': false},
    {'name': 'Cooking', 'details': 'The scientific study of cooking has become known as molecular gastronomy.', 'isAdded': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MarcLeobenzBustamante_MidtermExam'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ItemCard(
              item: items[index],
              onDetailsPressed: () {
                print(items[index]['details']);
              },
              onAddPressed: () {
                setState(() {
                  items[index]['isAdded'] = !items[index]['isAdded'];
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onDetailsPressed;
  final VoidCallback onAddPressed;

  ItemCard({required this.item, required this.onDetailsPressed, required this.onAddPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: item['isAdded'] ? const Color.fromARGB(255, 244, 93, 0) : Colors.white,
      child: ListTile(
        title: Text(item['name']),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: onDetailsPressed,
              child: Text('Details'),
            ),
            TextButton(
              onPressed: onAddPressed,
              child: Text(item['isAdded'] ? 'Added' : 'Add'),
            ),
          ],
        ),
      ),
    );
  }
}
