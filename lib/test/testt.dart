void main() {
  List a = ['1', '2', '3', '4', '5'];
  a.add('value');

  for (int i = 0; i < a.length; i++) {
    print(a[i]);
  }
  a.map((e) => print(e)).toList();
}
