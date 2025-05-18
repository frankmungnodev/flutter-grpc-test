import 'package:flutter/widgets.dart';
import 'package:flutter_grpc/screens/auth/auth_screen.dart';
import 'package:flutter_grpc/screens/bottom_nav/bottom_nav.dart';
import 'package:flutter_grpc/screens/chat_list_screen/view/chat_list_screen_page.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root_navigator_key',
);

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/chat1',
  routes: [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state, navigationShell) {
        return NoTransitionPage(
          child: BottomNav(
            shell: navigationShell,
          ),
        );
      },
      branches: [
        // Chat1
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/chat1',
              name: 'chat1',
              builder: (context, state) {
                return const AuthScreen(
                  label: 'Chat1 Auth',
                  chatListPath: 'chat1-list',
                );
              },
              routes: [
                GoRoute(
                  path: '/chat1-list',
                  name: 'chat1-list',
                  builder: (context, state) {
                    return ChatListScreenPage(userId: state.extra! as String);
                  },
                ),
              ],
            ),
          ],
        ),

        // Chat2
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/chat2',
              name: 'chat2',
              builder: (context, state) {
                return const AuthScreen(
                  label: 'Chat2 Auth',
                  chatListPath: 'chat2-list',
                );
              },
              routes: [
                GoRoute(
                  path: '/chat2-list',
                  name: 'chat2-list',
                  builder: (context, state) {
                    return ChatListScreenPage(userId: state.extra! as String);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
