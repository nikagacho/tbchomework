//1
func factorialCalculator(number: Int) -> Int {
    var factorial = 1
    
    for i in 1...number {
        factorial *= i
    }
    
    return factorial
}

print(factorialCalculator(number: 7))

//2
func fibonacciSequence() -> [Int]{
    var numbers: [Int] = [0, 1]
    
    for i in 2...19{
        var newNumber = numbers[i - 1] + numbers[i - 2]
        numbers.append(newNumber)
    }
    return numbers
}

print(fibonacciSequence())

//3
func palindromeChecker (word: String) -> Bool {
    var isPalindrome: Bool = false
    var reversedWord: String =  ""
    for character in word {
        reversedWord = String(character) + reversedWord
    }
    if word == reversedWord {
        isPalindrome = true
    } else {
        isPalindrome = false
    }
    
    return isPalindrome
}

palindromeChecker(word: "saippuakivikauppias")

//4
func squaredCalculator (numbers1: [Int]) -> [Int] {
    var squaredNumbers: [Int] = []
    for i in numbers1 {
        squaredNumbers.append(i*i)
    }
    return squaredNumbers
}

print(squaredCalculator(numbers1: [9, 2, 5, 21, 6]))

//5
func wordDictionary(sentence: String) -> [String: Int] {
    var wordFrequencyDict: [String: Int] = [:]
    let words = sentence.lowercased() .split(separator: " ")

    for word in words {
        if word.isEmpty {
            continue
        }
        if let count = wordFrequencyDict[String(word)] {
            wordFrequencyDict[String(word)] = count + 1
        } else {
            wordFrequencyDict[String(word)] = 1
        }
    }
    return wordFrequencyDict
}

print(wordDictionary(sentence: "This is a sentence AND and it will be "))

//6
var closureBinary: (Int) -> String = { numbr in
    var result = "0"
    var num = numbr
    
    while num > 0 {
        result = "\(num % 2)" + result
        num /= 2
    }
    
    if result != "0" {
        result.removeFirst()
    }
    
    return result
}
let binaryResult = closureBinary(8)
print(binaryResult)

//7
var intRemover: (Array<Int>) -> Array<Int> = { numbersFilt in
    var evenNumbers: [Int] = []
    for i in numbersFilt {
        if i % 2 == 0 {
            evenNumbers.append(i)
        }
    }
    return evenNumbers
}
let filteredNumbers = intRemover([4,9,11,23,20,40])
print(filteredNumbers)


//8
var ages = [7, 9, 21, 40, 91, 24, 66, 2]

let multipliedAges = ages.map { (nmbr) in
    return nmbr*10
}

print(multipliedAges)


//9
import Foundation

let arrayOfNumbers =  [4, 6, 21, 23, 45, 102]

func calculateTotal (using closure: @escaping ([Int]) -> Int) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 3.0){
        let total = closure(arrayOfNumbers)
        print("Sum of the array members is", " ", (total))
    }
}

let arrayTotal: (Array<Int>) -> Int = {
    var totalNumb = 0
    for i in $0 {
        totalNumb += i
    }
    return totalNumb
}

calculateTotal(using: arrayTotal)

//10
var numbersAndMore = ["3", "4", "-21", "Constitution", "WWE", "9"]

let integerValues = numbersAndMore.compactMap { member in
    if let intValue = Int(member), intValue % 2 != 0{
        return intValue
    }
    else {
        return nil
    }
    
}
print(integerValues)
