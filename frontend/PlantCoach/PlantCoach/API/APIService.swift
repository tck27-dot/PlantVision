import Foundation
import UIKit

struct APIService {
    static func classifyPlantImage(imageData: Data, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "\(Config.baseURL)/inference/") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue(Config.apiKey, forHTTPHeaderField: "AICoach-API-Key")

        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"plant.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        URLSession.shared.uploadTask(with: request, from: body) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let classification = json["classification"] as? String else {
                completion(.failure(NSError(domain: "Invalid response", code: 0)))
                return
            }
            completion(.success(classification))
        }.resume()
    }
}
