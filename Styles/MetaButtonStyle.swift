import SwiftUI

struct MetaButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    let isDisabled: Bool
    let cornerRadius: CGFloat
    let lineWidth: CGFloat
    
    init(backgroundColor: Color = .white, foregroundColor: Color = .black,
         isDisabled: Bool = false, cornerRadius: CGFloat = 30, lineWidth: CGFloat = 0.5) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.isDisabled = isDisabled
        self.cornerRadius = cornerRadius
        self.lineWidth = lineWidth
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let bgColor = isDisabled || configuration.isPressed ? backgroundColor.opacity(0.3) : backgroundColor
        let fgColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.3) : foregroundColor
        return configuration.label
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .foregroundStyle(.black)
            .background(bgColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(fgColor, lineWidth: 1)
            )
    }
}

#Preview {
    VStack {
        Button("Hello world!") { }
        .buttonStyle(MetaButtonStyle())
    }
}
