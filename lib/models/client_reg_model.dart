
class ClientRegModel {
  final String restaurantName;
  final String owner;
  final String address;
  final String city;
  final String type;
  final String seatCount;
  final String workingHours;
  final String profileImage;
  final String pdf;
  final List   menuCards;
  final String username;
  final String password;
  final String email;


  ClientRegModel(
      {required this.restaurantName,
      required this.owner,
      required this.address,
      required this.city,
      required this.type,
      required this.seatCount,
      required this.workingHours,
      required this.profileImage,
      required this.pdf,
      required this.menuCards,
       required this.username,
       required this.password,
        required this.email,
      });

  addContact(ClientRegModel clientData) {}
}



