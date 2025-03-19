bool isWhite(int index) {
  int row = index ~/ 8;
  int column = index % 8;

  bool isWhite = (row + column) % 2 == 0;

  return isWhite;
}

bool isInBoard(int row, int column) {
  return row >= 0 && row < 8 && column >= 0 && column < 8;
}
