import Foundation

class MainViewModel {
    
    private var favourites: [Word] = []
    private var history: [Word] = []
    
    // Binding?
    
    //Navigation
    
    //Formatting
    
    // MARK: Networking
    
    func validate(word: String) {
        // Result comes from background thread
        DataProvider.validate(
            word: word, completion: { result in
                switch result {
                    case .success(let word):
                        self.history.append(word)
                    case .failure(let error):
                        // Check later?
                        print(error)
                }
            }
        )
    }
    
    // Persistence
}

class DataProvider {
    static func validate(word: String, completion: @escaping (Swift.Result<Word, PError>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            // TODO: Implement random success/failure
            // Parser -> implement?
            completion(.success(
                Word.fakes.randomElement()!
            ))
        }
    }
    
    enum PError: Error {
        case customError
    }
}


extension Word {
    static let fakes = [
        Word(text: "Ana", dateAdded: Date(), isFavorite: true, isPalindrome: true),
        Word(text: "Daniel", dateAdded: Date(), isFavorite: false, isPalindrome: false),
        Word(text: "Valentina", dateAdded: Date(), isFavorite: false, isPalindrome: false),
        Word(text: "Mat", dateAdded: Date(), isFavorite: true, isPalindrome: true),
        Word(text: "Robert", dateAdded: Date(), isFavorite: false, isPalindrome: true),
        Word(text: "Emre", dateAdded: Date(), isFavorite: true, isPalindrome: true),
        Word(text: "Francesco", dateAdded: Date(), isFavorite: true, isPalindrome: true),
        Word(text: "Markus", dateAdded: Date(), isFavorite: false, isPalindrome: true),
        Word(text: "DanielZ", dateAdded: Date(), isFavorite: false, isPalindrome: false),
        Word(text: "Arno", dateAdded: Date(), isFavorite: false, isPalindrome: true),
    ]
}
