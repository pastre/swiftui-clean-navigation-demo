import SwiftUI

extension NavigationLink {
    init(_ coordinator: RouteService, route: RouteProtocol, @ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label) {
        self.init(
            isActive: coordinator.isActive(route),
            destination: destination,
            label: label)
    }
}
