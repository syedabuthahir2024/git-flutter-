// class User {
//   final String? id;
//   final String? firstName;
//   final String? lastName;
//   final String? email;
//   final String? phone;

//   User({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.phone,
//   });

//   // Factory constructor for creating a new User instance from a map.
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'] as String?,
//       firstName: json['firstName'] as String?,
//       lastName: json['lastName'] as String?,
//       email: json['email'] as String?,
//       phone: json['phone'] as String?,
//     );
//   }
// }


// Class definition for User model
class User {
  // Define nullable fields for user attributes
  final String? id; // User ID 
  final String? firstName; // User's first name 
  final String? lastName; // User's last name 
  final String? email; // User's email 
  final String? phone; // User's phone number 

  // Constructor for initializing a User instance
  User({
    this.id, //  ID
    this.firstName, //  first name
    this.lastName, //  last name
    this.email, //  email
    this.phone, //  phone number
  });

  // Factory constructor for creating a User instance from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    // Map the values from JSON to the User fields
    return User(
      id: json['id'] as String?, // Assign the 'id' from JSON, casting it as String
      firstName: json['firstName'] as String?, // Assign the 'firstName', casting as String
      lastName: json['lastName'] as String?, // Assign the 'lastName', casting as String
      email: json['email'] as String?, // Assign the 'email', casting as String
      phone: json['phone'] as String?, // Assign the 'phone', casting as String
    );
  }
}
