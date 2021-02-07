import SwiftUI

struct ContentView: View {
    @State private var word: String = ""
    @State private var isPalindrome: Bool = false
    @ObservedObject private var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Insert your word!")
            TextField("Insert word", text: $word)
            Button("Validate", action: {
                validate()
                print("Action was tapped")
            })
            Button("Favorites", action: {
                print("Favorites Tapped")
            })
            Button("History", action: {
                print("History Tapped")
            })
            if viewModel.validatedWord != nil {
                validatedWordView()
            }
        }
    }
    
    func validatedWordView() -> some View {
        VStack(alignment: .center) {
            Text(viewModel.validatedWord?.text ?? "")
            Text("viewModel.validatedWord.isPalindrome")
        }
    }
    
    func validate() {
        viewModel.validate(word: word)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MainViewModel(dataProvider: DataProvider.self))
    }
}
