//
//  ContentView.swift
//  Navigation
//
//  Created by Pedro Acevedo on 22/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //NavigationstackTheWrongWay()
        //NavigationStackTheRightWay()
        //ProgramaticNavigation()
        //NavigatingUsingDiferentDataTypes()
        //NavigatingUsingDiferentDataTypesProgramatically()
        //ReturnToRootViewProgramatically()
        RememberingNavigation()
    }
}

#Preview {
    ContentView()
}

struct NavigationstackTheWrongWay: View {
    //In this demo you can see that DetailView is loaded even before we tap the button
    //You will see "Creating detail view \(number)" when this view loads
    //This is a problem because we are using more resources than needed
    var body: some View {
        NavigationStack {
            List(0..<1000) { i in
                NavigationLink("Tap Me") {
                    DetailView(number: i)
                }
            }
        }
    }
}

struct NavigationStackTheRightWay: View {
    //Here views are not loaded until you click the navigation link
    //You will not see the init console log here
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                DetailView(number: selection)
            }
        }
    }
}

struct ProgramaticNavigation: View {
    //Here were navigating to views using an array of integers
    //path is binded to the NavigationStack, whenever we push a new value to the path
    //Navigation destination will send us to the appropiate view
    //The value we use for path must be a data type that conforms to hashable
    @State private var path = [Int]()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }

                Button("Show 64") {
                    path.append(64)
                }
                
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                DetailView(number: selection)
            }
        }
    }
}

struct NavigatingUsingDiferentDataTypes: View {
    //When using a simple navigationDestination you can simply add multiple of them
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }

                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
        }
    }
}

struct NavigatingUsingDiferentDataTypesProgramatically: View {
    //When wanting to navigate using diferen hashable data types (string and integer in this case)
    //Swift gives us the NavigationPath, this works like an array, but it accepts multiple data types
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Navigation demo")
            }
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }

                Button("Push Hello") {
                    path.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
        }
    }
}

struct ReturnToRootViewProgramatically: View {
    @State private var path = [Int]()

    var body: some View {
        NavigationStack(path: $path) {
            DetailView2(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView2(number: i, path: $path)
                }
        }
    }
}

struct RememberingNavigation: View {
    //In this final demo we demonstrate how to save the path in a json file
    //So that the app remembers were it was left after closing
    @State private var pathStore = PathStore()

    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView3(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailView3(number: i)
                }
        }
    }
}




struct DetailView: View {
    var number: Int

    var body: some View {
        Text("Detail View \(number)")
    }

    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct DetailView2: View {
    var number: Int
    @Binding var path: [Int]

    var body: some View {
        VStack {
            NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
                .navigationTitle("Number: \(number)")
        }
        .toolbar {
            Button("Home") {
                path.removeAll()
            }
        }
        
        /*
         If using a NavigationPath you can use...
         
         .toolbar {
             Button("Home") {
                 path = NavigationPath()
             }
         }
         */
    }
}

struct DetailView3: View {
    var number: Int

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}



@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }

        // Still here? Start with an empty path.
        path = NavigationPath()
    }

    func save() {
        guard let representation = path.codable else { return }

        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}
