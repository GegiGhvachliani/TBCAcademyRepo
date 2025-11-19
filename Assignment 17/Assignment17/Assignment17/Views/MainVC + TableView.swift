import UIKit

extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tasksToDo[indexPath.row].isCompleted.toggle()
        
        tableView.reloadRows(at: [indexPath], with: .none)
        
        tasksToDo.sort{ $0.isCompleted && !$1.isCompleted }
        
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
        
        cell.configure(with: tasksToDo[indexPath.row])
        return cell
    }
    
    
    
}

#Preview {
    MainVC()
}


