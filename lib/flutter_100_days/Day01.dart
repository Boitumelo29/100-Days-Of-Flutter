import 'package:flutter/material.dart';

void main() {
  ///variables and data types
  // variables are used to store data that can be used and manipulated throughout the program
  //in dart you can use var or string etc to define the variable.
  var name = "flutter";
  String greeting = "Welcome to";
  print(greeting + name);

  ///control flow
  //controll flow allows you to create paths in the code that allows you to only execute code under certain conditions, this includes
  //if, else,for,while and switch
  var score = 85;

  //if
  if (score >= 85) {
    print("well done");
  } else if (score >= 75) {
    print("youve got this");
  } else {
    print("keep going almost there");
  }

  //for loop
  for (var i = 0; i < 5; i++) {
    print("hello $i");
  }

  //while loop
  var j = 0;
  while (j < 5) {
    print("world$j");
    j++;
  }

  //functions
  //functions are blocks of code that perfomr a specific task and can be used repeatedly in the program

  //this function does not have a return type
  void test() {
    print("test 1");
  }

  //this function has a return type
  int add(int a, int b) {
    return a + b;
  }

  print(add(100, 10));

  //error handling
  try {
    print("we are learning");
  } catch (e) {
    print(e);
  }
}

///The assignment

class Assignment1 {
  //create a program that prints a greeting
  void printAssignment() {
    String greeting = "hello world";
    print(greeting);
  }

//write a function that calculates the area of a rectangle
  int rectangleAssignment(int length, int width) {
    int answer;
    answer = length * width;
    return answer;
  }

  //create a loop that prints numbers 1 to 10
  void loopAssignment() {
    for (var i = 0; i > 10; i++) {
      print("${i + 1}");
    }
  }

//write an if-else statement that prints whether a number is an even number or odd number
  evenNumber(int number) {
    if (number % 2 == 0) {
      print("the number is an even number");
    } else {
      print("the number is an odd number");
    }
  }

//handle a division by zero error with try catch block
  void tryCatchAssignment() {
    try {
      var results = 10 ~/ 0;
    } catch (e) {
      print(e);
    }
  }
}
