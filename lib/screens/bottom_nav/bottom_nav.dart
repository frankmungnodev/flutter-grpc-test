import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    required this.shell,
    super.key,
  });

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: shell.goBranch,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.message_outlined),
            label: 'Chat1',
          ),
          NavigationDestination(
            icon: Icon(Icons.message_outlined),
            label: 'Chat2',
          ),
        ],
      ),
    );
  }
}
