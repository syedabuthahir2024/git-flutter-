// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';

// class DeleteController extends GetxController {
//   final String baseUrl = "http://3.110.164.111:3000"; // Your server URL

//   Future<void> deleteUser(String userId) async {
//     final url = Uri.parse('$baseUrl/delete/$userId');
//     print('Deleting user at URL: $url');

//     try {
//       final response = await http.delete(url);

//       print('Response status code: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         Get.snackbar('Success', 'User deleted successfully',
//             snackPosition: SnackPosition.BOTTOM);
//       } else {
//         throw Exception("Failed to delete user: ${response.body}");
//       }
//     } catch (e) {
//       print('Exception occurred: $e');
//       Get.snackbar('Error', 'Failed to delete user',
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   }
// }



import 'package:http/http.dart' as http; // Import the http package to handle HTTP requests
import 'package:get/get.dart'; // Import GetX for state management and UI feedback

// Controller for handling the deletion of users
class DeleteController extends GetxController {
  final String baseUrl = "http://3.110.164.111:3000"; // Base URL of the server (replace with your actual server URL)

  // Function to delete a user based on their ID
  Future<void> deleteUser(String userId) async {
    final url = Uri.parse('$baseUrl/delete/$userId'); // Construct the URL for deleting the user
    print('Deleting user at URL: $url'); // Debug statement to log the URL for the deletion request

    try {
      // Send the DELETE request to the server
      final response = await http.delete(url);

      // Print the response status and body for debugging
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Show a success notification using GetX's snackbar feature
        Get.snackbar('Success', 'User deleted successfully',
            snackPosition: SnackPosition.BOTTOM); // Snackbar at the bottom of the screen
      } else {
        // Throw an exception if the request failed
        throw Exception("Failed to delete user: ${response.body}");
      }
    } catch (e) {
      // Catch any exceptions that occur during the request
      print('Exception occurred: $e'); // Log the error for debugging

      // Show an error notification using GetX's snackbar feature
      Get.snackbar('Error', 'Failed to delete user',
          snackPosition: SnackPosition.BOTTOM); // Snackbar at the bottom of the screen
    }
  }
}
