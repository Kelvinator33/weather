import 'package:flutter/material.dart';
import 'package:weather/constants/design.dart';
import 'package:weather/screens/search_screen.dart';
import 'package:weather/screens/home_detail_screen.dart';
import 'package:weather/screens/settings_screen.dart';

/// This class represents the main home screen of the weather app.
class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

/// State class for the homescreen widget, managing the UI state and behavior.
class _homescreenState extends State<homescreen> {
  int cp = 0; // Current page index for the navigation bar.
  bool isCelsius = true; // State variable to toggle temperature unit between Celsius and Fahrenheit.

  /// List of navigation destinations for the bottom navigation bar.
  final _destination = const [
    NavigationDestination(
      icon: Icon(Icons.home, color: AppColors.grey),
      selectedIcon: Icon(Icons.home, color: AppColors.grey),
      label: '',
    ),
    NavigationDestination(
      icon: Icon(Icons.search, color: AppColors.grey),
      selectedIcon: Icon(Icons.search, color: AppColors.grey),
      label: '',
    ),
    NavigationDestination(
      icon: Icon(Icons.settings, color: AppColors.grey),
      selectedIcon: Icon(Icons.settings, color: AppColors.grey),
      label: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    /// List of screens corresponding to the navigation destinations.
    final screens = [
      weatherscreen(isCelsius: isCelsius), // Home weather screen, passing the isCelsius state.
      const searchscreen(), // Search screen.
      AboutUsPage(), // Settings/About Us page.
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'), // App bar title.
        actions: [
          IconButton(
            icon: Icon(isCelsius ? Icons.thermostat : Icons.thermostat_outlined), // Toggle icon for temperature unit.
            onPressed: () {
              setState(() {
                isCelsius = !isCelsius; // Toggle temperature unit state.
              });
            },
          ),
        ],
        backgroundColor: AppColors.glossyBlack, // App bar background color.
      ),
      body: screens[cp], // Display the screen based on the current page index.
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          backgroundColor: AppColors.matteBlack, // Background color for the navigation bar.
        ),
        child: NavigationBar(
          destinations: _destination, // Navigation destinations.
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide, // Hide labels for the navigation items.
          selectedIndex: cp, // Currently selected index.
          indicatorColor: Colors.transparent, // No indicator color.
          onDestinationSelected: (index) {
            setState(() {
              cp = index; // Update the current page index on destination selection.
            });
          },
        ),
      ),
    );
  }
}