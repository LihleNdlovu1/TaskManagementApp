//
//  ViewController.swift
//  Task Management app
//
//  Created by Lubelihle Ndlovu on 2025/07/25.
//

import UIKit


struct Task {
    var title: String
    var isCompleted: Bool
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

   
    @IBAction func addTaskTapped(_ sender: UIButton) {
    guard let text = taskTextField.text, !text.isEmpty else {
            print("Text field is empty")
            return
        }
        
        let newTask = Task(title: text, isCompleted: false)
        tasks.append(newTask)
        print("Task added: \(newTask.title)")
        
        taskTextField.text = ""
        tableView.reloadData()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") ??
                   UITableViewCell(style: .default, reuseIdentifier: "TaskCell")

        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        cell.accessoryType = task.isCompleted ? .checkmark : .none

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tasks[indexPath.row].isCompleted.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
