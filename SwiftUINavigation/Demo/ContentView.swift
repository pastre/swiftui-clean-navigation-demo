//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Bruno Pastre on 17/12/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject
    private var appCoordinator: RouteService
    
    var body: some View {
        appCoordinator.tabs(Tabs.allCases)
    }
}
