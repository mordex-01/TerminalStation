import 'bus.dart';

class Trip extends Bus {
  static List<Trip> tripList = [];
  Trip(
    this.startPoint,
    this.stopPoint,
    this.bus,
    this.price,
    this.tripID,
  ) : super(
          bus.name,
          bus.type,
          bus.id,
          bus.seatsList,
        );
  final Bus bus;
  final String startPoint;
  final String stopPoint;
  final double price;
  final int tripID;
  late double netWorth = 0;
}
