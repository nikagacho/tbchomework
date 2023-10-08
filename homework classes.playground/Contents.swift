class Book {
    var bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool = false
    
    init(bookID: Int, title: String, author: String) {
        self.bookID = bookID
        self.title = title
        self.author = author
    }
    
    func borrowed() {
        isBorrowed = true
    }
    
    func returned() {
        isBorrowed = false
    }
}

class Owner {
    var ownerID: Int
    var name: String
    var borrowedBooks: [Book] = []
    
    init(ownerID: Int, name: String) {
        self.ownerID = ownerID
        self.name = name
    }
    
    func borrowBook(book: Book, library: Library) {
        if library.isOwnerAllowed(book: book) == true {
            if let index = library.books.firstIndex(where: { $0.bookID == book.bookID }) {
                borrowedBooks.append(book)
                book.borrowed()
                library.books.remove(at: index)
            } else {
                print((book.title), " is not available in the library")
            }
        }
    }
    
    func returnBook(book: Book, library: Library) {
        if let index = borrowedBooks.firstIndex(where: { $0.bookID == book.bookID }) {
            borrowedBooks.remove(at: index)
            book.returned()
            library.books.append(book)
        } else {
            print("ERROR ",(book.title), " is not borrowed by ", (name))
        }
    }
}


class Library {
    var books: [Book] = []
    var owners: [Owner] = []
    
    init() {}
    func addBook(book: Book){
        books.append(book)
    }
    
    func addOwner(owner: Owner){
        owners.append(owner)
    }
    
    func availableBooks() -> [Book] {
        var temp: [Book] = []
        for i in books {
            temp.append(i)
        }
        return temp
    }
    
    func findBorrowedBooks() -> [Book] {
        var allBorrowedBooks: [Book] = []
        for owners in owners {
            allBorrowedBooks.append(contentsOf: owners.borrowedBooks)
        }
        return allBorrowedBooks
    }
    
    func findOwnerById (id: Int) {
        var found = false
        for owners in owners {
            if owners.ownerID == id {
                print((owners.ownerID), "is an ID of", (owners.name))
                found = true
                break
            }
        }
        if found == false {
            print("ERROR - THE ENTERED ID DOES NOT MATCH ANY OWNERS")
        }
    }
    
    
    
    func whatDidOwnerTake (owner: Owner){
        print("\n", owner.name, " currently has:")
        for i in owner.borrowedBooks {
            print(i.title, terminator: ";")
        }
    }
    
    func isOwnerAllowed (book: Book)-> Bool {
        if book.isBorrowed == false {
            return true
        } else {
            return false
        }
    }
}


var book1 = Book(bookID: 1, title: "The Right Hand of the Grandmaster", author: "Konstantine Gamsakhurdia")
var book2 = Book(bookID: 2, title: "The Knight in the Panther's Skin", author: "Shota Rustaveli")
var book3 = Book(bookID: 3, title: "The Book of Wisdom and Lies", author: "Sulkhan-Saba Orbeliani")
var book4 = Book(bookID: 4, title: "Davitiani", author: "David Guramishvili")
var book5 = Book(bookID: 5, title: "The Martyrdom of Saint Abo", author: "Ioane Sabanisdze")
var book6 = Book(bookID: 6, title: "Letters of a Traveller", author: "Ilia Chavchavadze")
var book7 = Book(bookID: 7, title: "The tale of the Roe", author: "Vaja Pshavela")
var book8 = Book(bookID: 8, title: "Ai iA", author: "Iakob Gogebashvili")

var lika = Owner(ownerID: 38, name: "Lika")
var michael = Owner(ownerID: 45, name: "Michael")
var nikoloz = Owner(ownerID: 91, name: "Nikoloz")
var mariam = Owner(ownerID: 24, name: "Mariam")

var myLibrary = Library()


myLibrary.addBook(book: book1)
myLibrary.addBook(book: book2)
myLibrary.addBook(book: book3)
myLibrary.addBook(book: book4)
myLibrary.addBook(book: book5)
myLibrary.addBook(book: book6)
myLibrary.addBook(book: book7)
myLibrary.addBook(book: book8)


myLibrary.addOwner(owner: lika)
myLibrary.addOwner(owner: michael)
myLibrary.addOwner(owner: nikoloz)
myLibrary.addOwner(owner: mariam)


michael.borrowBook(book: book3, library: myLibrary)
mariam.borrowBook(book: book8, library: myLibrary)
lika.borrowBook(book: book5, library: myLibrary)
mariam.borrowBook(book: book5, library: myLibrary) // ვერ ითხოვებს, ლიკამ ითხოვა უკვე
michael.borrowBook(book: book4, library: myLibrary)
michael.borrowBook(book: book6, library: myLibrary)
lika.returnBook(book: book3, library: myLibrary) //მაგალითისთვის, რომ რაც არ წაუღია ვერ დააბრუნებს
michael.returnBook(book: book6, library: myLibrary)

myLibrary.isOwnerAllowed(book: book6) //რადგან წიგნი დაბრუნდა, შესაძლებელია მისი გატანა
myLibrary.findOwnerById(id: 38)

var allBorrowed = myLibrary.findBorrowedBooks()
for i in allBorrowed {
    print (i.title, terminator: ", ")
}

print("\n")

var allAvailable = myLibrary.availableBooks()
for i in allAvailable {
    print (i.title, terminator: ", ")
}

print("\n")

myLibrary.whatDidOwnerTake(owner: michael) //რა წიგნები აქვს ამ ეტაპზე Owners



print("\n")


//2 E-Commerce

class Product {
    var productID: Int
    var name: String
    var price: Double
    init(productID: Int, name: String, price: Double) {
        self.productID = productID
        self.name = name
        self.price = price
    }
}


class Cart {
    var cartID: Int
    var items: [Product] = []
    init(cartID: Int) {
        self.cartID = cartID
    }
    
    func addProduct(product: Product) {
        items.append(product)
    }
    
    func removeProduct(productID: Int) {
        if let index = items.firstIndex(where: {$0.productID == productID}) {
            items.remove(at: index)
        }
    }
    
    func priceCounter() -> Double {
        var total: Double = 0
        for thing in items{
            total += thing.price
        }
        return total
    }
    
}


class User {
    var userID: Int
    var username: String
    var cart: Cart
    init(userID: Int, username: String, cart: Cart) {
        self.userID = userID
        self.username = username
        self.cart = cart
    }
    
    func addToCart(product: Product) {
        cart.addProduct(product: product)
    }
    
    func removeFromCart(productID: Int) {
        cart.removeProduct(productID: productID)
    }
    
    func checkOut()  {
        print ("Total Amount = ", cart.priceCounter(), "$. Thank you for your purchase")
        cart.items.removeAll()
    }
   
}

var playstation5 = Product(productID: 1, name: "PlayStation 5", price: 499.99)
var galaxys23 = Product(productID: 2, name: "Samsung Galaxy S23", price: 699.99)
var toaster = Product(productID: 3, name: "Toaster Ilitek 2 - 5203", price: 21.99)
var macbook = Product(productID: 4, name: "Macbook Air 2023 M2", price: 1099.99)
var cigarette = Product(productID: 5, name: "President Night Green", price: 3.99)
var cola = Product(productID: 6, name: "Coca-Cola", price: 0.49)
var vodka = Product(productID: 7, name: "Finlandia", price: 10.99)

var cart1 = Cart(cartID: 100)
var cart2 = Cart(cartID: 200)

var ivan = User(userID: 10, username: "Ivan1994Broke", cart: cart1)
var sean = User(userID: 20, username: "SeanTheRich", cart: cart2)


ivan.addToCart(product: cigarette)
ivan.addToCart(product: vodka)
ivan.addToCart(product: cola)
ivan.addToCart(product: toaster)

sean.addToCart(product: playstation5)
sean.addToCart(product: galaxys23)
sean.addToCart(product: macbook)


cart1.priceCounter()
cart2.priceCounter()

ivan.checkOut()

sean.checkOut()

print(ivan.cart.items)
print(sean.cart.items)
