import SwiftUI

struct ResultsScreen: View {
    @Environment(\.dismiss) var dismiss
    var result: String
    var onReturnHome: () -> Void

    var body: some View {
        let diagnosis = DiagnosisLibrary[result] ?? DiagnosisLibrary["Unknown"]!

        ZStack {
            // Background gradient
            LinearGradient(
                colors: [Color(hex: "#A1D561"), Color(hex: "#E6F4D5")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 24) {
                // Title
                Text("Results")
                    .font(AppFonts.navTitle)
                    .padding(.top, 60)
                    .padding(.horizontal)

                // Diagnosis Card
                HStack {
                    DiagnoseCard(
                        classification: diagnosis.healthStatus,
                        subtitle: diagnosis.captionText,
                        color: Color(AppColors.primaryGreen)
                    )
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)

                // Disease Description
                HStack {
                    ResultCard(
                        classification: diagnosis.disease,
                        subtitle: diagnosis.description,
                        color: AppColors.secondaryGreen
                    )
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)

                // Advice
                HStack {
                    ResultCard(
                        classification: "Advice",
                        subtitle: diagnosis.advice,
                        color: AppColors.secondaryYellow
                    )
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)

                // Try Again Title
                Text("Try Again?")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "#A67044"))
                    .padding(.horizontal)
                    .padding(.top, 16)

                // Buttons
                VStack(spacing: 16) {
                    BrownButton(
                        title: "Take Picture",
                        subtitle: "of your plant",
                        iconName: "camera.fill"
                    )
                    BrownButton(
                        title: "Import",
                        subtitle: "from your gallery",
                        iconName: "arrow.clockwise.circle.fill"
                    )
                    Button("Return Home") {
                        onReturnHome()
                    }
                    .font(AppFonts.heading)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width * 0.60)
                    .padding()
                    .background(AppColors.secondaryGreen)
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                }
                .padding(.horizontal)
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, minHeight: 140)
        }
    }
}


#Preview {
    ResultsScreen(
        result: "Tomato_Late_blight",
        onReturnHome: {
            print("Returned to Home")
        }
    )
}
