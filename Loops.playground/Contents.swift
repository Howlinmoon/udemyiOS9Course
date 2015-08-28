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



// While Loops

var i = 1

while i < 10 {
    
    print("i is \(i)")
    i++
}


var counter = 1

while counter < 11 {
    
    print("\(counter) x 5 = \(counter * 5)")
    
    counter++
}


var anotherArray = [0, 1, 2, 3, 4, 5, 6, 7]

counter = 0

while counter < anotherArray.count {
    
    print(anotherArray[counter])
    
    counter++
}

var lastArray = [ 10, 15, 25, 73, 100, 91, 27]
counter = 0
while counter < lastArray.count {
    
    var subtracted = lastArray[counter] - 1
    print("original value at counter \(counter) is \(lastArray[counter]) less 1 is \(subtracted)")
    counter++
}

