import SwiftUI

@main
struct SwiftUINavigationApp: App {
    @StateObject
    private var navigationState: RouteService = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navigationState)
        }
    }
}
