// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cruds/controller/get_controller.dart';
// import 'package:cruds/controller/post_controller.dart';
// import 'package:cruds/model/user_model.dart';

// class PostScreen extends StatelessWidget {
//   PostScreen({super.key});

//   final PostController postController = Get.put(PostController());
//   final GetController getController = Get.find();

//   // Define the method inside the class
//   void printAllData() {
//     print('Email: ${postController.emailController.text}, '
//         'First Name: ${postController.firstNameController.text}, '
//         'Last Name: ${postController.lastNameController.text}, '
//         'Phone: ${postController.phoneController.text}');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Post Screen'),
//         ),
//         backgroundColor: const Color.fromARGB(255, 252, 252, 252),
//         body: SingleChildScrollView(
//           child: Form(
//             key: postController.formKey,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
//               child: Obx(
//                 () => Column(
//                   children: [
//                     const Text(
//                       "Enter Your Details",
//                       style: TextStyle(
//                           color: Color.fromARGB(255, 66, 8, 160),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24),
//                     ),
//                     const SizedBox(height: 20),
//                     CustomTextFormField(
//                       labelName: "Email:",
//                       controller: postController.emailController,
//                       validator: (value) {
//                         if (value?.isEmpty ?? false) return "Required!";
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     CustomTextFormField(
//                       labelName: "First Name:",
//                       maxLines: 1,
//                       controller: postController.firstNameController,
//                       validator: (value) {
//                         if (value?.isEmpty ?? false) return "Required!";
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     CustomTextFormField(
//                       labelName: "Last Name:",
//                       maxLines: 1,
//                       controller: postController.lastNameController,
//                       validator: (value) {
//                         if (value?.isEmpty ?? false) return "Required!";
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     CustomTextFormField(
//                       labelName: "Phone:",
//                       keyboardType: TextInputType.number,
//                       controller: postController.phoneController,
//                       validator: (value) {
//                         if (value?.isEmpty ?? false) return "Required!";
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 44),
//                     ElevatedButton(
//                       onPressed: () async {
//                         if (postController.formKey.currentState!.validate()) {
//                           // Combine all print statements into one
//                           print(
//                               'Before Calling the API: Email: ${postController.emailController.text}, '
//                               'First Name: ${postController.firstNameController.text}, '
//                               'Last Name: ${postController.lastNameController.text}, '
//                               'Phone: ${postController.phoneController.text}');

//                           // Call the addUser method to save the data
//                           await postController.addUser();

//                           // Check if there is any error message
//                           if (postController.errorMessage.isEmpty) {
//                             User newUser = User(
//                               email: postController.emailController.text,
//                               firstName:
//                                   postController.firstNameController.text,
//                               lastName: postController.lastNameController.text,
//                               phone: postController.phoneController.text,
//                               id: DateTime.now().toString(),
//                             );

//                             // Add the new user to the GetController
//                             getController.addUser(newUser);

//                             // Show success dialog
//                             Get.dialog(
//                               AlertDialog(
//                                 title: const Text('Success'),
//                                 content:
//                                     const Text('User created successfully!'),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () {
//                                       Get.back();
//                                       Get.offNamed('/home');
//                                     },
//                                     child: const Text('OK'),
//                                   ),
//                                 ],
//                               ),
//                               barrierDismissible: false,
//                             );
//                           }
//                         }
//                       },
//                       child: const Text('Submit'),
//                     ),
//                     const SizedBox(height: 20),
//                     if (postController.isLoading.value)
//                       const CircularProgressIndicator(),
//                     if (postController.errorMessage.isNotEmpty)
//                       Text(postController.errorMessage.value,
//                           style: const TextStyle(color: Colors.red)),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomTextFormField extends StatelessWidget {
//   final String labelName;
//   final TextEditingController controller;
//   final FormFieldValidator<String>? validator;
//   final TextInputType keyboardType;
//   final int maxLines;
//   final ValueChanged<String>? onChanged; // New property

//   const CustomTextFormField({
//     super.key,
//     required this.labelName,
//     required this.controller,
//     this.validator,
//     this.keyboardType = TextInputType.text,
//     this.maxLines = 1,
//     this.onChanged, // Include it in the constructor
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       validator: validator,
//       keyboardType: keyboardType,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         labelText: labelName,
//         border: const OutlineInputBorder(),
//       ),
//       onChanged: onChanged, // Assign the onChanged callback
//     );
//   }
// }


import 'package:flutter/material.dart'; // Import Flutter material design for UI components
import 'package:get/get.dart'; // Import GetX for state management and navigation
import 'package:cruds/controller/get_controller.dart'; // Import GetController to manage fetching and updating users
import 'package:cruds/controller/post_controller.dart'; // Import PostController to manage user creation
import 'package:cruds/model/user_model.dart'; // Import User model

// Define a stateless widget for the PostScreen
class PostScreen extends StatelessWidget {
  PostScreen({super.key});

  final PostController postController = Get.put(PostController()); // Initialize PostController using GetX
  final GetController getController = Get.find(); // Find the already initialized GetController

  // Define a method to print form data to the console for debugging
  void printAllData() {
    print('Email: ${postController.emailController.text}, '
        'First Name: ${postController.firstNameController.text}, '
        'Last Name: ${postController.lastNameController.text}, '
        'Phone: ${postController.phoneController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Ensures UI avoids device notches
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Post Screen'), // Title for the AppBar
        ),
        backgroundColor: const Color.fromARGB(255, 252, 252, 252), // Background color of the screen
        body: SingleChildScrollView(
          // Allows scrolling if content overflows
          child: Form(
            key: postController.formKey, // Key for validating the form
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10), // Padding around form
              child: Obx(
                // Reactive state management using Obx
                () => Column(
                  children: [
                    const Text(
                      "Enter Your Details", // Form title
                      style: TextStyle(
                          color: Color.fromARGB(255, 66, 8, 160),
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    const SizedBox(height: 20), // Space between title and input fields
                    CustomTextFormField(
                      labelName: "Email:", // Label for email input
                      controller: postController.emailController, // Controller for email input
                      validator: (value) {
                        // Validator for email input
                        if (value?.isEmpty ?? false) return "Required!";
                        return null;
                      },
                    ),
                    const SizedBox(height: 16), // Space between input fields
                    CustomTextFormField(
                      labelName: "First Name:", // Label for first name input
                      maxLines: 1,
                      controller: postController.firstNameController, // Controller for first name input
                      validator: (value) {
                        // Validator for first name input
                        if (value?.isEmpty ?? false) return "Required!";
                        return null;
                      },
                    ),
                    const SizedBox(height: 16), // Space between input fields
                    CustomTextFormField(
                      labelName: "Last Name:", // Label for last name input
                      maxLines: 1,
                      controller: postController.lastNameController, // Controller for last name input
                      validator: (value) {
                        // Validator for last name input
                        if (value?.isEmpty ?? false) return "Required!";
                        return null;
                      },
                    ),
                    const SizedBox(height: 16), // Space between input fields
                    CustomTextFormField(
                      labelName: "Phone:", // Label for phone input
                      keyboardType: TextInputType.number, // Input type for phone number
                      controller: postController.phoneController, // Controller for phone input
                      validator: (value) {
                        // Validator for phone input
                        if (value?.isEmpty ?? false) return "Required!";
                        return null;
                      },
                    ),
                    const SizedBox(height: 44), // Space before the submit button
                    ElevatedButton(
                      onPressed: () async {
                        // Action when the submit button is pressed
                        if (postController.formKey.currentState!.validate()) {
                          // Check if form input is valid

                          // Log the form data before calling the API
                          print('Before Calling the API: '
                              'Email: ${postController.emailController.text}, '
                              'First Name: ${postController.firstNameController.text}, '
                              'Last Name: ${postController.lastNameController.text}, '
                              'Phone: ${postController.phoneController.text}');

                          // Call the addUser method to save the data
                          await postController.addUser();

                          // Check if any error message exists
                          if (postController.errorMessage.isEmpty) {
                            // If no error, create a new user object
                            User newUser = User(
                              email: postController.emailController.text,
                              firstName: postController.firstNameController.text,
                              lastName: postController.lastNameController.text,
                              phone: postController.phoneController.text,
                              id: DateTime.now().toString(), // Assign a unique ID
                            );

                            // Add the new user to the GetController
                            getController.addUser(newUser);

                            // Show success dialog
                            Get.dialog(
                              AlertDialog(
                                title: const Text('Success'), // Title for the dialog
                                content: const Text('User created successfully!'), // Success message
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back(); // Close dialog
                                      Get.offNamed('/home'); // Navigate to the home screen
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                              barrierDismissible: false, // Prevent dialog from being dismissed
                            );
                          }
                        }
                      },
                      child: const Text('Submit'), // Submit button label
                    ),
                    const SizedBox(height: 20), // Space after the button
                    if (postController.isLoading.value) // Show a loader if loading
                      const CircularProgressIndicator(),
                    if (postController.errorMessage.isNotEmpty) // Show error message if exists
                      Text(postController.errorMessage.value,
                          style: const TextStyle(color: Colors.red)), // Display error message in red
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom text form field widget for form inputs
class CustomTextFormField extends StatelessWidget {
  final String labelName; // Label for the input field
  final TextEditingController controller; // Controller for the input field
  final FormFieldValidator<String>? validator; // Optional validator
  final TextInputType keyboardType; // Input type (text, number, etc.)
  final int maxLines; // Max lines for the input field
  final ValueChanged<String>? onChanged; // Callback for handling input changes

  const CustomTextFormField({
    super.key,
    required this.labelName,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text, // Default to text input
    this.maxLines = 1, // Default to single-line input
    this.onChanged, // Optional onChanged callback
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Assign controller to the input field
      validator: validator, // Assign validator to the input field
      keyboardType: keyboardType, // Set input type
      maxLines: maxLines, // Set max lines for input field
      decoration: InputDecoration(
        labelText: labelName, // Label text for the input field
        border: const OutlineInputBorder(), // Outline border for the input field
      ),
      onChanged: onChanged, // Assign the onChanged callback
    );
  }
}
