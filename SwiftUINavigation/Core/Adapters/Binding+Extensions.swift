import SwiftUI

extension Binding {
    init(modifying keyPath: WritableKeyPath<NavigationState, Value>, coordinator: RouteService) {
        self.init(
            get: { coordinator.navigationState[keyPath: keyPath] },
            set: { value, transaction in
                coordinator.navigationState[keyPath: keyPath] = value
            })
    }
}
