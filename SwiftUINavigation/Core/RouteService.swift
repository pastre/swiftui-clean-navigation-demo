import SwiftUI

protocol RouteProtocol {
    var routeName: String { get }
}

struct AnyRoute: Codable, Equatable {
    let routeName: String
}

final class RouteService: ObservableObject {
    
    @Published
    var navigationState = NavigationState()
    
    @Published
    var activeRoutes: [RouteProtocol] = []
    
    /// Starts the app using tabs
    /// - Returns: A Tabview using said tabs
    public func tabs<T>(
        _ tabs: [T]
    ) -> some View where T: TabRepresentable {
        TabView(selection: .init(modifying: \.currentSelectedTab, coordinator: self)) {
            ForEach(tabs) { tab in
                tab.view
                    .tabItem {
                        Text(tab.name)
                    }
                    .tag(tab.id)
            }
        }
    }
    
    /// Activates given route
    /// - Parameter route: route to be activated. If it's already activated, it will ignore
    public func route(to route: RouteProtocol) {
        if activeRoutes.contains { $0.routeName == route.routeName } {
            return
        }
        activeRoutes.append(route)
    }
    
    
    /// Deactivates given route, despite where it is in the hierarchy
    /// - Parameter route: route to be deactivated
    public func deactivate(route: RouteProtocol) {
        guard let routeIndex = activeRoutes
                .firstIndex(where: { $0.routeName == route.routeName }),
              let lastIndex = activeRoutes.indices.last
        else { return }
        activeRoutes.removeSubrange(routeIndex...lastIndex)
    }
    
    /// Dismisses latest route in the stack, be it a sheet or not
    public func dismiss() {
        let _ = activeRoutes.popLast()
    }
    
    func isActive(_ route: RouteProtocol) -> Binding<Bool> {
        .init {
            self.activeRoutes
                .contains(where: {
                    $0.routeName == route.routeName
                })
        } set: { isOn in
            if isOn {
                self.route(to: route)
            } else {
                self.activeRoutes.removeAll {
                    $0.routeName == route.routeName
                }
            }
        }
    }
}
