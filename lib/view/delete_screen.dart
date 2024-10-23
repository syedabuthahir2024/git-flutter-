// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cruds/controller/delete_controller.dart';
// import 'package:cruds/controller/get_controller.dart'; // Import GetController to fetch users

// class DeleteScreen extends StatelessWidget {
//   const DeleteScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final DeleteController deleteController = Get.find();
//     final GetController getController = Get.find(); // Controller to fetch users

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Delete User'),
//       ),
//       body: Obx(() {
//         if (getController.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (getController.errorMessage.isNotEmpty) {
//           return Center(
//               child: Text(getController.errorMessage.value,
//                   style: const TextStyle(color: Colors.red)));
//         } else if (getController.users.isEmpty) {
//           return const Center(child: Text('No users found'));
//         } else {
//           return ListView.builder(
//             itemCount: getController.users.length,
//             itemBuilder: (context, index) {
//               final user = getController.users[index];
//               return ListTile(
//                 title: Text('Email: ${user.email ?? 'Not provided'}'),
//                 subtitle: Text('ID: ${user.id}'),
//                 trailing: IconButton(
//                   icon: const Icon(Icons.delete, color: Colors.red),
//                   onPressed: () async {
//                     // Debugging line to print the user ID before attempting to delete
//                     print('Attempting to delete user with ID: ${user.id}');

//                     // await deleteController.deleteUser(user.id);
//                     getController
//                         .fetchUsers(); // Refresh user list after deletion

//                     // Show success dialog
//                     _showSuccessDialog(context);
//                   },
//                 ),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }

//   void _showSuccessDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Success'),
//           content: const Text('User deleted successfully.'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }


import 'package:flutter/material.dart'; // Importing Material package for UI components
import 'package:get/get.dart'; // Importing GetX for state management and navigation
import 'package:cruds/controller/delete_controller.dart'; // Importing DeleteController for deleting users
import 'package:cruds/controller/get_controller.dart'; // Import GetController to fetch users from API

// StatelessWidget for deleting users
class DeleteScreen extends StatelessWidget {
  const DeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the DeleteController and GetController from GetX
    final DeleteController deleteController = Get.find(); // Controller for deleting users
    final GetController getController = Get.find(); // Controller for fetching users

    return Scaffold(
      appBar: AppBar(
        // AppBar with title
        title: const Text('Delete User'),
      ),
      // Obx widget to observe the state of GetController and reactively build the UI
      body: Obx(() {
        // If the data is still loading, show a loading spinner
        if (getController.isLoading.value) {
          return const Center(child: CircularProgressIndicator()); // Loading indicator
        }
        // If there's an error, display the error message
        else if (getController.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              getController.errorMessage.value, // Error message from GetController
              style: const TextStyle(color: Colors.red), // Red color to indicate error
            ),
          );
        }
        // If no users are found, show a message indicating the same
        else if (getController.users.isEmpty) {
          return const Center(child: Text('No users found')); // No users message
        }
        // If users are fetched successfully, display them in a ListView
        else {
          return ListView.builder(
            itemCount: getController.users.length, // Number of users to display
            itemBuilder: (context, index) {
              // Get the user at the current index
              final user = getController.users[index];
              return ListTile(
                // Display the user's email or 'Not provided' if it's null
                title: Text('Email: ${user.email ?? 'Not provided'}'),
                // Display the user's ID
                subtitle: Text('ID: ${user.id}'),
                // Delete button (trash icon) to delete the user
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red), // Red delete icon
                  onPressed: () async {
                    // Debugging line to print the user ID before attempting to delete
                    print('Attempting to delete user with ID: ${user.id}');

                    // Uncomment this line to actually delete the user
                    // await deleteController.deleteUser(user.id);

                    // Refresh the user list after deletion
                    getController.fetchUsers();

                    // Show a success dialog after the user is deleted
                    _showSuccessDialog(context);
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }

  // Function to display a success dialog after user deletion
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // Title of the dialog
          title: const Text('Success'),
          // Content message of the dialog
          content: const Text('User deleted successfully.'),
          // Button to close the dialog
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog when OK is pressed
                Navigator.of(context).pop();
              },
              child: const Text('OK'), // Label of the button
            ),
          ],
        );
      },
    );
  }
}
