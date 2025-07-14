import SwiftUI
import PhotosUI

struct HomeScreen: View {
    var onResult: (String) -> Void

    @State private var selectedItem: PhotosPickerItem? = nil
    @StateObject private var viewModel = InferenceViewModel()
    @State private var selectedImage: UIImage? = nil
    @State private var isLoading = false

    var body: some View {
        ZStack {
            if isLoading {
                LoadingScreen()
            } else {
                selectingView
            }
        }
    }

    var selectingView: some View {
        ZStack {
            LinearGradient(
                colors: [Color(hex: "#A1D561"), Color(hex: "#E6F4D5")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 30) {
                Text("PlantVision")
                    .font(AppFonts.navTitle)
                    .padding(.top, 60)
                    .padding(.horizontal)

                HStack {
                    VStack(alignment: .leading) {
                        Text("Tomato Health")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)

                        Text("Classifier")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                    }

                    Spacer()

                    Image("tomato")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
                .padding()
                .background(Color(hex: "#A1D561"))
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                .padding(.horizontal)

                Text("Get Started")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "#8D6E63"))
                    .padding(.horizontal)

                BrownButton(
                    title: "Take Picture",
                    subtitle: "of your plant",
                    iconName: "camera.fill"
                )

                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    BrownButton(
                        title: "Import",
                        subtitle: "from your gallery",
                        iconName: "photo.on.rectangle.angled"
                    )
                }

                Spacer()
            }
            .onChange(of: selectedItem) { _, newItem in
                guard let newItem else { return }

                isLoading = true

                Task {
                    if let data = try? await newItem.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        selectedImage = uiImage
                        await MainActor.run {
                            viewModel.classify(image: uiImage)
                        }

                        try? await Task.sleep(nanoseconds: 400_000_000)

                        let result = viewModel.classificationResult ?? "Unknown"
                        onResult(result)
                    } else {
                        isLoading = false
                    }
                }
            }
        }
    }
}
