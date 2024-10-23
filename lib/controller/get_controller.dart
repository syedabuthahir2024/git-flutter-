// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:cruds/model/user_model.dart';
// import 'package:cruds/service_file.dart'; // Import your API service

// class GetController extends GetxController {
//   var users = <User>[].obs; // Observable list of users
//   var isLoading = false.obs; // Observable loading state
//   var errorMessage = ''.obs; // Observable error message

//   @override
//   void onInit() {
//     super.onInit();
//     fetchUsers(); // Fetch users on controller initialization
//   }

//   Future<void> fetchUsers() async {
//     isLoading(true);
//     errorMessage(''); // Reset the error message

//     try {
//       final response =
//           await http.get(Uri.parse('http://3.110.164.111:3000/findall'));

//       // Check if the response is successful
//       if (response.statusCode == 200) {
//         // Debug: Print the response body
//         print('Response body: ${response.body}');

//         if (response.body.isEmpty) {
//           users.clear();
//           Get.snackbar('Info', 'No users found');
//           return;
//         }

//         // Decode the JSON response
//         final List<dynamic> jsonResponse = json.decode(response.body);

//         // Check if the response is a List
//         if (jsonResponse is List) {
//           users.value =
//               jsonResponse.map((userJson) => User.fromJson(userJson)).toList();
//         } else {
//           errorMessage('Unexpected response format: Expected a List');
//           users.clear();
//         }
//       } else {
//         errorMessage('Failed to fetch users: ${response.reasonPhrase}');
//         users.clear();
//       }
//     } catch (e) {
//       errorMessage('An error occurred: $e');
//       users.clear();
//     } finally {
//       isLoading(false); // Reset loading state
//     }
//   }

//   // Add user to the list
//   void addUser(User user) {
//     users.add(user);
//   }

//   // Delete user by ID using a DELETE request
//   Future<void> deleteUser(String userId) async {
//     isLoading(true);
//     errorMessage(''); // Reset the error message

//     try {
//       final response =
//           await ApiService.deleteUser(userId); // API call to delete user

//       if (response.statusCode == 200) {
//         users.removeWhere((user) => user.id == userId);
//         Get.snackbar('Success', 'User deleted successfully');
//       } else {
//         errorMessage('Failed to delete user: ${response.reasonPhrase}');
//       }
//     } catch (error) {
//       errorMessage('An error occurred: $error');
//     } finally {
//       isLoading(false); // Reset loading state
//     }
//   }

//   // Optionally delete user directly
//   void deleteUserById(String userId) {
//     deleteUser(userId);
//   }

//   // Fetch specific user by ID (implement if necessary)
//   void fetchUserById(String userId) {
//     // Implementation here
//   }

//   // Set custom error messages
//   void setErrorMessage(String message) {
//     errorMessage(message);
//   }
// }


import 'dart:convert'; // Import Dart's convert package for JSON encoding/decoding
import 'package:get/get.dart'; // Import GetX for state management
import 'package:http/http.dart' as http; // Import HTTP package for API calls
import 'package:cruds/model/user_model.dart'; // Import the User model
import 'package:cruds/service_file.dart'; // Import your custom API service

// Controller to manage user data and handle API requests
class GetController extends GetxController {
  var users = <User>[].obs; // Observable list of users, used for displaying and updating users
  var isLoading = false.obs; // Observable loading state, tracks whether data is being loaded
  var errorMessage = ''.obs; // Observable error message, holds error details if any

  @override
  void onInit() {
    super.onInit();
    fetchUsers(); // Fetch users automatically when the controller is initialized
  }

  // Fetch all users from the API
  Future<void> fetchUsers() async {
    isLoading(true); // Set loading state to true while fetching data
    errorMessage(''); // Reset any previous error messages

    try {
      // Make an HTTP GET request to fetch all users
      final response =
          await http.get(Uri.parse('http://3.110.164.111:3000/findall'));

      // Check if the response is successful (status code 200)
      if (response.statusCode == 200) {
        // Debug: Print the response body to the console for reference
        print('Response body: ${response.body}');

        // If the response body is empty, clear the users list and notify
        if (response.body.isEmpty) {
          users.clear(); // Clear the users list
          Get.snackbar('Info', 'No users found'); // Show snackbar message
          return; // Exit function
        }

        // Decode the JSON response
        final List<dynamic> jsonResponse = json.decode(response.body);

        // Ensure the response is a List of users
        if (jsonResponse is List) {
          // Map each user JSON to a User object and update the users list
          users.value =
              jsonResponse.map((userJson) => User.fromJson(userJson)).toList();
        } else {
          // Handle unexpected response format
          errorMessage('Unexpected response format: Expected a List');
          users.clear(); // Clear users list in case of error
        }
      } else {
        // If the request failed, update the error message
        errorMessage('Failed to fetch users: ${response.reasonPhrase}');
        users.clear(); // Clear users list in case of error
      }
    } catch (e) {
      // If an exception occurred, update the error message
      errorMessage('An error occurred: $e');
      users.clear(); // Clear users list in case of error
    } finally {
      isLoading(false); // Reset the loading state after completion
    }
  }

  // Add a new user to the list (e.g., after a successful POST request)
  void addUser(User user) {
    users.add(user); // Add the new user to the observable users list
  }

  // Delete a user by ID using an HTTP DELETE request
  Future<void> deleteUser(String userId) async {
    isLoading(true); // Set loading state to true while processing deletion
    errorMessage(''); // Reset any previous error messages

    try {
      // Use the ApiService to make a DELETE request for the user
      final response =
          await ApiService.deleteUser(userId); // Call the API to delete the user

      // If deletion was successful
      if (response.statusCode == 200) {
        users.removeWhere((user) => user.id == userId); // Remove user from list
        Get.snackbar('Success', 'User deleted successfully'); // Show success message
      } else {
        // If deletion failed, update the error message
        errorMessage('Failed to delete user: ${response.reasonPhrase}');
      }
    } catch (error) {
      // Handle any errors that occurred during the request
      errorMessage('An error occurred: $error');
    } finally {
      isLoading(false); // Reset the loading state after completion
    }
  }

  // Helper function to delete a user by ID directly (optional)
  void deleteUserById(String userId) {
    deleteUser(userId); // Call the deleteUser function with the provided ID
  }

  // Optional function to fetch a specific user by ID (implementation can be added)
  void fetchUserById(String userId) {
    // Implementation for fetching user by ID can be added here
  }

  // Helper function to set a custom error message
  void setErrorMessage(String message) {
    errorMessage(message); // Update the error message with a custom value
  }
}
