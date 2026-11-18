// Student: <FULL NAME>
// Reg no: 23062
const String regNo = '23062';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by XX
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String formatRwf(int amount) {
  // by XX
  String digits = amount.abs().toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    if (count > 0 && count % 3 == 0) result = ',$result';
    result = digits[i] + result;
    count++;
    i--;
  }
  String sign = amount < 0 ? '-' : '';
  return '$sign$result RWF';
}

bool isValidPin(String pin) {
  // by XX
  if (pin.length != 5) return false;
  bool allSame = true;
  int i = 0;
  while (i < pin.length) {
    int c = pin.codeUnitAt(i);
    if (c < 48 || c > 57) return false; // not a digit 0-9
    if (pin[i] != pin[0]) allSame = false;
    i++;
  }
  if (pin == '12345') return false;
  if (allSame) return false;
  return true;
}

int sendMoney(int balance, int amount) {
  // by XX
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by XX
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime must be between 100 and 50,000 RWF');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Airtime ${formatRwf(amount)} bought. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // 1. PIN checks
  print('12345 -> ${isValidPin('12345')}');
  print('77777 -> ${isValidPin('77777')}');
  print('4821 -> ${isValidPin('4821')}');
  print('48a21 -> ${isValidPin('48a21')}');
  print('4821$d -> ${isValidPin('4821$d')}');

  // 2. Starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // 3. Transactions
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // 4. Final balance
  print('Final balance: ${formatRwf(balance)}');

  // 5. My own tests (expected output in the comment)
  print(formatRwf(100000)); // 100,000 RWF
  print(formatRwf(-1000000)); // -1,000,000 RWF
  print(formatRwf(-100)); // -100 RWF  <- risky case: negative number, no comma after '-'
  print(isValidPin('00000')); // false (same digit five times)
  print(isValidPin('90210')); // true
  print(isValidPin('')); // false (empty string)
  print(isValidPin(' 1234')); // false (space is not a digit)
}
