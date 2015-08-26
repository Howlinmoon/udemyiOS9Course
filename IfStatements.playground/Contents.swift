//: Playground - noun: a place where people can play

import UIKit

// If Statements

var age = 16

if age >= 18 {
    print("Age is at least 18")
} else {
    print("Age is not old enough")
}


var name = "NotJim"

if name == "Jim" {
    print("Welcome Jim!")
} else {
    print("Go away \(name)!")
}

if name == "Jim" && age >= 18 {
    print("Welcome older model Jim!")
} else {
    print("Sorry - you are either not Jim, or not old enough")
}


if name == "Jim" || name == "NotJim" {
    print("Welcome - \(name)")
} else {
    print("Sorry - go away \(name)!")
}


var isMale = true

if isMale {
    print("True")
}


var username = "JimBob"
var password = "Secret Password"

let masterName = "JimBob"
let masterPass = "HaHaHaHa"

if (username == masterName) && (password == masterPass) {
    print("You have fully authenticated")
} else {
    if username == masterName {
        print("You have the user name correct, but the password is incorrect")
    } else if password == masterPass {
        print("You have the password correct, but the username is incorrect")
        
    } else {
        print("You have neither the user name or password correct - go away!")
    }
}



