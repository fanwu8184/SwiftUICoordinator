//
//  Testing.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 13/9/2024.
//

import Foundation
import SwiftUI

enum Presentation3<V: View>: Identifiable, Hashable {
  case stack(V)
  case sheet(V)
  case fullScreen(V)
  
  var id: String {
    switch self {
    case .stack:
      return "stack"
    case .sheet:
      return "sheet"
    case .fullScreen:
      return "fullScreen"
    }
  }
  
  var view: V {
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
  static func == (lhs: Presentation3, rhs: Presentation3) -> Bool {
    lhs.id == rhs.id
  }
}

struct PresentationModifier3<V: View>: ViewModifier {
  @Binding var presentation: Presentation3<V>?
  
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
  
  private var sheetBinding: Binding<Presentation3<V>?> {
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
  
  private var fullScreenBinding: Binding<Presentation3<V>?> {
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
  func presentation3<V: View>(_ presentation: Binding<Presentation3<V>?>) -> some View {
    self.modifier(PresentationModifier3(presentation: presentation))
  }
}

class NavigationCoordinator5<V: View>: ObservableObject {
  @Published var path = NavigationPath()
  @Published var presentation: Presentation3<V>?
  
  func present(_ presentation: Presentation3<V>) {
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

let navigationCoordinator5 = NavigationCoordinator5<Text>()
