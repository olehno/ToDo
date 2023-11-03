//
//  Lesson.swift
//  ToDo
//
//  Created by Артур Олехно on 03/11/2023.
//

import Foundation

struct Lesson {
    
    let lesson: String
    let lessonVideoURL: String
    let gitURL: String
    
    static func createLesson() -> [Lesson] {
        var lessons: [Lesson] = []
        let session = DataManager.shared.lesson
        let lessonVideoURLs = DataManager.shared.lessonVideoURL
        let gitURLs = DataManager.shared.gitURL
        
        for i in 0..<session.count {
            let lecture = Lesson(lesson: session[i], lessonVideoURL: lessonVideoURLs[i], gitURL: gitURLs[i])
            lessons.append(lecture)
        }
        return lessons
    }
}
