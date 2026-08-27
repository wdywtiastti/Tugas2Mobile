int penjumlahan(int a, int b){
  return a+b;
}

int pengurangan(int a, int b){
  return a-b;
}

int perkalian(int a, int b){
  return a * b;
}

double pembagian(int a, int b){
  return a/b;
}

void main(){
  int a = 25;
  int b = 10;

  print("${a} + ${b} = ${penjumlahan(a, b)}");
  print("${a} - ${b} = ${pengurangan(a, b)}");
  print("${a} * ${b} = ${perkalian(a, b)}");
  print("${a} / ${b} = ${pembagian(a, b)}");
}