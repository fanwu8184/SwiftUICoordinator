import SwiftUI

struct StackB5: View {
    @EnvironmentObject private var navigationCoordinator: NavigationCoordinator5
    
    var body: some View {
        VStack {
            Button("Push To stack C") {
                navigationCoordinator.present(style: .stack) {
                    StackC5()
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
            
            Button("pop") {
                navigationCoordinator.pop()
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Stack B5")
    }
}

#Preview {
    StackB5()
}
