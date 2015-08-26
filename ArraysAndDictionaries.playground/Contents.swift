//: Playground - noun: a place where people can play

import UIKit

//Arrays

var array = [1, 2, 3, 4]

print("Value at index 2 is: \(array[2])")

//Add an item to the array

array.append(42)

print("Latest item is: \(array[4])")

// Remove an item

array.removeAtIndex(1)

print(array)

var newArray = [40, 25, 17]

// remove the middle item

newArray.removeAtIndex(1)

// add a mew item with the value as the product of the 2 remaining items

newArray.append(newArray[0] * newArray[1])

// Dictionaries

var dictionary = ["computer": "what I am programming", "coffee": "nasty drink"]
print(dictionary["coffee"]!)

print(dictionary.count)

dictionary["pen"] = "Old fashioned writing implement"

dictionary.removeValueForKey("coffee")

print(dictionary)



var menu = ["Hamburger": 5.00, "French Fries": 2.00, "Shake": 3.00]

var totalCost = menu["Hamburger"]! + menu["French Fries"]! + menu["Shake"]!

print("The total cost of the meal at FatBurger is: \(totalCost)")





