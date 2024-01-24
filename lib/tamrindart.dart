void main() {
  // Number of rows and columns
  final rows = 10;
  final cols = 3;

  // Initialize seat number
  var seatNum = 1;

  // Print each row
  for (var r = 0; r < rows; r++) {
    var row = '';

    for (var c = 0; c < cols; c++) {
      // Check for VIP boss seat rows
      if (r == 7 || r == 8) {
        row += 'BOSS';
      } else {
        // Format seat number as string
        row += seatNum.toString().padLeft(2, '0');
        seatNum++;
      }

      row += '    ';
    }

    print(row);
  }
}
