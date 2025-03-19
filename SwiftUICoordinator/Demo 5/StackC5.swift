import SwiftUI

struct StackC5: View {
    @EnvironmentObject private var navigationCoordinator: NavigationCoordinator5
    
    var body: some View {
      VStack {
        Button("Present sheet A") {
            navigationCoordinator.present(style: .sheet()) {
                SheetA5()
            }
        }
        .buttonStyle(.borderedProminent)
        
        Button("Present fullscreen A") {
            navigationCoordinator.present(style: .fullScreen) {
                FullScreenA5()
            }
        }
        .buttonStyle(.borderedProminent)
        
        Button("pop to root") {
          navigationCoordinator.popToRoot()
        }
        .buttonStyle(.borderedProminent)
      }
      .navigationTitle("Stack C5")
    }
}

#Preview {
    StackC5()
}
