// Student: <FULL NAME>
// Reg no: 23062
const String regNo = '23062';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// ---------- B2 ----------
int countVowels(String text) {
  // by XX
  String lower = text.toLowerCase(); // <- this line makes capital letters count
  int count = 0;
  int i = 0;
  while (i < lower.length) {
    if ('aeiou'.contains(lower[i])) count++;
    i++;
  }
  return count;
}

// ---------- B3 ----------
String initials(String fullName) {
  // by XX
  List<String> words = fullName.trim().split(RegExp(r'\s+'));
  String result = '';
  int i = 0;
  while (i < words.length) {
    if (words[i].isNotEmpty) {
      result += '${words[i][0].toUpperCase()}.';
    }
    i++;
  }
  return result;
}

/* First draft of B3 (kept for Part G):
String initials(String fullName) {
  // by XX
  List<String> words = fullName.split(' ');
  String result = '';
  int i = 0;
  while (i < words.length) {
    result += '${words[i][0].toUpperCase()}.';   // crashes on an empty word
    i++;
  }
  return result;
}
*/

// ---------- C5 ----------
void drawTriangle(int height) {
  // by XX
  int row = 1;
  while (row <= height) {
    String symbol = row % 2 == 1 ? '*' : '#';
    print(' ' * (height - row) + symbol * row);
    row++;
  }
}

// ---------- D2 ----------
int momoFee(int amount) {
  // by XX
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  // by XX
  if (phone.length != 10) return 'INVALID';
  return phone.substring(0, 3) + '*' * (phone.length - 5) + phone.substring(phone.length - 2);
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // B2
  print('--- B2 ---');
  String myName = '<FULL NAME>'; // <- replace with your real full name
  print('$myName has ${countVowels(myName)} vowels');

  // B3
  print('--- B3 ---');
  print(initials(myName));
  print(initials('  ana uwase  '));
  print("'${initials('   ')}'");

  // C5
  print('--- C5 ---');
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2
  print('--- D2 ---');
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone('0788123456')}');
    totalFees += fee;
    i++;
  }
  print('Total fees: $totalFees RWF');
}
