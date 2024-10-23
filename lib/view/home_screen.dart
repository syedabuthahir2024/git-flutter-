// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cruds/view/get_screen.dart';
// import 'package:cruds/view/post_screen.dart';
// import 'package:cruds/view/delete_screen.dart';
// import 'package:cruds/view/get_by_id.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CRUD Operations'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text(
//                 'Navigation',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.create),
//               title: const Text('Create'),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 Get.to(() => PostScreen());
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.list),
//               title: const Text('Get'),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 // print(
//                 //     "before binding data"); // Print before navigating to GetScreen
//                 Get.to(() => const GetScreen());
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.person_search),
//               title: const Text('Get by ID'),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 Get.to(() => const GetByIdScreen()); // Navigate to Get by ID screen
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.update),
//               title: const Text('Update'),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 Get.to(() =>
//                     const GetScreen()); // Navigate to GetScreen to select a user to update
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.delete),
//               title: const Text('Delete'),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 Get.to(() => const DeleteScreen()); // Navigate to Delete screen
//               },
//             ),
//           ],
//         ),
//       ),
//       body: const Center(
//         child: Text('Select an option from the sidebar'),
//       ),
//     );
//   }
// }
















import 'package:flutter/material.dart'; // Import Flutter's material design package for UI components
import 'package:get/get.dart'; // Import GetX for state management and navigation
import 'package:cruds/view/get_screen.dart'; // Import GetScreen for fetching all users
import 'package:cruds/view/post_screen.dart'; // Import PostScreen for creating a new user
import 'package:cruds/view/delete_screen.dart'; // Import DeleteScreen for deleting a user
import 'package:cruds/view/get_by_id.dart'; // Import GetByIdScreen for fetching a user by ID

// Define a stateless widget for the home screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // Constructor for HomeScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold provides the structure for the screen
      appBar: AppBar(
        title: const Text('CRUD Operations'), // Title of the app bar
      ),
      drawer: Drawer(
        // Drawer widget for the navigation sidebar
        child: ListView(
          padding: EdgeInsets.zero, // Remove default padding from ListView
          children: <Widget>[
            const DrawerHeader(
              // Header for the drawer
              decoration: BoxDecoration(
                color: Colors.blue, // Background color of the drawer header
              ),
              child: Text(
                'Navigation', // Title inside the drawer header
                style: TextStyle(
                  color: Colors.white, // White text color
                  fontSize: 24, // Font size for the drawer header text
                ),
              ),
            ),
            ListTile(
              // ListTile for 'Create' option
              leading: const Icon(Icons.create), // Icon for 'Create'
              title: const Text('Create'), // Text label for 'Create'
              onTap: () {
                // Action when 'Create' is tapped
                Navigator.of(context).pop(); // Close the drawer
                Get.to(() => PostScreen()); // Navigate to PostScreen for creating a new user
              },
            ),
            ListTile(
              // ListTile for 'Get' option
              leading: const Icon(Icons.list), // Icon for 'Get'
              title: const Text('Get'), // Text label for 'Get'
              onTap: () {
                // Action when 'Get' is tapped
                Navigator.of(context).pop(); // Close the drawer
                Get.to(() => const GetScreen()); // Navigate to GetScreen to fetch all users
              },
            ),
            ListTile(
              // ListTile for 'Get by ID' option
              leading: const Icon(Icons.person_search), // Icon for 'Get by ID'
              title: const Text('Get by ID'), // Text label for 'Get by ID'
              onTap: () {
                // Action when 'Get by ID' is tapped
                Navigator.of(context).pop(); // Close the drawer
                Get.to(() => const GetByIdScreen()); // Navigate to GetByIdScreen for fetching a user by ID
              },
            ),
            ListTile(
              // ListTile for 'Update' option
              leading: const Icon(Icons.update), // Icon for 'Update'
              title: const Text('Update'), // Text label for 'Update'
              onTap: () {
                // Action when 'Update' is tapped
                Navigator.of(context).pop(); // Close the drawer
                Get.to(() => const GetScreen()); // Navigate to GetScreen to select a user to update
              },
            ),
            ListTile(
              // ListTile for 'Delete' option
              leading: const Icon(Icons.delete), // Icon for 'Delete'
              title: const Text('Delete'), // Text label for 'Delete'
              onTap: () {
                // Action when 'Delete' is tapped
                Navigator.of(context).pop(); // Close the drawer
                Get.to(() => const DeleteScreen()); // Navigate to DeleteScreen to delete a user
              },
            ),
          ],
        ),
      ),
      body: const Center(
        // Body of the HomeScreen
        child: Text('Select an option from the sidebar'), //  text in the center of the screen
      ),
    );
  }
}
