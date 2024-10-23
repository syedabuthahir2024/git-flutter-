// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import '../model/user_model.dart';

// class UpdateController extends GetxController {
//   final String baseUrl =
//       "http://3.110.164.111:3000"; // Replace with your server address

//   Future<void> updateUserDetails(User updatedUser) async {
//     final url = Uri.parse('$baseUrl/update/${updatedUser.id}');
//     print('Updating user at URL: $url');

//     try {
//       final response = await http.put(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           'email': updatedUser.email,
//           'firstName': updatedUser.firstName,
//           'lastName': updatedUser.lastName,
//           'phone': updatedUser.phone,
//         }),
//       );

//       print('Response status code: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         print('User updated successfully: $data');
//       } else {
//         throw Exception("Failed to update user: ${response.body}");
//       }
//     } catch (e) {
//       print('Exception occurred: $e');
//       rethrow;
//     }
//   }
// }




import 'dart:convert'; // Import for encoding and decoding JSON
import 'package:http/http.dart' as http; // Import HTTP package to make API requests
import 'package:get/get.dart'; // Import GetX package for state management and controller
import '../model/user_model.dart'; // Import the User model to work with user data

// Controller responsible for updating user details
class UpdateController extends GetxController {
  // Base URL for the API server (replace with your server's URL)
  final String baseUrl = "http://3.110.164.111:3000";

  // Function to update user details
  Future<void> updateUserDetails(User updatedUser) async {
    // Construct the URL for the update request by appending the user ID
    final url = Uri.parse('$baseUrl/update/${updatedUser.id}');
    print('Updating user at URL: $url'); // Debugging: Log the update URL

    try {
      // Make a PUT request to the server to update user details
      final response = await http.put(
        url, // The constructed API URL
        headers: {"Content-Type": "application/json"}, // Set headers to specify the content type
        // Encode the user details as a JSON object in the request body
        body: jsonEncode({
          'email': updatedUser.email,
          'firstName': updatedUser.firstName,
          'lastName': updatedUser.lastName,
          'phone': updatedUser.phone,
        }),
      );

      // Debugging: Log the status code and response body for the request
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      // If the response status code is 200 (OK), log the success
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body); // Decode the JSON response body
        print('User updated successfully: $data'); // Debugging: Log the success response
      } else {
        // If the status code is not 200, throw an error with the response body
        throw Exception("Failed to update user: ${response.body}");
      }
    } catch (e) {
      // Catch and print any exceptions that occur during the request
      print('Exception occurred: $e');
      rethrow; // Rethrow the exception to allow handling in the UI
    }
  }
}
