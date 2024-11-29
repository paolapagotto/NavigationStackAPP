//
//  AddCategoryView.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 29/10/2024.
//

import Foundation
import SwiftUI

class AddCategoryViewwConfigurator {
    @ViewBuilder
    func setup(coordinator: SearchCoordinator) -> some View {
        let viewModel = AddCategoryViewModel(coordinator: coordinator)
        AddCategoryView(viewModel: viewModel)
    }
}

class AddCategoryViewModel: ObservableObject {
    var coordinator: SearchCoordinator
    
    @Published var categoryTitle: String = ""
    @Published var categoryTasks: [Product] = []
    @Published var newTaskTitle: String = ""
    @Published var newTaskDescription: String = ""
    @Published var onSaveButtonTap: ((Category) -> Void?)?
    
    init(coordinator: SearchCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateTo(_ route: Route) {
        coordinator.push(next: route)
    }
    
    func popToRoot() {
        coordinator.popToRoot()
    }
    
    func dismiss() {
        coordinator.dismissSheet()
    }
}



struct AddCategoryView: View {
    
    @StateObject var viewModel: AddCategoryViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Category Details")) {
                    TextField("Category Name", text: $viewModel.categoryTitle)
                        .autocorrectionDisabled()
                }
                
                if !viewModel.categoryTasks.isEmpty {
                    Section(header: Text("Tasks")) {
                        ForEach(viewModel.categoryTasks) { task in
                            VStack(alignment: .leading) {
                                Text(task.title)
                                    .font(.headline)
                                Text(task.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        //.onDelete(perform: deleteTask)
                    }
                }
                
                Section(header: Text("Add task")) {
                    TextField("Task Name", text: $viewModel.newTaskTitle)
                        .autocorrectionDisabled()
                
                    TextField("Description", text: $viewModel.newTaskDescription)
                        .autocorrectionDisabled()

                    Button("Add New Task", systemImage: "plus") {
                        //addTask()
                    }
                    .disabled(viewModel.newTaskTitle.isEmpty || viewModel.newTaskDescription.isEmpty)
                    .foregroundStyle(viewModel.newTaskTitle.isEmpty && viewModel.newTaskDescription.isEmpty ? Color.secondary : Color.accentColor)
                }
            }
            .navigationTitle("Add Habit")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        viewModel.dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
//                    Button(action: saveHabit) {
//                        Text("Save Habit")
//                    }
//                    .disabled(viewModel.categoryTitle.isEmpty || viewModel.categoryTasks.isEmpty)
                }
            }
        }
    }
    
//    private func addTask() {
//        let newTask = Product(
//            title: viewModel.newTaskTitle,
//            description: viewModel.newTaskDescription
//        )
//        viewModel.categoryTasks.append(newTask)
//        viewModel.newTaskTitle = ""
//        viewModel.newTaskDescription = ""
//    }
//    
//    private func deleteTask(at offsets: IndexSet) {
//        viewModel.categoryTasks.remove(atOffsets: offsets)
//    }
//    
//    private func saveHabit() {
//        let newCategory = Category(title: viewModel.categoryTitle, tasks: viewModel.categoryTasks)
//        guard let onSaveButtonTap = viewModel.onSaveButtonTap else { return }
//        
//        viewModel.coordinator.presentAlert(AlertDisplayable(title: "Success", message: "New category saved successfully", buttons: [AlertButton]()))
//        viewModel.dismiss()
//        onSaveButtonTap(newCategory)
//    }
//    
//    private func addItem() {
//        withAnimation {
//            index += 1
//            let newItem = Item(timestamp: Date(), title: "Task \(index)", taskDescription: "")
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}
