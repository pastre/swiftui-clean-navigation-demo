import SwiftUI

extension View {
    func sheet<Content>(
        _ coordinator: RouteService,
        route: RouteProtocol,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View where Content : View {
        sheet(isPresented: coordinator.isActive(route),
                   onDismiss: onDismiss,
                   content: content)
    }
}
