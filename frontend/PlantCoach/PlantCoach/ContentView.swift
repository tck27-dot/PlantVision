import SwiftUI

enum AppScreen {
    case home
    case result(String)
}

struct ContentView: View {
    @State private var currentScreen: AppScreen = .home

    var body: some View {
        switch currentScreen {
        case .home:
            HomeScreen(onResult: { result in
                currentScreen = .result(result)
            })

        case .result(let result):
            ResultsScreen(result: result, onReturnHome: {
                currentScreen = .home
            })
        }
    }
}
