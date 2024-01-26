void main() {
  addCancelCount();
}

class Bus {
  Bus(this.CancelCount);
  final int CancelCount;
}

void addCancelCount() {
  int CancelCountt = 0;
  Bus a = Bus(CancelCountt);
  int b = a.CancelCount + 1;
  print(b);
}
