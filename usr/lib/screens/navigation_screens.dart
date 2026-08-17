import 'package:flutter/material.dart';
import '../models/curriculum.dart';
import '../data/mock_data.dart';
import 'quiz_screen.dart';

class GradeSelectionScreen extends StatelessWidget {
  const GradeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MySchoolWork')),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: mockGrades.length,
          itemBuilder: (context, index) {
            final grade = mockGrades[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 4,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubjectSelectionScreen(grade: grade),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    grade.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SubjectSelectionScreen extends StatelessWidget {
  final Grade grade;

  const SubjectSelectionScreen({super.key, required this.grade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(grade.title)),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: grade.subjects.length,
          itemBuilder: (context, index) {
            final subject = grade.subjects[index];
            return Card(
              elevation: 4,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermSelectionScreen(subject: subject),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(subject.icon, style: const TextStyle(fontSize: 48)),
                      const SizedBox(height: 16),
                      Text(
                        subject.title,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TermSelectionScreen extends StatelessWidget {
  final Subject subject;

  const TermSelectionScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subject.title)),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: subject.terms.length,
          itemBuilder: (context, index) {
            final term = subject.terms[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 4,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeekSelectionScreen(term: term),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month, size: 48, color: Colors.blue),
                      const SizedBox(width: 16),
                      Text(
                        term.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class WeekSelectionScreen extends StatelessWidget {
  final Term term;

  const WeekSelectionScreen({super.key, required this.term});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(term.title)),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: term.weeks.length,
          itemBuilder: (context, index) {
            final week = term.weeks[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 4,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ActivitySelectionScreen(week: week),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      const Icon(Icons.view_week, size: 48, color: Colors.purple),
                      const SizedBox(width: 16),
                      Text(
                        week.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ActivitySelectionScreen extends StatelessWidget {
  final Week week;

  const ActivitySelectionScreen({super.key, required this.week});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(week.title)),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: week.activities.length,
          itemBuilder: (context, index) {
            final activity = week.activities[index];
            return Card(
              elevation: 4,
              color: Colors.orange.shade100,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(activity: activity),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(activity.icon, style: const TextStyle(fontSize: 48)),
                      const SizedBox(height: 16),
                      Text(
                        activity.title,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
