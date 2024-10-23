// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cruds/service_file.dart'; // Import the ApiService

// class PostController extends GetxController {
//   // Define the form key
//   final formKey = GlobalKey<FormState>();

//   // Define controllers for form fields
//   final emailController = TextEditingController();
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final phoneController = TextEditingController();

//   // Reactive variables
//   var isLoading = false.obs;
//   var errorMessage = ''.obs;

//   // Instance of ApiService
//   final ApiService apiService = ApiService();

//   // Function to add user
//   Future<void> addUser() async {
//     // Validate input fields
//     if (!formKey.currentState!.validate()) {
//       return;
//     }

//     // Extract values from controllers
//     final String firstName = firstNameController.text;
//     final String lastName = lastNameController.text;
//     final String email = emailController.text;
//     final String phone = phoneController.text;

//     // Prepare the data to be sent
//     Map<String, dynamic> userData = {
//       "firstName": firstName,
//       "lastName": lastName,
//       "email": email,
//       "phone": phone,
//     };

//     // Simulate a network request
//     try {
//       isLoading.value = true;
//       final response = await apiService.createUser(userData);
//       errorMessage.value = ''; // Clear any previous error messages
//       print('User was created successfully: $response');
//       Get.snackbar('Success', 'User was created successfully');
//     } catch (e) {
//       errorMessage.value = 'An error occurred: $e';
//       print('Failed to create user: $e');
//       Get.snackbar('Error', 'Failed to create user');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }


import 'package:flutter/material.dart'; // Import Flutter for form widgets
import 'package:get/get.dart'; // Import GetX for state management
import 'package:cruds/service_file.dart'; // Import the ApiService for API calls

// Controller for handling user creation (POST request)
class PostController extends GetxController {
  // Define the form key to validate the form fields
  final formKey = GlobalKey<FormState>();

  // Define controllers for form fields to capture user input
  final emailController = TextEditingController(); // Controller for email field
  final firstNameController = TextEditingController(); // Controller for first name field
  final lastNameController = TextEditingController(); // Controller for last name field
  final phoneController = TextEditingController(); // Controller for phone field

  // Reactive variables to manage loading state and error messages
  var isLoading = false.obs; // Observable variable to track loading state
  var errorMessage = ''.obs; // Observable variable to hold error messages

  // Instance of ApiService for handling API requests
  final ApiService apiService = ApiService();

  // Function to handle adding a new user
  Future<void> addUser() async {
    // Validate the form fields. If not valid, return and do nothing
    if (!formKey.currentState!.validate()) {
      return;
    }

    // Extract values from the text controllers (form fields)
    final String firstName = firstNameController.text; // Get first name
    final String lastName = lastNameController.text; // Get last name
    final String email = emailController.text; // Get email
    final String phone = phoneController.text; // Get phone

    // Prepare the user data to be sent to the API in a Map format
    Map<String, dynamic> userData = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
    };

    // Simulate a network request to create a user
    try {
      isLoading.value = true; // Set loading to true to show progress indicator
      final response = await apiService.createUser(userData); // Call the API to create the user
      errorMessage.value = ''; // Clear any previous error messages

      // Log the response and show success message to the user
      print('User was created successfully: $response');
      Get.snackbar('Success', 'User was created successfully'); // Show a success snackbar
    } catch (e) {
      // If there was an error, update errorMessage and log the error
      errorMessage.value = 'An error occurred: $e';
      print('Failed to create user: $e');
      Get.snackbar('Error', 'Failed to create user'); // Show an error snackbar
    } finally {
      isLoading.value = false; // Reset loading state after the request is completed
    }
  }
}
