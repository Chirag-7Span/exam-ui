import SwiftUI

struct ContentView: View {
    
    // Row data passed to display
    @State var expandableListData: [ExpandableListItem] = [
        ExpandableListItem(title: "Sport/Exercise/Fitness", isExpanded: false, images: [
            ImageModel(imageName: "frame", imageTitle: "Surfing"),
            ImageModel(imageName: "shoes", imageTitle: "Hiking and Mountain"),
            ImageModel(imageName: "cycle", imageTitle: "Biking"),
            ImageModel(imageName: "water", imageTitle: "Scuba Diving")
        ]),
        ExpandableListItem(title: "Travelling/Adventure", isExpanded: false, images: [
            ImageModel(imageName: "chair", imageTitle: "Vacation"),
            ImageModel(imageName: "carr", imageTitle: "Trip"),
            ImageModel(imageName: "boat", imageTitle: "Cruising"),
            ImageModel(imageName: "frame", imageTitle: "Toscany"),
            ImageModel(imageName: "per", imageTitle: "Treking")
        ]),
        ExpandableListItem(title: "Foodies and Cheers", isExpanded: false, images: [
            ImageModel(imageName: "food1", imageTitle: "Cooking"),
            ImageModel(imageName: "food2", imageTitle: "Culinary"),
            ImageModel(imageName: "food3", imageTitle: "Restaurants"),
            ImageModel(imageName: "food4", imageTitle: "Dining Out"),
            ImageModel(imageName: "food5", imageTitle: "Veg")
        ]),
        ExpandableListItem(title: "Music/Entertainment", isExpanded: false, images: [
            ImageModel(imageName: "music1", imageTitle: "Festival"),
            ImageModel(imageName: "music2", imageTitle: "Concert"),
            ImageModel(imageName: "music3", imageTitle: "Brand/DJ"),
            ImageModel(imageName: "music4", imageTitle: "Musical Instruments"),
            ImageModel(imageName: "music5", imageTitle: "Karate")
        ]),
        ExpandableListItem(title: "Culture/Language", isExpanded: false, images: [
            ImageModel(imageName: "frame", imageTitle: "Holiday"),
            ImageModel(imageName: "frame", imageTitle: "Seasonal Events"),
            ImageModel(imageName: "frame", imageTitle: "Chinese - Mandarin"),
            ImageModel(imageName: "frame", imageTitle: "Spanish"),
            ImageModel(imageName: "frame", imageTitle: "English")
        ]),
        ExpandableListItem(title: "Gathering", isExpanded: false, images: [
            ImageModel(imageName: "frame", imageTitle: "Bonfire"),
            ImageModel(imageName: "frame", imageTitle: "Picnic"),
            ImageModel(imageName: "frame", imageTitle: "BBQ/Grilling"),
            ImageModel(imageName: "frame", imageTitle: "Camping"),
            ImageModel(imageName: "frame", imageTitle: "Networking")
        ]),
        ExpandableListItem(title: "Spiritual/Motivation", isExpanded: false, images: [
            ImageModel(imageName: "frame", imageTitle: "Meditation"),
            ImageModel(imageName: "frame", imageTitle: "Mindfulness"),
            ImageModel(imageName: "frame", imageTitle: "Public Speaking"),
            ImageModel(imageName: "frame", imageTitle: "leadership"),
            ImageModel(imageName: "frame", imageTitle: "Talent")
        ]),
        ExpandableListItem(title: "Volunteering", isExpanded: false, images: [
            ImageModel(imageName: "frame", imageTitle: "CharitableN"),
            ImageModel(imageName: "frame", imageTitle: "Non-Profits"),
            ImageModel(imageName: "frame", imageTitle: "Organizations"),
            ImageModel(imageName: "frame", imageTitle: "Greenspace")
        ]),
        ExpandableListItem(title: "Reading/Writing", isExpanded: false, images: [
            ImageModel(imageName: "frame", imageTitle: "Journaling"),
            ImageModel(imageName: "frame", imageTitle: "Blogging"),
            ImageModel(imageName: "frame", imageTitle: "Books"),
            ImageModel(imageName: "frame", imageTitle: "Library")
        ]),
        ExpandableListItem(title: "Business/Careers", isExpanded: false, images: [
            ImageModel(imageName: "frame", imageTitle: "Coffee Houses"),
            ImageModel(imageName: "frame", imageTitle: "Convention Center"),
            ImageModel(imageName: "frame", imageTitle: "Finance"),
            ImageModel(imageName: "frame", imageTitle: "Stock Market"),
            ImageModel(imageName: "frame", imageTitle: "Marketing")
        ]),
        ExpandableListItem(title: "Pets", isExpanded: false, images: [
            ImageModel(imageName: "frame", imageTitle: "Dog Park"),
            ImageModel(imageName: "frame", imageTitle: "Rescue"),
            ImageModel(imageName: "frame", imageTitle: "Adoption"),
            ImageModel(imageName: "frame", imageTitle: "Wildlife"),
            ImageModel(imageName: "frame", imageTitle: "Zoo")
        ]),
        ExpandableListItem(title: "65+", isExpanded: false, images: [
            ImageModel(imageName: "frame", imageTitle: "Sweing"),
            ImageModel(imageName: "frame", imageTitle: "Chess"),
            ImageModel(imageName: "frame", imageTitle: "Volunteering"),
            ImageModel(imageName: "frame", imageTitle: "Gardening")
        ]),
        ExpandableListItem(title: "Arts/Crafts", isExpanded: false, images: [
            ImageModel(imageName: "frame", imageTitle: "Museum"),
            ImageModel(imageName: "frame", imageTitle: "painting/Drawing"),
            ImageModel(imageName: "frame", imageTitle: "Wood Working"),
            ImageModel(imageName: "frame", imageTitle: "Sculpture / Pottery"),
            ImageModel(imageName: "frame", imageTitle: "Gallery")
        ]),
        ExpandableListItem(title: "Health / Wellness", isExpanded: false, images: [
            ImageModel(imageName: "frame", imageTitle: "Yoga & Pilates"),
            ImageModel(imageName: "frame", imageTitle: "Nutrition"),
            ImageModel(imageName: "frame", imageTitle: "Spa and Beauty")
        ]),
        ExpandableListItem(title: "LGBTQ", isExpanded: false, images: [
            ImageModel(imageName: "frame", imageTitle: "Pride"),
            ImageModel(imageName: "frame", imageTitle: "Drag Show")
        ]),
        ExpandableListItem(title: "Moms or Women’s only", isExpanded: false, images: [
            ImageModel(imageName: "frame", imageTitle: "Parenting & Family"),
            ImageModel(imageName: "frame", imageTitle: "Shopping"),
            ImageModel(imageName: "frame", imageTitle: "Fertility"),
            ImageModel(imageName: "frame", imageTitle: "Fashion")
        ]),
    ]
    
    // Array to store selected items
    @State var selectedItems: [ImageModel] = []
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(expandableListData.indices, id: \.self) { index in
                        Section(header: headerView(for: index)) {
                            if expandableListData[index].isExpanded {
                                let images = expandableListData[index].images
                                let chunks = images.chunked(into: 4) // Split images into chunks of 4
                                ForEach(chunks.indices, id: \.self) { chunkIndex in
                                    HStack {
                                        ForEach(chunks[chunkIndex], id: \.self) { imageModel in
                                            ImageRow(imageModel: imageModel, isSelected: selectedItems.contains(imageModel)) // Pass isSelected flag
                                                .onTapGesture {
                                                    toggleItemSelection(imageModel)
                                                }
                                        }
                                    }

                                }
                            }
                        }
                    }

                }
                NavigationLink(destination: SelectedItemPage(selectedItems: selectedItems)) {
                    Text("Next")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(30)
                        .padding()
                }            .navigationBarTitle("Select Category")

            }
            .background(Color.white) // Add background color to the button
            .navigationBarColor(backgroundColor: .blue, tintColor: .white)
        }
    }
    
    func headerView(for index: Int) -> some View {
        Button(action: {
            expandableListData[index].isExpanded.toggle()
        }) {
            Text(expandableListData[index].title)
                .font(.headline)
                .foregroundColor(.black)
//                .padding(.horizontal, 20) // Add horizontal padding to the text
                .frame(maxWidth: .infinity) // Expand the text to full width
            
        }
        .frame(height: 40)
        .background(Color.gray.opacity(0.1))
    }
    
    func toggleItemSelection(_ imageModel: ImageModel) {
        if let index = selectedItems.firstIndex(where: { $0.id == imageModel.id }) {
            selectedItems.remove(at: index) // Deselect if already selected
        } else {
            selectedItems.append(imageModel) // Select if not selected
        }
    }
}

struct ExpandableListItem {
    let title: String
    var isExpanded: Bool
    let images: [ImageModel]
}

struct ImageModel: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
    let imageTitle: String
    var isSelected: Bool = false // Property to track selection state
}

struct ImageRow: View {
    let imageModel: ImageModel
    let isSelected: Bool // Flag to track selection state
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 8) // Adjust corner radius as needed
                .stroke(Color.gray, lineWidth: 1) // Gray color outline with a line width of 1
                .overlay(
                    Image(imageModel.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40) // Fixed size of 50x50
                        .clipShape(RoundedRectangle(cornerRadius: 8)) // Clip image inside the outline
                )
                .frame(width: 60, height: 60)
                .background(isSelected ? Color.gray.opacity(0.5) : Color.clear) // Highlight if selected
            
            Text(imageModel.imageTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
        }
            
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: size).map { Array(self[$0..<Swift.min($0 + size, self.count)]) }
    }
}


extension View {
    func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, tintColor: tintColor))
    }
}

struct NavigationBarModifier: ViewModifier {
    var backgroundColor: UIColor
    var tintColor: UIColor

    init(backgroundColor: UIColor, tintColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor

        UINavigationBar.appearance().backgroundColor = backgroundColor
        UINavigationBar.appearance().tintColor = tintColor
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: tintColor]
    }

    func body(content: Content) -> some View {
        content
            .onAppear {
                UINavigationBar.appearance().backgroundColor = self.backgroundColor
                UINavigationBar.appearance().tintColor = self.tintColor
                UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: self.tintColor]
            }
    }
}
