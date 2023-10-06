//1
enum DayOfWeek: String {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
}
DayOfWeek.friday

func isWeekDay (days: DayOfWeek) {
    switch days {
    case .monday,.tuesday, .wednesday,.thursday,.friday:
        print("This day is a weekday")
    case .saturday, .sunday:
        print("this day is a weekend <3")
    }
}

isWeekDay(days: .monday)

//2
enum Weather {
    case sunny(Double)
    case rainy(Double)
    case cloudy(Double)
    case snowy(Double)
}

func whatToWear(weather: Weather) {
    switch weather {
    case .sunny(var temperature):
        if temperature > 25 {
            print("It's VERY hot, We can wear shorts and a T-shirt")
        } else{
            print("We can wear jeans and a shirt")
        }
    case .rainy(var temperature):
        if temperature > 20 {
            print("it's raining but not very cold, wear a jacket")
        } else {
            print("It's raining, it's cold, let's wear a jacket, boots and use an umbrella")
        }
    case .cloudy(var temperature):
        if temperature > 25 {
            print("It's cloudy, but it's very hot, we can wear a shirt and jeans")
        }
        else {
            print ("It's cloudy and it might rain, let's wear a jacket")
        }
    case .snowy(var temperature):
        if temperature > 0 {
            print("Snow time, but not too cold, should melt soon, we need to wear warm clothing")
        }
        else {
            print ("It's FREEZING, please wear a coat, a scarf, waterproof boots, a hat and a pair of gloves")
            }
        }
    }
                  
whatToWear(weather: .snowy(-9))


//3
struct Book {
    var title: String
    var author: String
    var publicationYear: Int
}
var book1 = Book(title: "Pride and Prejudice", author: "Jane Austen", publicationYear: 1813)
var book2 = Book(title: "Frankenstein", author: "Mary Shelley", publicationYear: 1818)
var book3 = Book(title: "The Adventures of Tom Sawyer", author: "Mark Twain", publicationYear: 1876)
var book4 = Book(title: "Ivanhoe", author: "Walter Scott", publicationYear: 1819)
var book5 = Book(title: "The Three Musketeers", author: "Alexander Dumas", publicationYear: 1844)

var books: [Book] = [book1, book2, book3, book4, book5]

func bookSorter (array: [Book], year: Int) -> [Book] {
    var newerBooks: [Book] = []
    for i in array{
        if i.publicationYear > year {
            newerBooks.append(i)
        }
        else {
            continue
        }
    }
    return newerBooks
}

var newerBooks = bookSorter(array: books, year: 1840)

for book in newerBooks {
    print (book)
}



//4
struct BankAccount {
    var holderName: String
    var accountNumber: String
    var balance: Double
    
    mutating func depositAmount(amount: Double) {
        balance += amount
        print ((amount), " has been added to your balance.")
    }
    mutating func withdrawAmount(amount: Double) {
        if balance - amount > 0 {
            balance -= amount
            print((amount), " has been withdrawn")
        }
        else {
            print("Unfortunately you don't have balance available for the requested withdrawal")
        }
    }
}

var myAccount = BankAccount(holderName: "Nikoloz", accountNumber: "GE13134BDDP99", balance: 1243.50)

myAccount.depositAmount(amount: 78.70)

myAccount.withdrawAmount(amount: 1600)

myAccount.withdrawAmount(amount: 950.50)


//5

enum Genre:String {
    case hiphop = "HipHop"
    case pop = "Pop"
    case rock = "Rock"
    case country = "Country"
    case jazz = "Jazz"
}



struct Song {
    var title: String
    var artist: String
    var duration: Double
    var genre: Genre
    lazy var publisher: String = ""
        
    var description: String {
        return "\(title) was created by \(artist)"
    }
}

var song1 = Song(title: "Stay High", artist: "Juice WRLD", duration: 2.41, genre: .hiphop, publisher: "" )
var song2 = Song(title: "Fly me to the Moon", artist: "Frank Sinatra", duration: 2.37, genre: .jazz, publisher: "JazzRecords")
var song3 = Song(title: "Party in the USA", artist: "Miley Cyrus", duration: 3.22, genre: .pop, publisher: "")
var song4 = Song(title: "Heaven on their minds", artist: "Carl Anderson", duration: 4.20, genre: .rock, publisher: "Motion Picture")
var song5 = Song(title: "Country Roads", artist: "John Denver", duration: 3.10, genre: .country, publisher: "")

var songs: [Song] = [song1, song2, song3, song4, song5]


func filterByGenre (playlist: [Song], genre: Genre) -> [Song] {
    var filteredSongs: [Song] = []
    for i in playlist {
        if i.genre == genre {
            filteredSongs.append(i)
        }
    }
    return filteredSongs
}

var filteredSongs = filterByGenre(playlist: songs, genre: .jazz)

for i in filteredSongs {
    print (i.description)
}
