import SwiftUI

struct PresentationModifier5: ViewModifier {
    @ObservedObject var coordinator: NavigationCoordinator5
    
    func body(content: Content) -> some View {
        content
            .sheet(item: Binding(
                get: { coordinator.presentedItem?.style.isSheet == true ? coordinator.presentedItem : nil },
                set: { coordinator.presentedItem = $0 }
            )) { item in
                item.view
                    .presentationDetents(item.style.detents ?? [.large])
            }
            .fullScreenCover(item: Binding(
                get: { coordinator.presentedItem?.style.isFullScreen == true ? coordinator.presentedItem : nil },
                set: { coordinator.presentedItem = $0 }
            )) { item in
                item.view
            }
            .navigationDestination(for: PresentationItem.self) { item in
                item.view
            }
    }
}

extension View {
    func navigation(coordinator: NavigationCoordinator5) -> some View {
        modifier(PresentationModifier5(coordinator: coordinator))
    }
}
