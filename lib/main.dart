// import 'package:cruds/controller/update_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cruds/controller/delete_controller.dart';
// import 'package:cruds/controller/get_controller.dart';
// import 'package:cruds/view/get_screen.dart';
// import 'package:cruds/view/home_screen.dart';
// import 'package:cruds/view/post_screen.dart';

// void main() {
//   // Register both controllers
//   Get.put(GetController());
//   Get.put(DeleteController());
//   Get.put(UpdateController());

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'CRUD App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: '/',
//       getPages: [
//         GetPage(name: '/', page: () => const HomeScreen()),
//         GetPage(name: '/post', page: () => PostScreen()),
//         GetPage(name: '/get', page: () => const GetScreen()),
//         GetPage(name: '/updateScreen', page: () => const GetScreen()),
//       ],
//     );
//   }
// }


import 'package:cruds/controller/update_controller.dart'; // Import UpdateController for handling updates
import 'package:flutter/material.dart'; // Import Flutter material design for UI components
import 'package:get/get.dart'; // Import GetX for state management and navigation
import 'package:cruds/controller/delete_controller.dart'; // Import DeleteController to manage user deletions
import 'package:cruds/controller/get_controller.dart'; // Import GetController to manage fetching and updating users
import 'package:cruds/view/get_screen.dart'; // Import GetScreen for displaying users
import 'package:cruds/view/home_screen.dart'; // Import HomeScreen for the main menu
import 'package:cruds/view/post_screen.dart'; // Import PostScreen for creating users

// Main entry point for the Flutter app
void main() {      
  // Register GetController, DeleteController, and UpdateController globally using GetX's dependency injection
  Get.put(GetController()); // Handles data fetching
  Get.put(DeleteController()); // Handles data deletion 
  Get.put(UpdateController()); // Handles data updates 

  runApp(const MyApp()); // Run the MyApp widget
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Use GetMaterialApp from GetX for navigation and state management
      debugShowCheckedModeBanner: false, // Disable the debug banner in the app
      title: 'CRUD App', // Set the title of the application
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the primary color theme to blue
      ),
      initialRoute: '/', // Set the initial route to the home screen
      getPages: [
        // Define the route configurations for the application
        GetPage(name: '/', page: () => const HomeScreen()), // Home screen route
        GetPage(name: '/post', page: () => PostScreen()), // Route to the post screen for creating a new user
        GetPage(name: '/get', page: () => const GetScreen()), // Route to get all users
        GetPage(name: '/updateScreen', page: () => const GetScreen()), // Route to get users for updating (reuse GetScreen)
      ],
    );
  }
}
