import SwiftUI

struct DiagnoseCard: View {
    var classification: String
    var subtitle: String
    var color:Color

    var body: some View {
        VStack {
            HStack {
                Text("Your plant is")
                    .font(AppFonts.heading)
                    .foregroundColor(.white)

                Text(classification)
                    .font(AppFonts.heading)
                    .foregroundColor(.black)

            }
            Spacer()
            
            Text(subtitle)
                .font(AppFonts.body)
                .foregroundColor(.white)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
                
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.75)
        .padding()
        .background(color)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
        .padding(.horizontal)
        
    }
}
