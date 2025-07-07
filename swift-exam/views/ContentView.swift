import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var selectedImages: [TransferableImage] = []
    @State private var photosPickerItems: [PhotosPickerItem] = []
    @State private var isPickerPresented = false
    @State private var draggingImage: TransferableImage?

    var body: some View {
        VStack(spacing: 20) {
            ScrollView {
                ForEach(selectedImages) { image in
                    Image(uiImage: image.image)
                        .resizable()
                        .frame(width: 300, height: 300)
                        .onDrag {
                            draggingImage = image
                            return NSItemProvider(object: image.image)
                        }
                        .dropDestination(for: TransferableImage.self) { items, location in
                            guard let fromImage = draggingImage,
                                  let toIndex = selectedImages.firstIndex(of: image),
                                  let fromIndex = selectedImages.firstIndex(of: fromImage),
                                  fromIndex != toIndex else {
                                return false
                            }
                            selectedImages.move(fromOffsets: IndexSet(integer: fromIndex),
                                                toOffset: toIndex > fromIndex ? toIndex + 1 : toIndex)
                            return true
                        }
                    }
                .padding()
            }

            Button("Adicionar imagens") {
                isPickerPresented = true
            }
        }
        .photosPicker(
            isPresented: $isPickerPresented,
            selection: $photosPickerItems,
            maxSelectionCount: 5,
            matching: .images
        )
        .onChange(of: photosPickerItems) {
            Task {
                for item in photosPickerItems {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        selectedImages.append(TransferableImage(image: uiImage))
                    }
                }
            }
        }
        .padding()
    }
}
