// import 'package:get/get.dart';
// import 'package:cruds/model/user_model.dart';
// import 'package:cruds/service_file.dart'; // Adjust the import according to your service file location

// class GetController extends GetxController {
//   var userList = <User>[].obs;
//   var isLoading = false.obs;
//   var errorMessage = ''.obs;
//   var selectedUser = Rx<User?>(null);

//   var users; // Properly initialize as Rx<User?>

//   @override
//   void onInit() {
//     fetchUsers();
//     super.onInit();
//   }

//   Future<void> fetchUsers() async {
//     isLoading.value = true;
//     try {
//       var fetchedUsers = await ApiService.fetchUsersFromApi();
//       userList.value = fetchedUsers;
//         } catch (e) {
//       errorMessage.value = "Failed to fetch users.";
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> fetchUserById(String userId) async {
//     isLoading.value = true;
//     try {
//       var user = await ApiService.fetchUserById(userId);
//       selectedUser.value = user; // Set the selected user
//     } catch (e) {
//       errorMessage.value = "Failed to fetch user.";
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void addUser(User newUser) {}
// }


import 'package:get/get.dart'; // Import GetX for state management
import 'package:cruds/model/user_model.dart'; // Import the User model
import 'package:cruds/service_file.dart'; // Import your service file to make API calls

// Controller to manage the fetching and handling of users
class GetController extends GetxController {
  var userList = <User>[].obs; // Observable list of users, updates the UI when changed
  var isLoading = false.obs; // Observable for loading state, used to show a loading indicator
  var errorMessage = ''.obs; // Observable for error messages, holds error details when needed
  var selectedUser = Rx<User?>(null); // Observable for holding a single selected user

  var users; // Placeholder for Rx<User?> (should be properly initialized based on usage)

  @override
  void onInit() {
    fetchUsers(); // Fetch users when the controller is initialized
    super.onInit(); // Ensure the parent's onInit method is also called
  }

  // Function to fetch all users from the API
  Future<void> fetchUsers() async {
    isLoading.value = true; // Set loading to true when fetching data
    try {
      var fetchedUsers = await ApiService.fetchUsersFromApi(); // Fetch users using the service
      userList.value = fetchedUsers; // Update the user list with the fetched data
    } catch (e) {
      // If there's an error, update the error message
      errorMessage.value = "Failed to fetch users.";
    } finally {
      isLoading.value = false; // Reset loading state when the operation is finished
    }
  }

  // Function to fetch a specific user by their ID
  Future<void> fetchUserById(String userId) async {
    isLoading.value = true; // Set loading to true while fetching user data
    try {
      var user = await ApiService.fetchUserById(userId); // Fetch user by ID from the API
      selectedUser.value = user; // Set the fetched user as the selected user
    } catch (e) {
      // If there's an error, update the error message
      errorMessage.value = "Failed to fetch user.";
    } finally {
      isLoading.value = false; // Reset loading state when the operation is finished
    }
  }

  // Function to add a new user to the list (currently empty, implementation needed)
  void addUser(User newUser) {
    // Add user implementation can be added here
  }
}
