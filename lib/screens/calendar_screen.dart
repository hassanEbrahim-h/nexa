import 'package:flutter/material.dart';
import '../widgets/common.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'September 2026',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 7,
              children: List.generate(
                30,
                    (i) {
                  return Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == 6 ? Colors.deepPurple : null,
                      ),
                      child: Text('${i + 1}'),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            const SectionTitle("Today's Schedule"),

            const SizedBox(height: 12),

            const AppCard(
              child: ListTile(
                leading: Icon(Icons.code),
                title: Text('Study Flutter'),
                subtitle: Text('2:00 PM'),
              ),
            ),

            const SizedBox(height: 10),

            const AppCard(
              child: ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text('Workout'),
                subtitle: Text('5:00 PM'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}