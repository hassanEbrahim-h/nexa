import 'package:flutter/material.dart';
import '../widgets/common.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bars = [0.3, 0.45, 0.35, 0.6, 0.5, 0.75, 0.9];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Your Progress',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          Row(
            children: const [
              StatTile(
                value: '78%',
                label: 'Productivity',
                icon: Icons.trending_up,
              ),
              SizedBox(width: 10),
              StatTile(
                value: '18h',
                label: 'Focus Time',
                icon: Icons.timer,
              ),
            ],
          ),

          const SizedBox(height: 20),

          const SectionTitle('Weekly Activity'),

          const SizedBox(height: 14),

          AppCard(
            child: SizedBox(
              height: 220,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: bars.map((value) {
                  return FractionallySizedBox(
                    heightFactor: value,
                    child: Container(
                      width: 24,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          const SizedBox(height: 20),

          const SectionTitle('Summary'),

          const SizedBox(height: 10),

          const AppCard(
            child: ListTile(
              title: Text('Tasks Completed'),
              trailing: Text('28 / 32'),
            ),
          ),

          const SizedBox(height: 10),

          const AppCard(
            child: ListTile(
              title: Text('Habit Consistency'),
              trailing: Text('84%'),
            ),
          ),
        ],
      ),
    );
  }
}