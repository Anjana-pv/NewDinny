class ClientRegModel {
  final String restaurantName;
  final String owner;
  final String address;
  final String pinCode;
  final String type;
  final int     seatCount;
  final int     workingHours;
  final String profileImage;
  final String pdf;
  final List    menuCards;

  ClientRegModel(
      {required this.restaurantName,
      required this.owner,
      required this.address,
      required this.pinCode,
      required this.type,
      required this.seatCount,
      required this.workingHours,
      required this.profileImage,
      required this.pdf,
      required this.menuCards});
}
