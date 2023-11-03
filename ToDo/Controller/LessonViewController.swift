//
//  LessonViewController.swift
//  ToDo
//
//  Created by Артур Олехно on 03/11/2023.
//

import UIKit

class LessonViewController: UIViewController {
    
    var lessons = Lesson.createLesson()
    
    private let lessonsTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        title = "All Lessons"
        
        view.addSubview(lessonsTable)
        
        lessonsTable.delegate = self
        lessonsTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lessonsTable.frame = view.bounds
    }
}

extension LessonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = lessons[indexPath.row].lesson
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lesson = lessons[indexPath.row]
        let vc = LessonDetailViewController()
        vc.configure(videuUrl: lesson.lessonVideoURL, gitUrl: lesson.gitURL)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
