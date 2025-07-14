import SwiftUI

struct ResultCard: View {
    var classification: String
    var subtitle: String
    var color: Color

    var body: some View {
        VStack(spacing: 8) {
            Text(classification)
                .font(AppFonts.heading)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)

            Text(subtitle)
                .font(AppFonts.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding()
        .frame(
            width: UIScreen.main.bounds.width * 0.9
        )
        .background(color)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
    }
}
