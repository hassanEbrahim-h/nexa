import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../widgets/common.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  void addTask() {
    final controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            24,
            24,
            24,
            24 + MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Task title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                text: 'Add Task',
                onTap: () {
                  if (controller.text.trim().isNotEmpty) {
                    setState(() {
                      tasks.add(
                        TaskItem(
                          controller.text.trim(),
                          'Anytime',
                          'Medium',
                          Icons.task_alt,
                        ),
                      );
                    });
                  }

                  Navigator.pop(ctx);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: addTask,
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Smart Planner',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                'Monday, 7 September',
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 18),

              SizedBox(
                height: 54,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    7,
                        (i) => Container(
                      width: 48,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: i == 0
                            ? const Color(0xFF6558F5)
                            : Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Text('${8 + i}'),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              const SectionTitle("Today's Schedule"),

              const SizedBox(height: 10),

              Expanded(
                child: ListView(
                  children: tasks.map((task) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: AppCard(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            child: Icon(task.icon),
                          ),
                          title: Text(task.title),
                          subtitle: Text(task.time),
                          trailing: Chip(
                            label: Text(task.level),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}