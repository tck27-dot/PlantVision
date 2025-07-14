import SwiftUI

struct HomeButton: View {
    var color: Color
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button {
            
        } label: {
            Text("Return Home")
                .font(AppFonts.heading)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width * 0.60)
                .padding()
                .background(color)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
        }
        .padding(.horizontal)
    }
}
