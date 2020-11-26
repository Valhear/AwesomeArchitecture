import SwiftUI

struct ContentView: View {
    @State private var word: String = ""
    @State private var isPalindrome: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Insert your word!")
            TextField("Insert word", text: $word)
            Button("Validate", action: {
                print("Action was tapped")
            })
            Button("Favorites", action: {
                print("Favorites Tapped")
            })
            Button("History", action: {
                print("History Tapped")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
