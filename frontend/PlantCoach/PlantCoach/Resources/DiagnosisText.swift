struct DiagnosisInfo {
    let healthStatus: String
    let disease: String
    let description: String
    let advice: String
    let captionText: String
}

let DiagnosisLibrary: [String: DiagnosisInfo] = [
    "Pepper__bell___Bacterial_spot": DiagnosisInfo(
        healthStatus: "not healthy.",
        disease: "Bacterial Spot",
        description: "A bacterial disease causing small, water-soaked spots that turn dark brown.",
        advice: "Remove affected leaves and avoid overhead watering. Apply copper-based sprays.",
        captionText: "Your plant may have a bacterial spot."
    ),
    "Pepper__bell___healthy": DiagnosisInfo(
        healthStatus: "healthy!",
        disease: "None",
        description: "Your pepper plant looks great!",
        advice: "Maintain consistent watering and monitor for any changes.",
        captionText: "Your plant appears to be healthy and thriving."
    ),
    "Potato___Late_blight": DiagnosisInfo(
        healthStatus: "not healthy.",
        disease: "Late Blight",
        description: "A serious disease that causes dark lesions on leaves and stems, leading to plant collapse.",
        advice: "Remove infected plants. Use resistant varieties and fungicide treatments.",
        captionText: "Your plant may be affected by late blight."
    ),
    "Potato___healthy": DiagnosisInfo(
        healthStatus: "healthy!",
        disease: "None",
        description: "Your potato plant is healthy and thriving.",
        advice: "Keep an eye out for pests and provide proper soil drainage.",
        captionText: "Your potato plant looks healthy."
    ),
    "Tomato_Bacterial_spot": DiagnosisInfo(
        healthStatus: "not healthy.",
        disease: "Bacterial Spot",
        description: "Causes small dark spots on leaves and fruits, leading to defoliation.",
        advice: "Remove infected parts, rotate crops, and use copper sprays.",
        captionText: "Your plant may have a bacterial spot."
    ),
    "Tomato_Early_blight": DiagnosisInfo(
        healthStatus: "not healthy.",
        disease: "Early Blight",
        description: "A fungal disease causing brown spots with concentric rings and yellowing leaves.",
        advice: "Prune lower leaves, stake the plant for air circulation, and use fungicides preventatively.",
        captionText: "Your plant may have early blight."
    ),
    "Tomato_Late_blight": DiagnosisInfo(
        healthStatus: "not healthy.",
        disease: "Late Blight",
        description: "Destroys foliage and fruit with greasy lesions. Spreads rapidly.",
        advice: "Destroy affected plants. Use fungicides and avoid overhead watering.",
        captionText: "Late blight may be affecting your plant."
    ),
    "Tomato_Leaf_Mold": DiagnosisInfo(
        healthStatus: "not healthy.",
        disease: "Leaf Mold",
        description: "Yellow spots on upper leaf surfaces and fuzzy mold underneath.",
        advice: "Improve air circulation and apply fungicides like chlorothalonil.",
        captionText: "Your plant might be showing signs of leaf mold."
    ),
    "Tomato_Septoria_leaf_spot": DiagnosisInfo(
        healthStatus: "not healthy.",
        disease: "Septoria Leaf Spot",
        description: "Tiny dark spots with light centers on older leaves.",
        advice: "Remove infected leaves and apply preventative fungicides.",
        captionText: "Your plant may have a Septoria leaf spot."
    ),
    "Tomato_Spider_mites_Two_spotted_spider_mite": DiagnosisInfo(
        healthStatus: "not healthy.",
        disease: "Spider Mites",
        description: "Tiny pests that cause speckled yellowing and webbing on leaves.",
        advice: "Use insecticidal soap or neem oil. Spray undersides of leaves.",
        captionText: "Spider mites may be present on your plant."
    ),
    "Tomato__Target_Spot": DiagnosisInfo(
        healthStatus: "not healthy.",
        disease: "Target Spot",
        description: "Circular spots with concentric rings, often on older leaves.",
        advice: "Remove damaged leaves and apply appropriate fungicide.",
        captionText: "Your plant may have target spot."
    ),
    "Tomato__Tomato_YellowLeaf__Curl_Virus": DiagnosisInfo(
        healthStatus: "not healthy.",
        disease: "Tomato Yellow Leaf Curl Virus",
        description: "Stunted growth, curled yellow leaves, and reduced yield.",
        advice: "Remove infected plants and control whiteflies using sticky traps.",
        captionText: "Your plant may have tomato yellow leaf curl virus."
    ),
    "Tomato__Tomato_mosaic_virus": DiagnosisInfo(
        healthStatus: "not healthy.",
        disease: "Tomato Mosaic Virus",
        description: "Mottled light and dark green leaves with distorted growth.",
        advice: "Remove infected plants and sanitize tools between uses.",
        captionText: "Your plant may be infected with tomato mosaic virus."
    ),
    "Unknown": DiagnosisInfo(
        healthStatus: "unknown.",
        disease: "Unknown",
        description: "We couldn't identify this condition.",
        advice: "Try uploading a clearer image or consult a local plant expert.",
        captionText: "The condition could not be identified."
    )
]
