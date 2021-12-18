import SwiftUI

enum Tabs: Int, CaseIterable, TabRepresentable {
    case one
    case two
    case three
    
    var view: some View {
        Group {
            switch self {
            case .one:
                MyFeatureView()
            case .two:
                TabRouteView()
            case .three:
                Text("Other view")
            }
        }
    }
    
    var name: String {
        switch self {
        case .one:
            return "one"
        case .two:
            return "two"
        case .three:
            return "three"
        }
    }
    
    var id: Int { rawValue }
}
