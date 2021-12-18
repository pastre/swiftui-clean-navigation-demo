extension NavigationState {
    enum MyFeatureRouting {
        struct MyRoute: RouteProtocol {
            var routeName: String { "myRoute" }
        }
        
        struct MySheetRoute: RouteProtocol {
            var routeName: String { "otherRoute" }
        }
        
        static let myRoute = MyRoute()
        static let sheetRoute = MySheetRoute()
    }
}
