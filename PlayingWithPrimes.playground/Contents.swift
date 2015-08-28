//: Playground - noun: a place where people can play

import UIKit
// Playing with Primes

var number = 99

var isPrime = true

if number == 1 {
    isPrime = true
} else if number == 2 {
    isPrime = false
} else if number > 2 {

    for var i = 2; i < number; i++ {
    
        if number % i == 0 {
            print("This number is NOT a prime - \(i) is a factor")
            isPrime = false
        }
    }
}
print(isPrime)