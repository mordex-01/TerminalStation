class Seats {
  String id;
  SeatsType type;
  int price;

  Seats(this.id, this.type, this.price);
}

enum SeatsType {
  rr,
  bb,
  normal,
}
