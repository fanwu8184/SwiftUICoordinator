//
//  NavigationCoordinator3.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 12/9/2024.
//

import Foundation
import SwiftUI

enum Presentation2: Identifiable, Hashable {
  case stack(AnyView)
  case sheet(AnyView)
  case fullScreen(AnyView)
  
  var id: String {
    switch self {
    case .stack:
      return "stack"
    case .sheet:
      return "sheet_\(UUID().uuidString)"
    case .fullScreen:
      return "fullScreen_\(UUID().uuidString)"
    }
  }
  
  var view: AnyView {
    switch self {
    case .stack(let view), .sheet(let view), .fullScreen(let view):
      return view
    }
  }
  
  // Hashable conformance
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  // Equatable conformance
  static func == (lhs: Presentation2, rhs: Presentation2) -> Bool {
    lhs.id == rhs.id
  }
}

struct PresentationModifier2: ViewModifier {
  @Binding var presentation: Presentation2?
  
  func body(content: Content) -> some View {
    content
      .sheet(item: sheetBinding) { presentation in
        presentation.view
      }
      .fullScreenCover(item: fullScreenBinding) { presentation in
        presentation.view
      }
      .navigationDestination(for: Presentation2.self) { presentation in
        presentation.view
      }
  }
  
  private var sheetBinding: Binding<Presentation2?> {
    .init(
      get: {
        if case .sheet? = presentation {
          return presentation
        }
        return nil
      },
      set: { _ in presentation = nil }
    )
  }
  
  private var fullScreenBinding: Binding<Presentation2?> {
    .init(
      get: {
        if case .fullScreen? = presentation {
          return presentation
        }
        return nil
      },
      set: { _ in presentation = nil }
    )
  }
}

extension View {
  func presentation2(_ presentation: Binding<Presentation2?>) -> some View {
    self.modifier(PresentationModifier2(presentation: presentation))
  }
}

class NavigationCoordinator3: ObservableObject {
  @Published var path = NavigationPath()
  @Published var presentation: Presentation2?
  
  func present(_ presentation: Presentation2) {
    switch presentation {
    case .stack:
      path.append(presentation)
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
}
