// import 'package:cruds/controller/update_controller.dart';
// import 'package:cruds/model/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class UpdateScreen extends StatelessWidget {
//   final User userDetails;

//   // Initializing TextEditingControllers with user details
//   final TextEditingController emailController;
//   final TextEditingController firstNameController;
//   final TextEditingController lastNameController;
//   final TextEditingController phoneController;

//   UpdateScreen({super.key, required this.userDetails, required User user})
//       : emailController = TextEditingController(text: userDetails.email),
//         firstNameController =
//             TextEditingController(text: userDetails.firstName),
//         lastNameController = TextEditingController(text: userDetails.lastName),
//         phoneController = TextEditingController(text: userDetails.phone);

//   @override
//   Widget build(BuildContext context) {
//     final UpdateController updateController = Get.find<UpdateController>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Update User'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'User ID: ${userDetails.id}',
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: firstNameController,
//               decoration: const InputDecoration(labelText: 'First Name'),
//             ),
//             TextField(
//               controller: lastNameController,
//               decoration: const InputDecoration(labelText: 'Last Name'),
//             ),
//             TextField(
//               controller: phoneController,
//               decoration: const InputDecoration(labelText: 'Phone'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   // Collect the updated details
//                   final updatedUser = User(
//                     id: userDetails.id,
//                     email: emailController.text,
//                     firstName: firstNameController.text,
//                     lastName: lastNameController.text,
//                     phone: phoneController.text,
//                   );

//                   // Update the user details
//                   await updateController.updateUserDetails(updatedUser);

//                   // Show success dialog
//                   _showSuccessDialog(context);
//                 } catch (e) {
//                   // Handle exceptions
//                   print('Update failed: $e');
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Update failed: $e')),
//                   );
//                 }
//               },
//               child: const Text('Update'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showSuccessDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Success'),
//           content: const Text('User updated successfully.'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 // Close the dialog
//                 Navigator.of(context).pop();

//                 // Navigate to GetScreen
//                 Get.offNamed('/get');
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }



import 'package:cruds/controller/update_controller.dart'; // Import the UpdateController
import 'package:cruds/model/user_model.dart'; // Import the User model
import 'package:flutter/material.dart'; // Import Flutter's Material design components
import 'package:get/get.dart'; // Import GetX for state management and routing

// UpdateScreen class for updating user details
class UpdateScreen extends StatelessWidget {
  final User userDetails; // Store the details of the user to be updated

  // TextEditingControllers initialized with existing user details
  final TextEditingController emailController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneController;

  // Constructor: initializing controllers with the current user details
  UpdateScreen({super.key, required this.userDetails, required User user})
      : emailController = TextEditingController(text: userDetails.email), // Pre-fill email field
        firstNameController = TextEditingController(text: userDetails.firstName), // Pre-fill first name
        lastNameController = TextEditingController(text: userDetails.lastName), // Pre-fill last name
        phoneController = TextEditingController(text: userDetails.phone); // Pre-fill phone number

  @override
  Widget build(BuildContext context) {
    // Get the UpdateController instance using GetX
    final UpdateController updateController = Get.find<UpdateController>();

    return Scaffold(
      // AppBar with title
      appBar: AppBar(
        title: const Text('Update User'),
      ),
      // Main body of the screen
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
          children: [
            // Display the user ID
            Text(
              'User ID: ${userDetails.id}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Bold font for emphasis
            ),
            const SizedBox(height: 20), // Spacing between elements
            // Text field for updating email
            TextField(
              controller: emailController, // Link the controller to update user email
              decoration: const InputDecoration(labelText: 'Email'), // Label for the text field
            ),
            // Text field for updating first name
            TextField(
              controller: firstNameController, // Link the controller to update first name
              decoration: const InputDecoration(labelText: 'First Name'), // Label for the text field
            ),
            // Text field for updating last name
            TextField(
              controller: lastNameController, // Link the controller to update last name
              decoration: const InputDecoration(labelText: 'Last Name'), // Label for the text field
            ),
            // Text field for updating phone number
            TextField(
              controller: phoneController, // Link the controller to update phone number
              decoration: const InputDecoration(labelText: 'Phone'), // Label for the text field
            ),
            const SizedBox(height: 20), // Spacing between text fields and the button
            // Button to trigger the update action
            ElevatedButton(
              onPressed: () async {
                try {
                  // Create an updated user object with the new details
                  final updatedUser = User(
                    id: userDetails.id, // Keep the same user ID
                    email: emailController.text, // Updated email
                    firstName: firstNameController.text, // Updated first name
                    lastName: lastNameController.text, // Updated last name
                    phone: phoneController.text, // Updated phone number
                  );

                  // Call the updateUserDetails method from the UpdateController
                  await updateController.updateUserDetails(updatedUser);

                  // Show a success dialog if the update is successful
                  _showSuccessDialog(context);
                } catch (e) {
                  // Handle exceptions if the update fails
                  print('Update failed: $e');
                  // Show a snack bar to notify the user about the failure
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Update failed: $e')),
                  );
                }
              },
              child: const Text('Update'), // Button text
            ),
          ],
        ),
      ),
    );
  }

  // Method to show a success dialog after the update
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context, // Use the current context
      builder: (BuildContext context) {
        // Return an AlertDialog widget to show success
        return AlertDialog(
          title: const Text('Success'), // Dialog title
          content: const Text('User updated successfully.'), // Dialog content
          actions: <Widget>[
            // Button to close the dialog
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();

                // Navigate to the GetScreen (user list screen) using GetX routing
                Get.offNamed('/get');
              },
              child: const Text('OK'), // Button text
            ),
          ],
        );
      },
    );
  }
}
