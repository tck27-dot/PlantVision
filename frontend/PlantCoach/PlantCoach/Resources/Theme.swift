import SwiftUI

// MARK: - Color Hex Extension
extension Color {
    static func fromHex(_ hex: String) -> Color {
          var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
          if hexSanitized.hasPrefix("#") {
              hexSanitized.removeFirst()
          }

          var rgb: UInt64 = 0
          Scanner(string: hexSanitized).scanHexInt64(&rgb)

          let r = Double((rgb >> 16) & 0xFF) / 255
          let g = Double((rgb >> 8) & 0xFF) / 255
          let b = Double(rgb & 0xFF) / 255

          return Color(red: r, green: g, blue: b)
      }
}



// MARK: - App Colors
enum AppColors {
    static let primaryGreen = Color(hex: "#ACDA73")
    static let secondaryGreen = Color(hex: "#C9E7A4")
    static let secondaryYellow = Color(hex: "#D1D688")
    static let accentBrown = Color(hex: "#B19458")
    static let backgroundMint = Color(hex: "#E0F8E0")
    static let warningRed = Color(hex: "#D20705")
    static let lightGreen = Color(hex: "#C8EDB4")
    static let cardGreen = Color(hex: "#A9E665")
}

// MARK: - App Fonts
enum AppFonts {
    static let heading = Font.system(.title2, design: .default).weight(.semibold)
    static let title = Font.system(.title, design: .default).weight(.bold)
    static let body = Font.system(.body, design: .default).weight(.semibold)
    static let caption = Font.system(.caption, design: .default)
    static let navTitle = Font.system(.largeTitle, design: .default).weight(.bold)
}

// MARK: - App Spacing
enum AppSpacing {
    static let horizontal: CGFloat = 24
    static let vertical: CGFloat = 20
    static let cardCornerRadius: CGFloat = 20
    static let buttonCornerRadius: CGFloat = 12
}

// MARK: - App Shadows
extension View {
    func cardShadow() -> some View {
        self.shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
    }

    func buttonShadow() -> some View {
        self.shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 4)
    }
}

// MARK: - Hex Color Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        if hex.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(after: scanner.string.startIndex)
        }
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xff) / 255
        let g = Double((rgb >> 8) & 0xff) / 255
        let b = Double(rgb & 0xff) / 255
        self.init(red: r, green: g, blue: b)
    }
}
