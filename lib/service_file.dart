// import 'dart:convert';
// import 'dart:io';
// import 'package:cruds/model/user_model.dart';
// import 'package:http/http.dart' as http;

// class Url {
//   static const baseUrl = "http://3.110.164.111:3000";
//   static const post = "$baseUrl/create";
//   static const getAll = "$baseUrl/findAll";
//   static const deleteUser = "$baseUrl/delete";
//   static const updateUser = "$baseUrl/update";
//   // static const getUserbyFirstName =
//   //     "${baseUrl}/firstName"; // Base get by ID endpoint
//   static const get = "$baseUrl/findOne";

//   static String deleteUserById(String userId) {
//     return '$baseUrl/delete/$userId'; // URL with userId appended
//   }

//   // Method to generate URL for updating user by ID
//   static String updateUserById(String userId) {
//     return '$baseUrl/update/$userId'; // URL with userId appended
//   }

//   // Method to generate URL for getting user by ID
//   static String getUserById(String userId) {
//     return '$baseUrl/get/$userId'; // URL with userId appended
//   }
// }

// class ApiService {
//   // Create user method
//   Future<Map<String, dynamic>> createUser(Map<String, dynamic> body) async {
//     print('Preparing to send POST request to URL:');
//     print('Request Body:');

//     try {
//       final response = await http.post(
//         Uri.parse(Url.post),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(body),
//       );
//       print('Response received with status code: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final userId = data['user']['_id']; // Correctly extracting the user ID
//         // print('User created successfully with ID: $userId');
//         return {'message': data['message'], 'id': userId};
//       } else {
//         final data = jsonDecode(response.body);
//         print('Failed to create user: ${data['message']}');
//         throw HttpException(
//             "Failed to create user: ${data['message'] ?? 'Unknown error'}");
//       }
//     } catch (e) {
//       print('Exception occurred: $e');
//       rethrow;
//     }
//   }

//   // Delete user method
//   static Future<http.Response> deleteUser(String userId) async {
//     final url =
//         Uri.parse(Url.deleteUserById(userId)); // Construct URL with userId
//     print('Preparing to send DELETE request to URL: $url');

//     try {
//       final response = await http.delete(
//         url,
//         headers: {"Content-Type": "application/json"},
//       );
//       print('Response received with status code: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         print('User deleted successfully.');
//       } else {
//         print('Failed to delete user: ${response.body}');
//         throw HttpException("Failed to delete user: ${response.body}");
//       }
//       return response; // Return the response object
//     } catch (e) {
//       print('Exception occurred: $e');
//       rethrow;
//     }
//   }

//   // Fetch all users method
//   static Future<List<User>> fetchUsersFromApi() async {
//     print('Preparing to send GET request to URL: ${Url.getAll}');
//     try {
//       final response = await http.get(Uri.parse(Url.getAll));

//       print('Response received with status code: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final List<dynamic> data = jsonDecode(response.body);
//         List<User> users = data
//             .map((user) => User.fromJson(user))
//             .toList(); // Assuming you have a User model with fromJson
//         return users;
//       } else {
//         print('Failed to fetch users: ${response.body}');
//         throw HttpException("Failed to fetch users: ${response.body}");
//       }
//     } catch (e) {
//       print('Exception occurred: $e');
//       rethrow;
//     }
//   }

//   // Update user method
//   Future<http.Response> updateUser(
//       String userId, Map<String, dynamic> updatedData) async {
//     final url =
//         Uri.parse(Url.updateUserById(userId)); // Construct URL with userId
//     print('Preparing to send PUT request to URL: $url');
//     print('Request Body: $updatedData');

//     try {
//       final response = await http.put(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(updatedData),
//       );
//       print('Response received with status code: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         print('User updated successfully.');
//       } else {
//         print('Failed to update user: ${response.body}');
//         throw HttpException("Failed to update user: ${response.body}");
//       }
//       return response; // Return the response object
//     } catch (e) {
//       print('Exception occurred: $e');
//       rethrow;
//     }
//   }

//   // Get user by ID method
//   Future<User?> getUserById(String userId) async {
//     final url = Uri.parse(Url.getUserById(userId)); // Construct URL with userId
//     print('Preparing to send GET request to URL: $url');

//     try {
//       final response = await http.get(url);
//       print('Response received with status code: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return User.fromJson(
//             data); // Assuming you have a User model with fromJson
//       } else {
//         print('Failed to fetch user: ${response.body}');
//         throw HttpException("Failed to fetch user: ${response.body}");
//       }
//     } catch (e) {
//       print('Exception occurred: $e');
//       rethrow;
//     }
//   }

//   // Fetch user by ID and update UI method (equivalent of fetchData)
//   Future<void> fetchUserDataById(
//       String userId, Function(Map<String, dynamic>) onSuccess,
//       {Function(String)? onError}) async {
//     final url = Uri.parse(Url.getUserById(userId)); // Construct URL with userId
//     print('Fetching data for ID: $userId');

//     try {
//       final response = await http.get(url);

//       print('Response received with status code: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         onSuccess(data);
//       } else {
//         final errorText = response.body;
//         print(
//             'Error fetching data: Status ${response.statusCode}, Response: $errorText');
//         if (onError != null) onError('Failed to retrieve data: $errorText');
//       }
//     } catch (e) {
//       print('Error: $e');
//       if (onError != null) {
//         onError(
//             'Failed to retrieve data. Please check your connection and try again.');
//       }
//     }
//   }

//   static fetchUserById(String userId) {}
// }



import 'dart:convert'; // Import for JSON encoding/decoding
import 'dart:io'; // Import for handling HTTP exceptions
import 'package:cruds/model/user_model.dart'; // Import the user model for handling user data
import 'package:http/http.dart' as http; // Import for making HTTP requests

// This class holds the URLs for various API endpoints
class Url {
  static const baseUrl = "http://3.110.164.111:3000"; // Base URL for the API
  static const post = "$baseUrl/create"; // Endpoint for creating a new user
  static const getAll = "$baseUrl/findAll"; // Endpoint for fetching all users
  static const deleteUser = "$baseUrl/delete"; // Endpoint for deleting a user
  static const updateUser = "$baseUrl/update"; // Endpoint for updating user data
  static const get = "$baseUrl/findOne"; // Endpoint for getting a user by ID

  // Method to generate URL for deleting a user by ID
  static String deleteUserById(String userId) {
    return '$baseUrl/delete/$userId'; // Return the delete URL with the userId
  }

  // Method to generate URL for updating a user by ID
  static String updateUserById(String userId) {
    return '$baseUrl/update/$userId'; // Return the update URL with the userId
  }

  // Method to generate URL for getting a user by ID
  static String getUserById(String userId) {
    return '$baseUrl/get/$userId'; // Return the get URL with the userId
  }
}

// ApiService class contains methods for interacting with the API
class ApiService {
  // Create a new user
  Future<Map<String, dynamic>> createUser(Map<String, dynamic> body) async {
    print('Preparing to send POST request to URL: ${Url.post}');
    print('Request Body: $body');

    try {
      // Sending a POST request to create a user
      final response = await http.post(
        Uri.parse(Url.post),
        headers: {"Content-Type": "application/json"}, // Set header to JSON
        body: jsonEncode(body), // Encode the body as JSON
      );
      print('Response received with status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      // If the request is successful, decode the response
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final userId = data['user']['_id']; // Extract the user ID from the response
        return {'message': data['message'], 'id': userId}; // Return the message and user ID
      } else {
        // Handle error if the request failed
        final data = jsonDecode(response.body);
        print('Failed to create user: ${data['message']}');
        throw HttpException("Failed to create user: ${data['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      // Handle exceptions during the HTTP request
      print('Exception occurred: $e');
      rethrow; // Re-throw the caught exception
    }
  }

  // Delete a user by ID
  static Future<http.Response> deleteUser(String userId) async {
    final url = Uri.parse(Url.deleteUserById(userId)); // Construct URL with the userId
    print('Preparing to send DELETE request to URL: $url');

    try {
      // Send DELETE request to remove the user
      final response = await http.delete(
        url,
        headers: {"Content-Type": "application/json"}, // Set header to JSON
      );
      print('Response received with status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        print('User deleted successfully.');
      } else {
        // Handle error if deletion fails
        print('Failed to delete user: ${response.body}');
        throw HttpException("Failed to delete user: ${response.body}");
      }
      return response; // Return the response object
    } catch (e) {
      // Handle exceptions during the HTTP request
      print('Exception occurred: $e');
      rethrow; // Re-throw the caught exception
    }
  }

  // Fetch all users from the API
  static Future<List<User>> fetchUsersFromApi() async {
    print('Preparing to send GET request to URL: ${Url.getAll}');
    try {
      // Send GET request to fetch all users
      final response = await http.get(Uri.parse(Url.getAll));

      print('Response received with status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body); // Decode the response
        List<User> users = data.map((user) => User.fromJson(user)).toList(); // Map JSON to User objects
        return users; // Return the list of users
      } else {
        // Handle error if fetching users fails
        print('Failed to fetch users: ${response.body}');
        throw HttpException("Failed to fetch users: ${response.body}");
      }
    } catch (e) {
      // Handle exceptions during the HTTP request
      print('Exception occurred: $e');
      rethrow; // Re-throw the caught exception
    }
  }

  // Update a user by ID
  Future<http.Response> updateUser(String userId, Map<String, dynamic> updatedData) async {
    final url = Uri.parse(Url.updateUserById(userId)); // Construct URL with the userId
    print('Preparing to send PUT request to URL: $url');
    print('Request Body: $updatedData');

    try {
      // Send PUT request to update the user
      final response = await http.put(
        url,
        headers: {"Content-Type": "application/json"}, // Set header to JSON
        body: jsonEncode(updatedData), // Encode the updated data as JSON
      );
      print('Response received with status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        print('User updated successfully.');
      } else {
        // Handle error if updating fails
        print('Failed to update user: ${response.body}');
        throw HttpException("Failed to update user: ${response.body}");
      }
      return response; // Return the response object
    } catch (e) {
      // Handle exceptions during the HTTP request
      print('Exception occurred: $e');
      rethrow; // Re-throw the caught exception
    }
  }

  // Get a user by ID
  Future<User?> getUserById(String userId) async {
    final url = Uri.parse(Url.getUserById(userId)); // Construct URL with the userId
    print('Preparing to send GET request to URL: $url');

    try {
      // Send GET request to fetch user details
      final response = await http.get(url);
      print('Response received with status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body); // Decode the response
        return User.fromJson(data); // Convert JSON to a User object
      } else {
        // Handle error if fetching user fails
        print('Failed to fetch user: ${response.body}');
        throw HttpException("Failed to fetch user: ${response.body}");
      }
    } catch (e) {
      // Handle exceptions during the HTTP request
      print('Exception occurred: $e');
      rethrow; // Re-throw the caught exception
    }
  }

  // Fetch user data by ID and update the UI method
  Future<void> fetchUserDataById(String userId, Function(Map<String, dynamic>) onSuccess,
      {Function(String)? onError}) async {
    final url = Uri.parse(Url.getUserById(userId)); // Construct URL with the userId
    print('Fetching data for ID: $userId');

    try {
      // Send GET request to fetch user details
      final response = await http.get(url);

      print('Response received with status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body); // Decode the response
        onSuccess(data); // Call the success callback with the fetched data
      } else {
        // Handle error if fetching user fails
        final errorText = response.body;
        print('Error fetching data: Status ${response.statusCode}, Response: $errorText');
        if (onError != null) onError('Failed to retrieve data: $errorText');
      }
    } catch (e) {
      // Handle exceptions during the HTTP request
      print('Error: $e');
      if (onError != null) {
        onError('Failed to retrieve data. Please check your connection and try again.');
      }
    }
  }

  // Placeholder method for fetching user by ID
  static fetchUserById(String userId) {}
}
