// import 'package:cruds/controller/get_controller.dart';
// import 'package:cruds/view/delete_screen.dart';
// import 'package:cruds/view/update_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class GetScreen extends StatefulWidget {
//   final String? selectedUserId;

//   const GetScreen({Key? key, this.selectedUserId}) : super(key: key);

//   @override
//   _GetScreenState createState() => _GetScreenState();
// }

// class _GetScreenState extends State<GetScreen> {
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     Get.put(GetController()); // Initialize the GetController
//     _fetchInitialData(); // Fetch initial data when the screen loads
//   }

//   // Method to fetch data and handle loading state
//   Future<void> _fetchInitialData() async {
//     final GetController getController = Get.find<GetController>();

//     // Show loading spinner while fetching data
//     setState(() {
//       isLoading = true; // Set loading state to true
//     });

//     try {
//       await getController.fetchUsers(); // Fetch users from the API
//     } catch (e) {
//       print("Error fetching users: $e");
//       getController.setErrorMessage(
//           "Failed to fetch users. Please check if the server is running.");
//     }

//     // Hide loading spinner after data is fetched
//     setState(() {
//       isLoading = false; // Set loading state to false
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final GetController getController = Get.find<GetController>();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Get Screen'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed:
//                 _fetchInitialData, // Fetch data when refresh button is pressed
//           ),
//         ],
//       ),
//       body: isLoading
//           ? Center(
//               child: CircularProgressIndicator()) // Show loader while fetching
//           : Obx(() {
//               if (getController.isLoading.value) {
//                 return Center(
//                     child:
//                         CircularProgressIndicator()); // Loading animation when fetching data
//               } else if (getController.errorMessage.isNotEmpty) {
//                 return Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         getController.errorMessage.value,
//                         style: TextStyle(color: Colors.red),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 16),
//                       ElevatedButton(
//                         onPressed: _fetchInitialData, // Retry fetching data
//                         child: Text('Retry'),
//                       ),
//                     ],
//                   ),
//                 );
//               } else if (getController.users.isEmpty) {
//                 return Center(child: Text('No users found'));
//               } else {
//                 return ListView.builder(
//                   itemCount: getController.users.length,
//                   itemBuilder: (context, index) {
//                     final user = getController.users[index];

//                     // Check if selectedUserId is provided and matches the current user
//                     if (widget.selectedUserId != null &&
//                         user.id != widget.selectedUserId) {
//                       return SizedBox
//                           .shrink(); // Skip users that don't match selectedUserId
//                     }

//                     return Card(
//                       margin: EdgeInsets.all(16.0),
//                       child: Padding(
//                         padding: EdgeInsets.all(16.0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                       'Email: ${user.email ?? 'Not provided'}'),
//                                   Text(
//                                       'First Name: ${user.firstName ?? 'Not provided'}'),
//                                   Text(
//                                       'Last Name: ${user.lastName ?? 'Not provided'}'),
//                                   Text(
//                                       'Phone: ${user.phone ?? 'Not provided'}'),
//                                 ],
//                               ),
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.edit),
//                               onPressed: () async {
//                                 // Navigate to UpdateScreen with the selected user details
//                                 await Get.to(() => UpdateScreen(
//                                     user: user, userDetails: user));
//                                 // Refresh user list after returning from the update screen
//                                 _fetchInitialData();
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.delete),
//                               onPressed: () async {
//                                 // Navigate to DeleteScreen to handle user deletion
//                                 await Get.to(() => DeleteScreen(),
//                                     arguments: user.id);
//                                 // Refresh user list after deletion
//                                 _fetchInitialData();
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }
//             }),
//     );
//   }
// }


import 'package:cruds/controller/get_controller.dart'; // Import the GetController for managing state and fetching data
import 'package:cruds/view/delete_screen.dart'; // Import DeleteScreen for handling user deletion
import 'package:cruds/view/update_screen.dart'; // Import UpdateScreen for handling user updates
import 'package:flutter/material.dart'; // Import Flutter's material design package for UI components
import 'package:get/get.dart'; // Import GetX for state management and routing

// Define a stateful widget for GetScreen
class GetScreen extends StatefulWidget {
  final String? selectedUserId; // Optional parameter to select a specific user by ID

  const GetScreen({Key? key, this.selectedUserId}) : super(key: key); // Constructor for GetScreen with optional user ID

  @override
  _GetScreenState createState() => _GetScreenState(); // Create the state for GetScreen
}

// Define the state class for GetScreen
class _GetScreenState extends State<GetScreen> {
  bool isLoading = true; // Variable to track if data is loading

  @override
  void initState() {
    super.initState();
    Get.put(GetController()); // Initialize the GetController using GetX dependency injection
    _fetchInitialData(); // Fetch initial data when the screen loads
  }

  // Method to fetch data and handle loading state
  Future<void> _fetchInitialData() async {
    final GetController getController = Get.find<GetController>(); // Get the instance of GetController

    // Show loading spinner while fetching data
    setState(() {
      isLoading = true; // Set loading state to true
    });

    try {
      await getController.fetchUsers(); // Fetch users from the API
    } catch (e) {
      print("Error fetching users: $e"); // Handle any errors during the fetch
      getController.setErrorMessage(
          "Failed to fetch users. Please check if the server is running."); // Display error message
    }

    // Hide loading spinner after data is fetched
    setState(() {
      isLoading = false; // Set loading state to false
    });
  }

  @override
  Widget build(BuildContext context) {
    final GetController getController = Get.find<GetController>(); // Access the GetController instance

    return Scaffold(
      appBar: AppBar(
        title: Text('Get Screen'), // Display title on the app bar
        actions: [
          IconButton(
            icon: Icon(Icons.refresh), // Refresh icon button
            onPressed:
                _fetchInitialData, // Fetch data again when refresh button is pressed
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator()) // Show loader while data is loading
          : Obx(() {
              // Observe changes in the controller state
              if (getController.isLoading.value) {
                return Center(
                    child:
                        CircularProgressIndicator()); // Show loading animation when fetching data
              } else if (getController.errorMessage.isNotEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getController.errorMessage.value, // Display error message if any
                        style: TextStyle(color: Colors.red), // Style for the error message
                        textAlign: TextAlign.center, // Center-align the error message
                      ),
                      SizedBox(height: 16), // Spacing between error message and retry button
                      ElevatedButton(
                        onPressed: _fetchInitialData, // Retry fetching data if an error occurs
                        child: Text('Retry'), // Button label
                      ),
                    ],
                  ),
                );
              } else if (getController.users.isEmpty) {
                return Center(child: Text('No users found')); // Display a message if no users are found
              } else {
                // If data is fetched successfully, display the list of users
                return ListView.builder(
                  itemCount: getController.users.length, // Get the number of users to display
                  itemBuilder: (context, index) {
                    final user = getController.users[index]; // Get the user at the current index

                    // Check if selectedUserId is provided and matches the current user
                    if (widget.selectedUserId != null &&
                        user.id != widget.selectedUserId) {
                      return SizedBox.shrink(); // Skip users that don't match selectedUserId
                    }

                    // Create a card for each user
                    return Card(
                      margin: EdgeInsets.all(16.0), // Add margin around the card
                      child: Padding(
                        padding: EdgeInsets.all(16.0), // Add padding inside the card
                        child: Row(
                          children: [
                            // Display user details in a column
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Email: ${user.email ?? 'Not provided'}'), // Display user email
                                  Text(
                                      'First Name: ${user.firstName ?? 'Not provided'}'), // Display user first name
                                  Text(
                                      'Last Name: ${user.lastName ?? 'Not provided'}'), // Display user last name
                                  Text(
                                      'Phone: ${user.phone ?? 'Not provided'}'), // Display user phone number
                                ],
                              ),
                            ),
                            // Edit button
                            IconButton(
                              icon: Icon(Icons.edit), // Edit icon
                              onPressed: () async {
                                // Navigate to UpdateScreen with the selected user details
                                await Get.to(() => UpdateScreen(
                                    user: user, userDetails: user));
                                // Refresh user list after returning from the update screen
                                _fetchInitialData();
                              },
                            ),
                            // Delete button
                            IconButton(
                              icon: Icon(Icons.delete), // Delete icon
                              onPressed: () async {
                                // Navigate to DeleteScreen to handle user deletion
                                await Get.to(() => DeleteScreen(),
                                    arguments: user.id);
                                // Refresh user list after deletion
                                _fetchInitialData();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
    );
  }
}
