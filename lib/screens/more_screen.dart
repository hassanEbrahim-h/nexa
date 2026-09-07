import 'package:flutter/material.dart';
import '../widgets/common.dart';
import 'habit_screen.dart';
import 'finance_screen.dart';
import 'journal_screen.dart';
import 'calendar_screen.dart';
import 'statistics_screen.dart';
import 'achievements_screen.dart';
import 'settings_screen.dart';

class MoreScreen extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;

  const MoreScreen({
    super.key,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      (
      'Habit Tracker',
      Icons.local_fire_department_rounded,
      const HabitScreen()
      ),
      (
      'Finance Tracker',
      Icons.account_balance_wallet_rounded,
      const FinanceScreen()
      ),
      (
      'Daily Journal',
      Icons.edit_note_rounded,
      const JournalScreen()
      ),
      (
      'Calendar',
      Icons.calendar_month_rounded,
      const CalendarScreen()
      ),
      (
      'Statistics',
      Icons.bar_chart_rounded,
      const StatisticsScreen()
      ),
      (
      'Achievements',
      Icons.emoji_events_rounded,
      const AchievementsScreen()
      ),
      (
      'Settings',
      Icons.settings_rounded,
      SettingsScreen(onThemeChanged: onThemeChanged)
      ),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'More',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: AppCard(
                      padding: EdgeInsets.zero,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(item.$2),
                        ),
                        title: Text(item.$1),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => item.$3,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}