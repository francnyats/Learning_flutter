void main() {
  try {
    int result = 12 ~/ 0;
    print('The result is $result');
  } on UnsupportedError {
    print('Cannot divide number');
  }

  print('');
  print('CASE 2');
  try {
    int result = 12 ~/ 0;
    print('The result is $result');
  } catch (e) {
    //use catch is you do not know the exception name
    print('the excep is $e');
  }

  print('');
  print('CASE 3');
  try {
    int result = 12 ~/ 0;
    print('The result is $result');
  } catch (e, s) {
    //use catch is you do not know the exception name
    print('the excep is $e');
    print('STACK TRACE /n $s');
  }

  print('');
  print('CASE 2');
  try {
    int result = 12 ~/ 0;
    print('The result is $result');
  } catch (e) {
    //use catch is you do not know the exception name
    print('the excep is $e');
  } finally {
    print('This is final');
  }

  print('');
  print('CASE 5');
  try {
    depositMoney(-200);
  } on DepositException catch (e) {
    print(e.errorMessage());
  }
}

class DepositException implements Exception {
  String errorMessage() {
    return 'You cannot enter amount less than 0';
  }
}

void depositMoney(int amount) {
  if (amount < 0) {
    throw new DepositException();
  }
}
