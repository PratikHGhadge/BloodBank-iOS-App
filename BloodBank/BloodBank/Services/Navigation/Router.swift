//
//  Router.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 17/08/25.
//

import Foundation
import SwiftUI

enum AppRoute: Hashable {
    case launch
    case login
    case register
    case donorDashboard
    case hospitalDashboard
    case organisationDashboard
    case adminDashboard
}

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func reset(to route: AppRoute) {
        path = NavigationPath()
        path.append(route)
    }
}
