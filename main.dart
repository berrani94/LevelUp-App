import 'package:flutter/material.dart';

void main() {
  runApp(LevelUpApp());
}

class LevelUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LevelUp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LevelUp')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to LevelUp!', style: TextStyle(fontSize: 22)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TasksPage()));
              },
              child: Text('View Tasks'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LevelsPage()));
              },
              child: Text('Membership Levels'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DepositPage()));
              },
              child: Text('Deposit USDT'),
            ),
          ],
        ),
      ),
    );
  }
}

class TasksPage extends StatelessWidget {
  final List<String> tasks = ['Example Task 1', 'Example Task 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Tasks')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]),
          );
        },
      ),
    );
  }
}

class LevelsPage extends StatelessWidget {
  final List<Map<String, dynamic>> levels = [
    {'level': 1, 'range': '100 - 300 USDT', 'profit': '2 - 6 USDT/day'},
    {'level': 2, 'range': '300 - 500 USDT', 'profit': '6 - 10 USDT/day'},
    {'level': 3, 'range': '500 - 800 USDT', 'profit': '10 - 15 USDT/day'},
    {'level': 4, 'range': '800 - 1400 USDT', 'profit': '15 - 20 USDT/day'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Membership Levels')),
      body: ListView.builder(
        itemCount: levels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Level ${levels[index]['level']}'),
            subtitle: Text('${levels[index]['range']} → ${levels[index]['profit']}'),
          );
        },
      ),
    );
  }
}

class DepositPage extends StatelessWidget {
  final String usdtAddress = 'TXxx-Your-TRC20-Address-Here';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deposit USDT')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Send USDT to the following address:', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            SelectableText(usdtAddress, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text('Send Proof of Payment'),
            ),
          ],
        ),
      ),
    );
  }
}