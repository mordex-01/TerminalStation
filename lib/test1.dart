// Main function
//attach seats to bosses and can edit each seat
//fix errors and remain
import 'dart:io';

void main() {
  Terminal.terminalMenu();
}

class Terminal {
  static void terminalMenu() {
    // Terminal menu implementation
    print("""
**PassengerTerminal Menu
1-Bus definition
2-Trip definition
3-View available trips
7-Exit
""");
    print("Please Enter The Number");
    String? input = stdin.readLineSync();
    if (input == null || input.isEmpty) {
      print("*Error Please Enter Valid Number");
      return terminalMenu();
    }
    if (int.tryParse(input) == null) {
      print("*Error Please Enter Valid Number");
      return terminalMenu();
    }
    if (int.parse(input) > 7 || int.parse(input) < 1) {
      print("*Error Please Enter Valid Number");
      return terminalMenu();
    }
    if (input == "1") {
      busDefinition();
    }
    if (input == "2") {
      tripDefinition();
    }
    if (input == "3") {
      viewAvailableTrips();
    }
    if (input == "4") {}
    if (input == "5") {}
    if (input == "6") {}
    if (input == "7") {
      print("GoodBye...");
      exit(0);
    }
  }

  // (ترمینال مسافربری) PassengerTerminal implementation
//Bus definition
  static void busDefinition() {
    // Bus definition implementation
    int id = Bus.busList.length;

    print("**Bus definition");

    print("Enter Bus Name (0-Cancel)");

    String? input1 = stdin.readLineSync();

    if (input1 == null || input1.isEmpty) {
      print("*Error Canceled Enter Valid NAME");
      return terminalMenu();
    }

    if (input1 == "0") {
      print("Canceled");
      return terminalMenu();
    }

    print("Enter Bus Type");

    print("1->Vip 2->Normal (0-Cancel)");

    String? input2 = stdin.readLineSync();
    if (input2 == null || input2.isEmpty) {
      print("*Error Canceled Enter Valid NAME");
      return terminalMenu();
    }

    if (input2 != "1" && input2 != "2" && input2 != "0") {
      print("**Error Please Enter Valid Number");
      return terminalMenu();
    }

    if (input2 == "0") {
      print("Canceled");
      return terminalMenu();
    }

    if (input2 == "1") {
      List<String> vipSeats = [];
      for (int i = 1; i <= 9; i++) {
        vipSeats.add("0" + i.toString());
      }
      for (int i = 10; i <= 30; i++) {
        vipSeats.add(i.toString());
      }
      Bus bus = Bus(input1, BusType.vip, id, vipSeats);
      Bus.busList.add(bus);
      print("Bus Definition is Compleated");
      id++;
      return terminalMenu();
    }
    if (input2 == "2") {
      List<String> normalSteats = [];
      for (int i = 1; i <= 9; i++) {
        normalSteats.add("0" + i.toString());
      }
      for (int i = 10; i <= 44; i++) {
        normalSteats.add(i.toString());
      }
      Bus bus = Bus(input1, BusType.normal, id, normalSteats);
      Bus.busList.add(bus);
      print("Bus Definition is Compleated");
      return terminalMenu();
    }
  }

  static void tripDefinition() {
    // Trip definition implementation
    print("List Of Trips");
    for (Bus buses in Bus.busList) {
      print(
          "ID : ${buses.id}, Name : ${buses.name}, Type : ${buses.type.name}");
    }
    //Select Buss
    print("Enter bus ID (${Bus.busList.length + 1}-Cancel)");
    String? input = stdin.readLineSync();
    if (input == null || input.isEmpty) {
      print("*Error Canceled Enter Valid ID");
      return terminalMenu();
    }

    int busId = int.parse(input);
    if (busId == Bus.busList.length + 1) {
      print("Canceled");
      return terminalMenu();
    }
    Bus? selectedBus;
    for (Bus bus in Bus.busList) {
      if (bus.id == busId) {
        selectedBus = bus;
        break;
      }
    }
    if (selectedBus != null) {
      print("Selected bus: ${selectedBus.name}");
      // Do something with selectedBus
      print("Enter Trip Start Point(0-Cancel)");
      String? input1 = stdin.readLineSync();
      //if null
      if (input1 == null || input1.isEmpty) {
        print("Canceled");
        return terminalMenu();
      }
      // if Enter 0
      if (input1 == "0") {
        print("Canceled");
        return terminalMenu();
      }
      //if Contains int
      if (int.tryParse(input1) != null) {
        print("*Error Please Enter Valid Start Point");
        return terminalMenu();
      }
      print("Enter Trip Stop Point(0-Cancel)");
      String? input2 = stdin.readLineSync();
      //if null
      if (input2 == null || input2.isEmpty) {
        print("Canceled");
        return terminalMenu();
      }
      //if Enter 0
      if (input2 == "0") {
        print("Canceled");
        return terminalMenu();
      }
      //if Contains int
      if (int.tryParse(input2) != null) {
        print("*Error Please Enter Valid Stop Point");
        return terminalMenu();
      }
      print("Enter Ticket Price(0-Cancel)");
      String? input3 = stdin.readLineSync();
      //if null
      if (input3 == null || input3.isEmpty) {
        print("*Error Please Enter Valid Price");
        return terminalMenu();
      }
      //if contains Letter
      if (int.tryParse(input3) == null) {
        print("*Error Please Enter Valid Price");
        return terminalMenu();
      }
      //if Enter 0
      if (input3 == "0") {
        print("Canceled");
        return terminalMenu();
      }
      String startPoint = input1;
      String stopPoint = input2;
      int price = int.parse(input3);
      if (selectedBus.type == BusType.normal) {
        Trip trip = Trip(
          startPoint,
          stopPoint,
          selectedBus,
          price,
        );
        Trip.tripList.add(trip);
      }
      if (selectedBus.type == BusType.vip) {
        Trip trip = Trip(
          startPoint,
          stopPoint,
          selectedBus,
          price,
        );
        Trip.tripList.add(trip);
      }
      print("Trip Was Sucssesfully added");
    } else {
      print("Invalid bus ID");
    }
    terminalMenu();
  }

  static void viewAvailableTrips() {
    // View available trips implementation
    print("List Of Trips");
    for (Trip trips in Trip.tripList) {
      print(
          "BusID : ${trips.bus.id}, BusName : ${trips.bus.name}, BusType : ${trips.bus.type.name}, Start Point : ${trips.startPoint}, Stop Point : ${trips.stopPoint}, Price : ${trips.price}");
    }
    print("Enter BusID To See Bus Seats (${Trip.tripList.length + 1}-Cancel)");
    String? input = stdin.readLineSync();

    for (Bus buses in Bus.busList) {
      if (buses.id == int.parse(input!)) {
        if (buses.type == BusType.vip) {
//print Seats Vip
          print(
              '${buses.seatsList[0]}    ${buses.seatsList[1]} ${buses.seatsList[2]}');
          print(
              '${buses.seatsList[3]}    ${buses.seatsList[4]} ${buses.seatsList[5]}');
          print(
              '${buses.seatsList[6]}    ${buses.seatsList[7]} ${buses.seatsList[8]}');
          print(
              '${buses.seatsList[9]}    ${buses.seatsList[10]} ${buses.seatsList[11]}');
          print(
              '${buses.seatsList[12]}    ${buses.seatsList[13]} ${buses.seatsList[14]}');
          print('${buses.seatsList[15]}');
          print('${buses.seatsList[16]}');
          print('${buses.seatsList[17]}');
          print(
              '${buses.seatsList[18]}    ${buses.seatsList[19]} ${buses.seatsList[20]}');
          print(
              '${buses.seatsList[21]}    ${buses.seatsList[22]} ${buses.seatsList[23]}');
          print(
              '${buses.seatsList[24]}    ${buses.seatsList[25]} ${buses.seatsList[26]}');
          print(
              '${buses.seatsList[27]}    ${buses.seatsList[28]} ${buses.seatsList[29]}');
        }
        if (buses.type == BusType.normal) {
//print Seats Normal
          print(
              '${buses.seatsList[0]} ${buses.seatsList[1]}   ${buses.seatsList[2]} ${buses.seatsList[3]}');
          print(
              '${buses.seatsList[4]} ${buses.seatsList[5]}   ${buses.seatsList[6]} ${buses.seatsList[7]}');
          print(
              '${buses.seatsList[8]} ${buses.seatsList[9]}   ${buses.seatsList[10]} ${buses.seatsList[11]}');
          print(
              '${buses.seatsList[12]} ${buses.seatsList[13]}   ${buses.seatsList[14]} ${buses.seatsList[15]}');
          print(
              '${buses.seatsList[16]} ${buses.seatsList[17]}   ${buses.seatsList[18]} ${buses.seatsList[19]}');
          print('${buses.seatsList[20]} ${buses.seatsList[21]}');
          print('${buses.seatsList[22]} ${buses.seatsList[23]}');
          print(
              '${buses.seatsList[24]} ${buses.seatsList[25]}   ${buses.seatsList[26]} ${buses.seatsList[27]}');
          print(
              '${buses.seatsList[28]} ${buses.seatsList[29]}   ${buses.seatsList[30]} ${buses.seatsList[31]}');
          print(
              '${buses.seatsList[32]} ${buses.seatsList[33]}   ${buses.seatsList[34]} ${buses.seatsList[35]}');
          print(
              '${buses.seatsList[36]} ${buses.seatsList[37]}   ${buses.seatsList[38]} ${buses.seatsList[39]}');
          print(
              '${buses.seatsList[40]} ${buses.seatsList[41]}   ${buses.seatsList[42]} ${buses.seatsList[43]}');
        }
      }
    }
    if (input == null || input.isEmpty) {
      print("*Error Canceled Enter Valid ID");
      return terminalMenu();
    }
    if (int.parse(input) == Trip.tripList.length + 1) {
      print("Canceled");
      return terminalMenu();
    }
    terminalMenu();
  }
}

class Bus {
  static List<Bus> busList = [];
  // Bus class implementation
  Bus(this.name, this.type, this.id, this.seatsList);
  final String name;
  final BusType type;
  final int id;
  final List<String> seatsList;
}

enum BusType { vip, normal }

class Trip {
  static List<Trip> tripList = [];
  // Trip class implementation
  Trip(
    this.startPoint,
    this.stopPoint,
    this.bus,
    this.price,
  );
  final Bus bus;
  final String startPoint;
  final String stopPoint;
  final int price;
}

class BusSeats extends Trip {
  BusSeats(super.startPoint, super.stopPoint, super.bus, super.price,
      this.seatsList);
  List<int> seatsList = [];
}
