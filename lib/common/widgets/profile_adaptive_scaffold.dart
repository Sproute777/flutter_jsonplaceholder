import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
// import '../../features/generated/l10n.dart';
// import '../../features/generated/my_flutter_app_icons.dart';

class ProfileAdaptiveScaffold extends StatefulWidget {
  final Widget Function(BuildContext) body;
  final void Function(int) onSelectedIndexChange;
  final int selectedIndex;

  const ProfileAdaptiveScaffold({
    Key? key,
    required this.body,
    required this.onSelectedIndexChange,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<ProfileAdaptiveScaffold> createState() =>
      _ProfileAdaptiveScaffoldState();
}

class _ProfileAdaptiveScaffoldState extends State<ProfileAdaptiveScaffold> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      internalAnimations: false,
      // An option to override the default breakpoints used for small, medium,
      // and large.
      smallBreakpoint: const WidthPlatformBreakpoint(end: 700),
      mediumBreakpoint: const WidthPlatformBreakpoint(begin: 700, end: 1000),
      largeBreakpoint: const WidthPlatformBreakpoint(begin: 1000),
      useDrawer: false,
      selectedIndex: widget.selectedIndex,
      onSelectedIndexChange: widget.onSelectedIndexChange,
      destinations: <NavigationDestination>[
        NavigationDestination(
          icon: const Icon(Icons.person),
          label: 'S.of(context).person',
        ),
        NavigationDestination(
          icon: const Icon(Icons.message),
          label: 'S.of(context).posts',
        ),
        NavigationDestination(
          icon: const Icon(Icons.collections),
          label: 'S.of(context).albums',
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings),
          label: 'S.of(context).settingsTab',
        ),
      ],
      body: widget.body,
      // secondaryBody: (_) => Container(
      //   color: const Color.fromARGB(255, 234, 158, 192),
      // ),
      // Override the default secondaryBody during the smallBreakpoint to be
      // empty. Must use AdaptiveScaffold.emptyBuilder to ensure it is properly
      // overridden.
      smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
    );
  }
}
