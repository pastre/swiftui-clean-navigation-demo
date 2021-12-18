import SwiftUI

protocol TabRepresentable: Identifiable where ID == Int {
    associatedtype V: View
    var view: V { get }
    var name: String { get }
    var id: Int { get }
}

extension RouteService {
    func route<T>(toTab tab: T) where T: TabRepresentable {
        navigationState.currentSelectedTab = tab.id
    }
}
