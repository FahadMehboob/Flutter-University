// Handle a division by zero error with a try-catch block.

void main() {
  try {
    var result = 10 ~/ 0;
  } catch (e) {
    print(e);
  } finally {
    print("Done");
  }
}
