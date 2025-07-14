import SwiftUI

struct BrownButton: View {
    var title: String
    var subtitle: String
    var iconName: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)

                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
            }

            Spacer()

            Image(systemName: iconName)
                .foregroundColor(.black)
                .font(.title2)
        }
        .padding()
        .background(Color(hex: "#B19458"))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
        .padding(.horizontal)
    }
}
