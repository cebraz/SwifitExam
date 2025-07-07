import SwiftUI
import UniformTypeIdentifiers

struct TransferableImage: Identifiable, Equatable {
    let id = UUID()
    let image: UIImage
}

extension TransferableImage: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(contentType: .image) {
            return $0.image.pngData() ?? Data()
    
        } importing: { data in
            guard let uiImage = UIImage(data: data) else {
                throw ImportError.invalidImage
            }
            return TransferableImage(image: uiImage)
        }
    }

    enum ImportError: Error {
        case invalidImage
    }
}
