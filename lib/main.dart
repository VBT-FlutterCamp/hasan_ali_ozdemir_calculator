import 'package:calculator/main.dart';
import "dart:io" show Platform, Process, exit, stdin;

double lastValue = 0.0;
double initialNum = 0;
bool first = true;

// Usage
// Head to the lib folder at your terminal
// run "dart main.dart" at terminal

void main(){
  menu();

}

menu(){
  first = false;
  (first)?print("Welcome to dart calculator project") : print("Last value : $lastValue");
  print("1 - Addition");
  print("2 - Multiply");
  print("3 - Divide");
  print("4 - Reset");
  print("5 - Exit");
  print("Select your operation");
  menuSelector();
}

switcher(int n){
  switch (n) {
    case 1:
    print("Enter Number to addition");
      numberselector();
      add(lastValue, initialNum);
      clearTerminal();
      menu();
      break;
    case 2:
    print("Enter Number to multiply");
    numberselector();
      multiply(lastValue, initialNum);
      clearTerminal();
      menu();
      break;
    case 3:
    print("Enter Number to divide");
    numberselector();
      divide(lastValue, initialNum);
      clearTerminal();
      menu();
      break;
    case 4:
    clearTerminal();
    print("Reset !!");
      lastValue = 0;
      first = true ;
      menu();
      break;
    case 5:
      exit(0);
    default:
  }
}

menuSelector(){
  try{
    int _ref = int.parse(stdin.readLineSync()!);
    if (_ref < 6 && _ref > 0) {
      switcher(_ref);
    }else{
      print("please enter a valid number");
    menuSelector();
    }
  }catch (e){
    print(e);
    print("please enter a valid number");
    menuSelector();
  }
}

numberselector(){
  try{
    double _ref = double.parse(stdin.readLineSync()!);
    initialNum = _ref;
  }catch (e){
    print("please enter a valid number");
    numberselector();
  }
}

add(double n1,double n2){
  lastValue= n1+n2;
}

multiply(n1,n2){
  lastValue= n1*n2;
}

divide(n1,n2){
  lastValue= n1/n2;
}

clearTerminal(){
  if(Platform.isWindows) {
  // not tested, I don't have Windows
  // may not to work because 'cls' is an internal command of the Windows shell
  // not an executeable
  print(Process.runSync("cls", [], runInShell: true).stdout); 
} else {
  print(Process.runSync("clear", [], runInShell: true).stdout);
}
}