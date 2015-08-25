//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print("The string is: \(str)")

var name:String = "Jim"

print("Hello Ser \(name)")
print("Or this style Ser " + name)

var int:Int = 42

int *= 2

int /= 2

// lose a little accuracy here...
int /= 4

var anotherInt:Int = 7

print(int * anotherInt)

var number:Double = 11.5

number *= 3

//can't multiple dislike variable types

var newDouble:Double = number * Double(int)
print("newDouble = \(newDouble)")


var isMale:Bool = true

var double1:Double = 24.5
var int1:Int = 7

print("Their product = \(double1 * Double(int1))")
