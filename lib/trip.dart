import 'bus.dart';

class Trip {
  static List<Trip> tripList = [];
  // Trip class implementation
  Trip(this.startPoint, this.stopPoint, this.bus, this.price, this.tripId);

  final Bus bus;
  final String startPoint;
  final String stopPoint;
  final int price;
  final int tripId;
}
