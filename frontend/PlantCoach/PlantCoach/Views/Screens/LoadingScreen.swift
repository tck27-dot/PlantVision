import SwiftUI
import Lottie

struct LoadingScreen: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer? = nil

    var body: some View {
        ZStack {
            // Match HomeScreen background
            LinearGradient(
                colors: [Color(hex: "#A1D561"), Color(hex: "#E6F4D5")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                // Animated Lottie Bee (if used)
                LottieView(animation: .named("Bee"))
                    .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                    .frame(height: 200)

                // Title Text
                Text("Analyzing your plant...")
                    .font(.title2)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("brown"))

                // Progress Bar
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle(tint: .white))
                    .frame(width: 250)
                    .scaleEffect(x: 1, y: 3, anchor: .center)
                    .animation(.easeInOut(duration: 0.2), value: progress)

                // Percentage Text
                Text("\(Int(progress * 100))%")
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .background(Color("brown"))
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .cornerRadius(8)
            }
        }
        .onAppear {
            startFakeLoading()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

    private func startFakeLoading() {
        progress = 0.0
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            if progress < 1.0 {
                progress += 0.01
            } else {
                timer?.invalidate()
            }
        }
    }
}
