//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"

var newString = str + " Jim"

for character in newString.characters {
    print(character)
}

var newTypeString = NSString(string: newString)

newTypeString.substringToIndex(5)
newTypeString.substringFromIndex(6)
newTypeString.substringWithRange((NSRange(location: 3, length: 5)))

newTypeString.containsString("Jim")

newTypeString.componentsSeparatedByString(" ")

newTypeString.uppercaseString
newTypeString.lowercaseString

