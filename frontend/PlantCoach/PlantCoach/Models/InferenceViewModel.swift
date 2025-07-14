import SwiftUI

class InferenceViewModel: ObservableObject {
    @Published var classificationResult: String?
    @Published var isLoading = false
    @Published var errorMessage: String?

    func classify(image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            self.errorMessage = "Failed to convert image"
            return
        }

        isLoading = true
        APIService.classifyPlantImage(imageData: imageData) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let classification):
                    self?.classificationResult = classification
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
