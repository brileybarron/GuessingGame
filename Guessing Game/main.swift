//
//  main.swift
//  Guessing Game
//
//  Created by Briley Barron on 8/20/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import Foundation

print("Welcome to the Guessing Game")
var gameLoop = true
var counter = 5
//Asks user how many numbers would like to be chosen from?
func playingAgain () {
    print("Would you like to try again? (Y/N)")
    var playAgain = readLine()
    playAgain = playAgain?.uppercased()
    //Does the user want to play again?
    while playAgain == "Y" || playAgain == "YES"{
        counter = 5
        guessingGame()
    }
    while playAgain == "N" || playAgain == "no" || playAgain == "No" || playAgain == "nO" || playAgain == "NO" || playAgain == "n"{
        gameLoop = false
        exit(0)
    }
    while playAgain != "Y" || playAgain != "YES" ||  playAgain != "N" ||  playAgain != "NO"{
        print("please respond with a yes or no")
        playingAgain ()
    }
}
func guessingGame() {
    repeat{
        if counter == 5 {
            
            print("How many integers would you like to choose from?")
            var howManyNumbers = UInt32(readLine()!)
            if howManyNumbers == nil {
                print("Please pick an integer")
                howManyNumbers = UInt32(readLine()!)!
            }
            // Generates a Random number based on how many numbers would like to be guessed upon
            let randomNumber = Int(arc4random_uniform(howManyNumbers! + 1))
            
            print("Please guess an integer between 0 and \(howManyNumbers ?? 100)")
            
            // Determines if there are any guesses remaining if so then user continues to guess
            while counter != 0{
                var userGuess = Int(readLine()!)
                //If the user's guess isn't a number then retry
                while userGuess == nil {
                    print("That's Not An Integer")
                    userGuess = Int(readLine()!)
                }
                
                //If the user's guess is correct
                if userGuess == randomNumber{
                    print("Congratulations you won")
                    playingAgain()
                    
                }else{//If the user's guess is not correct deduct one guess and check is the guesses are greater than 0
                    counter -= 1
                    if counter == 0 {
                        print("The correct answer was \(randomNumber)")
                        playingAgain()
                    }
                    
                    //Too high or Too low?
                    if userGuess != randomNumber && userGuess! - randomNumber < 0  &&  counter != 0{
                        print("Sorry that was too low you have \(counter) guesses remaining.")
                        print("Please try again")
                    }else{
                        print("Sorry that was too high you have \(counter) guesses remaining.")
                        print("Please try again")
                    }
                }
                
            }
        }
    }while gameLoop == true
}

guessingGame()
