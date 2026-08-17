import 'package:flutter/material.dart';
import '../models/curriculum.dart';
import '../data/mock_data.dart';

class GradeSelectionScreen extends StatelessWidget {
  const GradeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MySchoolWork')),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: mockGrades.length,
          itemBuilder: (context, index) {
            final grade = mockGrades[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16),
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
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      grade.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
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
      appBar: AppBar(title: Text(grade.name)),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: grade.subjects.length,
          itemBuilder: (context, index) {
            final subject = grade.subjects[index];
            return Card(
              elevation: 4,
              color: Colors.blue.shade50,
              margin: const EdgeInsets.only(bottom: 16),
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
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      subject.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
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
      appBar: AppBar(title: Text(subject.name)),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: subject.terms.length,
          itemBuilder: (context, index) {
            final term = subject.terms[index];
            return Card(
              elevation: 4,
              color: Colors.green.shade50,
              margin: const EdgeInsets.only(bottom: 16),
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
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      term.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
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
      appBar: AppBar(title: Text(term.name)),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: term.weeks.length,
          itemBuilder: (context, index) {
            final week = term.weeks[index];
            return Card(
              elevation: 4,
              color: Colors.orange.shade50,
              margin: const EdgeInsets.only(bottom: 16),
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
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      week.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
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
      appBar: AppBar(title: Text(week.name)),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: week.activities.length,
          itemBuilder: (context, index) {
            final activity = week.activities[index];
            return Card(
              elevation: 4,
              color: Colors.purple.shade50,
              margin: const EdgeInsets.only(bottom: 16),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/quiz', arguments: activity);
                },
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      activity.name,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.purple.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
