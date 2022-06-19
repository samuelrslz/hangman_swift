//
//  main.swift
//  Hangman Game
//
//  Created by Samuel Ríos-Lazo on 6/16/22.
//

import Foundation

func main() {
    // Welcome to the game and username
    print("Hello my friend. What's your name?")
    let username = readLine()
    print("Good Luck! \(username!), and welcome to the guessing game!")

    // Create an array of words to pick from
    let words = ["rainbow", "computer", "science", "programming", "swift", "python", "mathematics", "player", "condition", "reverse", "water"]

    // Select a random word from that array. This tests for any nil value before using the randomElement()
    let word = words.randomElement()!

    print(word)   // Just prints the word for testing purposes.

    print("Guess the characters")

    var guesses = ""  // Initializes the guesses and turns
    var turns = 6

    while (turns > 0) {   // While you're still alive, continue with the game.
        var failed = 0

        for char in word {
            if guesses.contains(char) {   // If the guess was right, show the letter.
                print(char, separator: "")
            }
            
            else {   // If the guess was wrong, add to the amount of failures.
                print("_")
                failed += 1
            }
        }
        
        if (failed == 0) {
            print()
            print("You Win")
            print("The word is: \(word)")
            words_guessed.words_list.append(word)   // Appends the word to our list of guessed words.
            words_guessed.words_guessed += 1
            break
        }
        
        print()
        let guess = readLine()   // Asks the user for a guess.
        
        guesses += guess!   // Add that guess to the total of guesses.
        
        if (word.contains(guess!)) == false {
            turns -= 1   // Deducts one turn if the guess was incorrect.
            print("Wrong")
            print("You have \(turns) more guesses")
            print("This is how you look right now:")
            drawguy(turns: turns)   // Draws the guy in the actual state.
            
            if (turns == 0) {   // When no more turns, you die.
                print("You Loose")
            }
        }
        
    }
    print("Do you want to keep playing? (Y/N) ")
    keep_playing = readLine()!
}

func drawguy(turns:Int){
    // Prints the guy according to how many turns the user has remaining.
    print(" -------")
    print(" |     |")
    if (turns <= 5) {
        print(" O")
    }
    if (turns <= 4) {
        print("\\ ", terminator: "")
        if (turns <= 3) {
            print("/")
        }
        else {
            print("")
        }
    }
    if (turns <= 2) {
        print(" |")
    }
    if (turns <= 1) {
        print("/ ", terminator: "")
        if (turns == 0) {
            print("\\")
        }
        else {
            print("")
        }
    }
    print("")
    print("")
}

class wordsGuessed {
    var words_list: [String] = []
    var words_guessed = 0
}

let words_guessed = wordsGuessed()

var keep_playing = "Y"
while keep_playing.uppercased() == "Y" {
    print("")
    main()
}

print("Thanks for playing!")
print("You guessed \(words_guessed.words_guessed) words, which were: ")
for x in words_guessed.words_list {
    print(x)
    }

