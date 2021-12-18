import SwiftUI

struct MyFeatureView: View {

    @EnvironmentObject
    private var appCoordinator: RouteService
    
    var body: some View {
        NavigationView {
            VStack  {
                NavigationLink(
                    appCoordinator,
                    route: NavigationState.MyFeatureRouting.myRoute,
                    destination: {
                        Button {
                            appCoordinator.route(to: NavigationState.MyFeatureRouting.sheetRoute)
                        } label: {
                            Text("Display sheet")
                        }
                    },
                    label: { Text("Display link") }
                )
            }
            .sheet(
                appCoordinator,
                route: NavigationState.MyFeatureRouting.sheetRoute,
                onDismiss: nil) {
                    Button {
                        appCoordinator.deactivate(route: NavigationState.MyFeatureRouting.myRoute)
                    } label: {
                        Text("Dismiss everything")
                    }
                }
        }
    }
}
