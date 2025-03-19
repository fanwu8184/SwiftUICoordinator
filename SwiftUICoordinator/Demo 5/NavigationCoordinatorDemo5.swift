// the scalable navigation coordinator

import SwiftUI

struct NavigationCoordinatorDemo5: View {
    @StateObject private var navigationCoordinator = NavigationCoordinator5()
    
    var body: some View {
        VStack {
            NavigationStack(path: $navigationCoordinator.path) {
                StackA5()
                    .navigation(coordinator: navigationCoordinator)
            }
            .environmentObject(navigationCoordinator)
            
            Text("path count: \(navigationCoordinator.path.count)")
        }
    }
}

#Preview {
    NavigationCoordinatorDemo5()
}
