import SwiftUI

struct TabRouteView: View {
    @EnvironmentObject
    private var coordinator: RouteService
    
    var body: some View {
        Button {
            coordinator.route(toTab: Tabs.three)
        } label: {
            Text("Third tab")
        }
    }
}
