import SwiftUI

struct StackA5: View {
    @EnvironmentObject private var navigationCoordinator: NavigationCoordinator5
    
    var body: some View {
      VStack {
        Button("Push To stack B") {
            navigationCoordinator.present(style: .stack) {
                StackB5()
            }
        }
        .buttonStyle(.borderedProminent)
        
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
      }
      .navigationTitle("Stack A5")
    }
}

#Preview {
    StackA5()
}
