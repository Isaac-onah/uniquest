
import 'package:uniquest/utils/formatter/formatter.dart';

///Model class representing user date
class UserModel {
  //Keep those values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String email;
  String phoneNumber;
  String referral;
  double wallet;
  bool userstatus;
  bool usedreferral;
  String profilePicture;

  /// Constructor for UserModel
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.referral,
    required this.userstatus,
    required this.usedreferral,
    required this.wallet,
    required this.profilePicture,
  });

  ///Helper function to get the full name
  String get fullName => '$firstName $lastName';

  ///Helper function to format phone number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  ///static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  ///static function to generate a username from the full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaeUsername = "$firstName$lastName";
    String usernameWithPrefix = "fwt_$camelCaeUsername";

    return usernameWithPrefix;
  }

  /// Static functiom to create an empty user model
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        email: '',
        phoneNumber: '',
        referral: '',
        userstatus: true,
        usedreferral: false,
        wallet: 0.0,
        profilePicture: '',
      );

  ///Convert model to JSON structure for staring data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'Referral': referral,
      'UserStatus':userstatus,
      'UsedReferral':usedreferral,
      'Wallet': wallet,
      'ProfilePicture': profilePicture,
    };
  }

  ///factory method to crete a UserModel from a firebase document snapshot
  factory UserModel.fromSnapshot() {

      return UserModel.empty();

  }
}