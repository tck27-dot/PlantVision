import SwiftUI

@main
struct PlantCoachApp: App {
    init() {
           let appearance = UINavigationBarAppearance()
           appearance.titleTextAttributes = [.foregroundColor: UIColor.brown]
           appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.brown]
           appearance.backgroundColor = UIColor(red: 0.8, green: 1.0, blue: 0.8, alpha: 0.5)  // Light green, 50% opacity

           UINavigationBar.appearance().standardAppearance = appearance
           UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().isTranslucent = true
       }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
