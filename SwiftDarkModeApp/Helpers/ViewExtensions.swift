import SwiftUI

/// Custom View Extensions
extension View {
    @ViewBuilder
    func rect(value: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay(
                GeometryReader(content: { geometry in
                    let rect = geometry.frame(in: .global)

                    Color.clear
                        .preference(key: RectKey.self, value: rect)
                        .onPreferenceChange(RectKey.self, perform: { rect in
                            value(rect)
                        })
                })
            )
    }
}


struct RectKey: PreferenceKey {
    static var defaultValue: CGRect = .zero

    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
