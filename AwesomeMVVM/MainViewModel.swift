import Foundation

class MainViewModel: ObservableObject {
    
    private var favourites: [Word] = []
    private var history: [Word] = []
    private var dataProvider: DataProvider.Type
    
    @Published var validatedWord: Word?
    
    init(dataProvider: DataProvider.Type) {
        self.dataProvider = dataProvider
    }
    
    // Binding?
    
    //Navigation
    
    //Formatting
    
    // MARK: Networking
    
    func validate(word: String) {
        // Result comes from background thread
        dataProvider.validate(
            word: word, completion: { result in
                switch result {
                    case .success(let word):
                        self.validatedWord = word
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

protocol DataProviderProtocol {
    /// "For testing"
}

class DataProvider: DataProviderProtocol {
    static func validate(word: String, completion: @escaping (Swift.Result<Word, PError>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            // TODO: Implement random success/failure
            // Parser -> implement?
            print("we are validating \(word)")
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
