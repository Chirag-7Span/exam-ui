import SwiftUI

struct SelectedItemPage: View {
    @State private var selectedItems: [SelectionViewModel] = []

    init(selectedItems: [ImageModel]) {
        _selectedItems = State(initialValue: selectedItems.map { SelectionViewModel(imageModel: $0) })
    }

    var body: some View {
        VStack {
            Text("Select Any 5 Items")
                .font(.body)
                .padding()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(selectedItems.indices, id: \.self) { index in
                        let viewModel = selectedItems[index]

                        Button(action: {
                            if selectedItems.filter({ $0.isSelected }).count < 5 || viewModel.isSelected {
                                selectedItems[index].isSelected.toggle()
                            }
                        }) {
                            VStack {
                                RoundedRectangle(cornerRadius: 8) // Adjust corner radius as needed
                                    .stroke(Color.gray, lineWidth: 1) // Gray color outline with a line width of 1
                                    .overlay(
                                        Image(viewModel.imageModel.imageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40) // Fixed size of 50x50
                                            .clipShape(RoundedRectangle(cornerRadius: 8)) // Clip image inside the outline
                                    )
                                    .frame(width: 60, height: 60)
                                    .background(viewModel.isSelected ? Color.gray.opacity(0.5) : Color.clear) // Highlight if selected

                                Text(viewModel.imageModel.imageTitle)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.gray)
                            }
                        }
                        .buttonStyle(PlainButtonStyle()) // Remove default button style
                        .disabled(selectedItems.filter({ $0.isSelected }).count >= 5 && !viewModel.isSelected)
                    }
                }
                .padding()
            }
            
            StickyBottomView(selectedItems: $selectedItems)
        }
    }
}

struct StickyBottomView: View {
    @Binding var selectedItems: [SelectionViewModel]
    
    var body: some View {
        VStack(spacing: 15) {
            Divider()
          
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() { // Adjust spacing between items
                    ForEach(selectedItems.filter { $0.isSelected }) { selectedItem in
                        SelectedItemBlockView(selectedItem: selectedItem, selectedItems: $selectedItems)
                            .frame(width: (UIScreen.main.bounds.width - 20) / 5 - 5) // Calculate width dynamically for 5 items per row
                            .onTapGesture {
                                if let index = selectedItems.firstIndex(where: { $0.id == selectedItem.id }) {
                                    selectedItems[index].isSelected.toggle()
                                }
                            }
                    }
                }
                .padding(.horizontal)
            }
            
            // Next button added here
            NavigationLink(destination: ContentView()) {
                Text("Next")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(30)
                    .padding()
            }
            .navigationBarHidden(true) // Hide navigation bar for this button
        }.padding()
    }
}

struct SelectedItemBlockView: View {
    let selectedItem: SelectionViewModel
    @Binding var selectedItems: [SelectionViewModel] // Binding to update the selected items

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(selectedItem.imageModel.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40) // Fixed size of 60x60
                    .clipShape(RoundedRectangle(cornerRadius: 8)) // Clip image inside the outline
                
                Button(action: {
                    if let index = selectedItems.firstIndex(where: { $0.id == selectedItem.id }) {
                        selectedItems[index].isSelected.toggle()
                    }
                }) {
                    Image("cancel")
                        .foregroundColor(.red)
//                        .padding()
                }
                .padding(.trailing, 0)
                .padding(.top,0)
            }
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}


struct SelectionViewModel: Identifiable {
    let id = UUID()
    var isSelected: Bool = false
    let imageModel: ImageModel
}
