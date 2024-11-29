//
//  Category.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 29/10/2024.
//

import Foundation
import SwiftData


struct Category: Identifiable, Hashable, Equatable {
    let id = UUID()
    let title: String
    let tasks: [Product]
}

extension Category {
    
    static let categoryDummy = Category(
        title: "Morning Routine",
        tasks: [
            Product(
                title: "Brush Teeth",
                description: "Start your day by brushing your teeth thoroughly for at least two minutes. Use fluoride toothpaste and ensure to clean all surfaces of your teeth and gums. This helps to remove plaque and maintain oral hygiene."
            ),
            Product(
                title: "Exercise",
                description: "Engage in a 30-minute workout session. This could include jogging, stretching, or a combination of aerobic and strength-training exercises. Exercise boosts your energy levels and sets a positive tone for the day."
            ),
            Product(
                title: "Breakfast",
                description: "Have a nutritious breakfast that includes a balance of protein, carbohydrates, and healthy fats. Consider options like oatmeal, eggs, fruits, and whole-grain bread. Breakfast is crucial for providing energy and improving concentration."
            )
        ]
    )
    
    static let categoriesDummy = [
        Category(
            title: "Morning Routine",
            tasks: [
                Product(
                    title: "Brush Teeth",
                    description: "Start your day by brushing your teeth thoroughly for at least two minutes. Use fluoride toothpaste and ensure to clean all surfaces of your teeth and gums. This helps to remove plaque and maintain oral hygiene."
                ),
                Product(
                    title: "Exercise",
                    description: "Engage in a 30-minute workout session. This could include jogging, stretching, or a combination of aerobic and strength-training exercises. Exercise boosts your energy levels and sets a positive tone for the day."
                ),
                Product(
                    title: "Breakfast",
                    description: "Have a nutritious breakfast that includes a balance of protein, carbohydrates, and healthy fats. Consider options like oatmeal, eggs, fruits, and whole-grain bread. Breakfast is crucial for providing energy and improving concentration."
                )
            ]
        ),
        
        Category(
            title: "Work Tasks",
            tasks: [
                Product(
                    title: "Check Emails",
                    description: "Spend 30 minutes reviewing and responding to important emails. Prioritize messages based on urgency and importance, and ensure to address any critical issues promptly. This helps to stay organized and manage communication effectively."
                ),
                Product(
                    title: "Team Meeting",
                    description: "Attend the scheduled weekly team meeting. Discuss ongoing projects, address any challenges, and collaborate on strategies for upcoming tasks. Ensure to contribute to discussions and take notes for action items."
                ),
                Product(
                    title: "Project Development",
                    description: "Dedicate time to working on project development tasks. This includes coding, designing, or any other specific tasks related to project goals. Focus on completing milestones and ensuring the project progresses as planned."
                )
            ]
        ),
        
        Category(
            title: "Evening Routine",
            tasks: [
                Product(
                    title: "Cook Dinner",
                    description: "Prepare a healthy and balanced dinner. Aim to include a variety of vegetables, lean proteins, and whole grains. Cooking dinner can also be a relaxing activity to unwind after a busy day."
                ),
                Product(
                    title: "Read Book",
                    description: "Set aside 30 minutes to read a book of your choice. This can be fiction or non-fiction, depending on your interests. Reading before bed helps to relax and can improve your overall well-being."
                ),
                Product(
                    title: "Meditation",
                    description: "Engage in a 20-minute meditation session. Find a quiet and comfortable space, focus on your breathing, and practice mindfulness or guided meditation. Meditation helps to reduce stress and enhance mental clarity."
                )
            ]
        )
    ]
}
