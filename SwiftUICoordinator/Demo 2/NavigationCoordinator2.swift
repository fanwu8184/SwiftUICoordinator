//
//  NavigationCoordinator2.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 6/9/2024.
//

import Foundation
import SwiftUI

enum Presentation: Identifiable {
  case stack(Stack)
  case sheet(Sheet)
  case fullScreen(FullScreen)
  
  var id: String {
    switch self {
    case .stack(let stack):
      return "stack_\(stack.rawValue)"
    case .sheet(let sheet):
      return "sheet_\(sheet.rawValue)"
    case .fullScreen(let fullScreen):
      return "fullScreen_\(fullScreen.rawValue)"
    }
  }
  
  var sheetItem: Sheet? {
    if case .sheet(let sheet) = self {
      return sheet
    }
    return nil
  }
  
  var fullScreenItem: FullScreen? {
    if case .fullScreen(let fullScreen) = self {
      return fullScreen
    }
    return nil
  }
  
  var stackItem: Stack? {
    if case .stack(let stack) = self {
      return stack
    }
    return nil
  }
}

struct PresentationModifier<PresentationContent: View>: ViewModifier {
  @Binding var presentation: Presentation?
  let presentationContent: (Presentation) -> PresentationContent
  
  func body(content: Content) -> some View {
    content
      .sheet(item: sheetBinding) { item in
        presentationContent(.sheet(item))
      }
      .fullScreenCover(item: fullScreenBinding) { item in
        presentationContent(.fullScreen(item))
      }
      .navigationDestination(for: Stack.self) { item in
        presentationContent(.stack(item))
      }
  }
  
  private var sheetBinding: Binding<Sheet?> {
    .init(
      get: { presentation?.sheetItem },
      set: { newValue in
        if let newValue = newValue {
          presentation = .sheet(newValue)
        } else {
          presentation = nil
        }
      }
    )
  }
  
  private var fullScreenBinding: Binding<FullScreen?> {
    .init(
      get: { presentation?.fullScreenItem },
      set: { newValue in
        if let newValue = newValue {
          presentation = .fullScreen(newValue)
        } else {
          presentation = nil
        }
      }
    )
  }
}

extension View {
  func presentation<PresentationContent: View>(
    _ presentation: Binding<Presentation?>,
    @ViewBuilder content: @escaping (Presentation) -> PresentationContent
  ) -> some View {
    self.modifier(PresentationModifier(
      presentation: presentation,
      presentationContent: content
    ))
  }
}

class NavigationCoordinator2: ObservableObject {
  @Published var path = NavigationPath()
  @Published var presentation: Presentation?
  
  func present(_ presentation: Presentation) {
    switch presentation {
    case .stack(let stack):
      path.append(stack)
    case .sheet, .fullScreen:
      self.presentation = presentation
    }
  }
  
  func pop() {
    path.removeLast()
  }
  
  func popToRoot() {
    path.removeLast(path.count)
  }
  
  func dismiss() {
    presentation = nil
  }
  
  @ViewBuilder
  func create(presentation: Presentation) -> some View {
    switch presentation {
    case .stack(let stack):
      create(stack: stack)
    case .sheet(let sheet):
      create(sheet: sheet)
    case .fullScreen(let fullScreen):
      create(fullScreen: fullScreen)
    }
  }
  
  @ViewBuilder
  private func create(stack: Stack) -> some View {
    switch stack {
    case .stackA:
      StackA2()
    case .stackB:
      StackB2()
    case .stackC:
      StackC2()
    }
  }
  
  @ViewBuilder
  private func create(sheet: Sheet) -> some View {
    NavigationStack {
      switch sheet {
      case .sheetA:
        SheetA2()
      case .sheetB:
        SheetB2()
      }
    }
  }
  
  @ViewBuilder
  private func create(fullScreen: FullScreen) -> some View {
    NavigationStack {
      switch fullScreen {
      case .fullScreenA:
        FullScreenA2()
      case .fullScreenB:
        FullScreenB2()
      }
    }
  }
}
