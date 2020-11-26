import Foundation

class MainViewModel {
    //Navigation
    
    //Formatting
    
    // MARK: Networking
    
    func validate(word: String) {
        DataProvider.validate(word: word, completion: { _ in } )
    }
    
    // Persistence
}

class DataProvider {
    static func validate(word: String, completion: @escaping (Swift.Result<Palindrome, Error>) -> Void) {
        
    }
}
