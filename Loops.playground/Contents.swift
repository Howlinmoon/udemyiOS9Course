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
    print("index = \(index), value = \(value)")
    arr[index]+=10
    print("index = \(index), value = \(value)")
    
}