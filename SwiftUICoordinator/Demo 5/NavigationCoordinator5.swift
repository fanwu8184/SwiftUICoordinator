import Foundation
import SwiftUI

// it is Identifiable due to sheet item
// it is Hashable due to NavigationStack's navigationDestination
struct PresentationItem: Identifiable, Hashable {
    let id: AnyHashable
    let view: AnyView
    let style: PresentationStyle
    
    static func == (lhs: PresentationItem, rhs: PresentationItem) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

enum PresentationStyle {
    case stack
    case sheet(detents: Set<PresentationDetent> = [.large])
    case fullScreen
}

extension PresentationStyle {
    var isSheet: Bool {
        if case .sheet = self {
            return true
        }
        return false
    }
    
    var isFullScreen: Bool {
        if case .fullScreen = self {
            return true
        }
        return false
    }
    
    var detents: Set<PresentationDetent>? {
        if case .sheet(let detents) = self {
            return detents
        }
        return nil
    }
}

extension PresentationStyle: Equatable {
    // Explicit Equatable conformance
    static func == (lhs: PresentationStyle, rhs: PresentationStyle) -> Bool {
        switch (lhs, rhs) {
        case (.stack, .stack):
            return true
        case (.sheet(let lhsDetents), .sheet(let rhsDetents)):
            return lhsDetents == rhsDetents
        case (.fullScreen, .fullScreen):
            return true
        default:
            return false
        }
    }
}

class NavigationCoordinator5: ObservableObject {
    @Published var path: [PresentationItem] = []
    @Published var presentedItem: PresentationItem?
    
    // using <T: NavigationDestination> to fix any NavigationDestination issue in PresentationItem
    func present(style: PresentationStyle, view: () -> some View) {
        let item = PresentationItem(id: UUID(), view: AnyView(view().environmentObject(self)), style: style)
        switch style {
        case .stack:
            path.append(item)
        case .sheet, .fullScreen:
            presentedItem = item
        }
    }
    
    func dismiss() {
        presentedItem = nil
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeAll()
    }
}
