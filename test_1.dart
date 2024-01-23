void main() {
  final page = Page("homePage");
  page.numberPicker.increement();
  print(page.numberPicker.value);
  page.numberPicker.decreement();
  print(page.numberPicker.value);
}

class Page {
  final String title;
  Page(this.title);
  final NumberPicker numberPicker = NumberPicker(1, (int newValue) {
    print("your number is $newValue");
  });
}

class NumberPicker {
  final int initialValue;
  int value;
  void Function(int newValue) onIncreementTap;
  NumberPicker(this.initialValue, this.onIncreementTap) : value = initialValue;
  void increement() {
    value++;
  }

  void decreement() {
    value--;
  }
}
