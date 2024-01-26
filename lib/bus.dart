class Bus {
  static List<Bus> busList = [];
  // Bus class implementation
  Bus(
    this.name,
    this.type,
    this.id,
    this.seatsList,
  );
  final String name;
  final BusType type;
  final int id;
  final List<String> seatsList;
  late int cancelCount = 0;
  // Set seat status
  void setSeatStatus(int seatNumber, String status) {
    seatsList[seatNumber] = status;
  }
}

enum BusType { vip, normal }
