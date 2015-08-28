//: Playground - noun: a place where people can play

import UIKit

// For Loops

for var counter = 1; counter <= 10; counter++ {
    print("counter is now \(counter)")
}


// even numbers, 2 through 20

for var evenNumber = 2; evenNumber <= 20; evenNumber+=2 {
    print("even number is now \(evenNumber)")
}

/* 
    this is a block
    comment
*/

var arr = [9, 10, 42, 96]
for x in arr {
    print("x = \(x)")
}

for (index, value) in arr.enumerate() {
    arr[index]+=10
}

for (index, value) in arr.enumerate() {
    print(value)
}


var targetArray = [ 100.0, 25.0, 32.0, 17.0, 110.0, 93.0]

for (index, value) in targetArray.enumerate() {
    var halfValue = value / 2
    print("half of value \(value) at index \(index) is \(halfValue)")
}
