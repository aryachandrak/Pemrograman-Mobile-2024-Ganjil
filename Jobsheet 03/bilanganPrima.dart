void main() {
  
  bool isPrime(int num) {
    if (num < 2) {
      return false;
    }
    for (int i = 2; i <= num ~/ 2; i++) {
      if (num % i == 0) {
        return false;
      }
    }
    return true;
  }

  for (int number = 1; number <= 201; number++) {
    if (isPrime(number)) {
      print("$number Arya Chandra Kusuma 2241720228");
    }
    else {
      print(number);
    }
  }
}
