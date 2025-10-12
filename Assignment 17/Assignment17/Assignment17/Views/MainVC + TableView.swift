import UIKit

extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         //  Deselect animation
         tableView.deselectRow(at: indexPath, animated: true)
         
         //  აიღე sorted task
         let selectedTask = sortedTasks[indexPath.row]
         
         //  იპოვე original array-ში
         if let originalIndex = tasksToDo.firstIndex(where: {
             $0.todo == selectedTask.todo && $0.completionDeadline == selectedTask.completionDeadline
         }) {
        //  Toggle status
             tasksToDo[originalIndex].isCompleted.toggle()
         }
         
         //  განაახლე UI
         tableView.reloadData()
         updateProgress()
     }
    
}





extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasksToDo.count
    }
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.height * (100 / 932)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath) as? TasksCell else { return UITableViewCell() }
        
        let task = sortedTasks[indexPath.row]
        cell.configure(with: task)
        
        return cell
    }
    
    
    
}

#Preview {
    MainVC()
}


