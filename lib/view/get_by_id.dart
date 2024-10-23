// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class GetByIdScreen extends StatefulWidget {
//   const GetByIdScreen({super.key});

//   @override
//   _GetByIdScreenState createState() => _GetByIdScreenState();
// }

// class _GetByIdScreenState extends State<GetByIdScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   String _message = '';
//   Map<String, dynamic>? _result;

//   Future<void> fetchData() async {
//     final searchValue = _searchController.text.trim();
//     if (searchValue.isEmpty) {
//       setState(() {
//         _message = 'Please enter an ID.';
//         _result = null;
//       });
//       return;
//     }

//     final url = 'http://3.110.164.111:3000/findOne/$searchValue';

//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           _result = data;
//           _message = 'Data retrieved successfully!';
//         });
//       } else {
//         final errorText = response.body;
//         setState(() {
//           _message =
//               'Failed to retrieve data. Status: ${response.statusCode}. Response: $errorText';
//           _result = null;
//         });
//       }
//     } catch (e) {
//       print('Error: $e'); // Print error for debugging
//       setState(() {
//         _message =
//             'Failed to retrieve data. Please check your connection and try again.';
//         _result = null;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Get By ID'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Search:'),
//             TextField(
//               controller: _searchController,
//               decoration: const InputDecoration(
//                 hintText: 'Enter ID to fetch...',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: fetchData,
//               child: const Text('Submit'),
//             ),
//             const SizedBox(height: 20),
//             if (_message.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.only(top: 10.0),
//                 child: Text(
//                   _message,
//                   style: TextStyle(
//                     color: _result == null ? Colors.red : Colors.green,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             if (_result != null)
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: Container(
//                   color: Colors.grey[200],
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Email: ${_result!['email'] ?? 'N/A'}'),
//                       Text('First Name: ${_result!['firstName'] ?? 'N/A'}'),
//                       Text('Last Name: ${_result!['lastName'] ?? 'N/A'}'),
//                       Text('Phone: ${_result!['phone'] ?? 'N/A'}'),
//                     ],
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart'; // Importing Material package for UI components
import 'package:http/http.dart' as http; // Importing http package for making API requests
import 'dart:convert'; // Importing the dart:convert package for JSON handling

// StatefulWidget to fetch user data by ID
class GetByIdScreen extends StatefulWidget {
  const GetByIdScreen({super.key});

  @override
  _GetByIdScreenState createState() => _GetByIdScreenState();
}

// State class to manage the UI and data for GetByIdScreen
class _GetByIdScreenState extends State<GetByIdScreen> {
  // TextEditingController to capture user input (ID to search for)
  final TextEditingController _searchController = TextEditingController();
  
  // String to hold messages (success/failure)
  String _message = '';
  
  // Map to hold the fetched result from the server
  Map<String, dynamic>? _result;

  // Async function to fetch data by ID from the API
  Future<void> fetchData() async {
    // Capture the ID entered by the user
    final searchValue = _searchController.text.trim();
    
    // Check if the input field is empty
    if (searchValue.isEmpty) {
      // Update the message and clear the result if no ID is provided
      setState(() {
        _message = 'Please enter an ID.'; // Show a message prompting the user to enter ID
        _result = null; // Clear the result
      });
      return; // Stop execution if no ID is entered
    }

    // Construct the URL with the entered ID
    final url = 'http://3.110.164.111:3000/findOne/$searchValue';

    try {
      // Make the GET request to the server
      final response = await http.get(Uri.parse(url));

      // Check if the response status is successful
      if (response.statusCode == 200) {
        // Parse the response body as JSON
        final data = json.decode(response.body);
        
        // Update the UI with the fetched result
        setState(() {
          _result = data; // Store the fetched data
          _message = 'Data retrieved successfully!'; // Success message
        });
      } else {
        // Handle errors for non-successful response codes
        final errorText = response.body;
        setState(() {
          _message =
              'Failed to retrieve data. Status: ${response.statusCode}. Response: $errorText'; // Error message
          _result = null; // Clear result on error
        });
      }
    } catch (e) {
      // Catch any exceptions during the request
      print('Error: $e'); // Print the error for debugging
      setState(() {
        _message =
            'Failed to retrieve data. Please check your connection and try again.'; // Show connection error
        _result = null; // Clear result on error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // AppBar with a title
        title: const Text('Get By ID'),
      ),
      // Body containing a form to fetch user data by ID
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the UI
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start
          children: [
            // Label for the input field
            const Text('Search:'),
            // Text field for user to enter the ID to search
            TextField(
              controller: _searchController, // Attach the controller to capture input
              decoration: const InputDecoration(
                hintText: 'Enter ID to fetch...', // Placeholder text
                border: OutlineInputBorder(), // Border style for the text field
              ),
            ),
            const SizedBox(height: 20), // Spacing between the input and the button
            // Button to submit the ID and trigger the fetchData function
            ElevatedButton(
              onPressed: fetchData, // Calls fetchData when pressed
              child: const Text('Submit'), // Button label
            ),
            const SizedBox(height: 20), // Spacing between the button and message area
            // Display the message (success or error)
            if (_message.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10.0), // Padding around the message
                child: Text(
                  _message, // Display the current message
                  style: TextStyle(
                    color: _result == null ? Colors.red : Colors.green, // Color red for error, green for success
                    fontWeight: FontWeight.bold, // Make the message bold
                  ),
                ),
              ),
            // Display the fetched user data if available
            if (_result != null)
              Padding(
                padding: const EdgeInsets.only(top: 20.0), // Padding around the result area
                child: Container(
                  color: Colors.grey[200], // Background color for the result container
                  padding: const EdgeInsets.all(16.0), // Padding inside the result container
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                    children: [
                      // Display the email of the user, or 'N/A' if not available
                      Text('Email: ${_result!['email'] ?? 'N/A'}'),
                      // Display the first name of the user, or 'N/A' if not available
                      Text('First Name: ${_result!['firstName'] ?? 'N/A'}'),
                      // Display the last name of the user, or 'N/A' if not available
                      Text('Last Name: ${_result!['lastName'] ?? 'N/A'}'),
                      // Display the phone number of the user, or 'N/A' if not available
                      Text('Phone: ${_result!['phone'] ?? 'N/A'}'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
