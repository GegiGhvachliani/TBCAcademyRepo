
import UIKit

class ProgressView: UIView {
    //MARK: Properties
    private var oneYearTaksLabel: UILabel = UILabel()
    private var whatPartCompletedLabel: UILabel = UILabel()
    private var changeableReminderLabel: UILabel = UILabel()
    private var percentLabel: UILabel = UILabel()
    
    private var progressView: UIProgressView = UIProgressView()
    
    init() {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    private func setupUI() {
        setupConstraints()
        
        setupOneYearTaksLabel()
        setupWhatPartCompleted()
        setupChangableReminder()
        setupPercent()
        
        setupProgressView()
    }
    
    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = .tableBackground
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: widthAnchor),
            self.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    private func setupOneYearTaksLabel() {
        addSubview(oneYearTaksLabel)
        oneYearTaksLabel.translatesAutoresizingMaskIntoConstraints = false
        
        oneYearTaksLabel.text = "1 წლის თასქები"
        oneYearTaksLabel.textColor = .label
        oneYearTaksLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        oneYearTaksLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            oneYearTaksLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            oneYearTaksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            oneYearTaksLabel.widthAnchor.constraint(equalToConstant: 170),
            oneYearTaksLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
    }
    
    private func setupWhatPartCompleted() {
        addSubview(whatPartCompletedLabel)
        whatPartCompletedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        whatPartCompletedLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        whatPartCompletedLabel.textColor = .darkGray
        whatPartCompletedLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            whatPartCompletedLabel.topAnchor.constraint(equalTo: oneYearTaksLabel.bottomAnchor, constant: 10),
            whatPartCompletedLabel.leadingAnchor.constraint(equalTo: oneYearTaksLabel.leadingAnchor),
            whatPartCompletedLabel.widthAnchor.constraint(equalToConstant: 215),
            whatPartCompletedLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupChangableReminder() {
        addSubview(changeableReminderLabel)
        changeableReminderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        changeableReminderLabel.font = UIFont.systemFont(ofSize: 16, weight: .thin)
        changeableReminderLabel.textAlignment = .left
        changeableReminderLabel.textColor = .darkGray
        
        NSLayoutConstraint.activate([
            changeableReminderLabel.topAnchor.constraint(equalTo: whatPartCompletedLabel.bottomAnchor, constant: 10),
            changeableReminderLabel.leadingAnchor.constraint(equalTo: whatPartCompletedLabel.leadingAnchor),
            changeableReminderLabel.widthAnchor.constraint(equalToConstant: 300),
            changeableReminderLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupPercent() {
        addSubview(percentLabel)
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        percentLabel.textColor = .label
        percentLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        NSLayoutConstraint.activate([
            percentLabel.topAnchor.constraint(equalTo: whatPartCompletedLabel.bottomAnchor, constant: 0),
            percentLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            percentLabel.widthAnchor.constraint(equalToConstant: 55),
            percentLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupProgressView() {
        addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        let completed = Double(6 - activeTasksCount)
        let total = Double(6)
        progressView.progress = Float(completed / total)
        
        progressView.progressTintColor = .progress
        progressView.layer.shadowColor = UIColor.black.cgColor
        progressView.layer.shadowOpacity = 0.8
        progressView.layer.shadowOffset = CGSize(width: 0, height: 3)
        progressView.layer.shadowRadius = 10
//        progressView.progress = Float(completed / total)
        progressView.trackTintColor = UIColor.progress.withAlphaComponent(0.3)
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: changeableReminderLabel.bottomAnchor, constant: 4),
            progressView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            progressView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 12/13),
            progressView.heightAnchor.constraint(equalToConstant: 20)
        ])
        DispatchQueue.main.async {
            if self.progressView.subviews.count > 1 {
                self.progressView.subviews[1].layer.cornerRadius = 10
                self.progressView.subviews[1].clipsToBounds = true
            }
        }
    }
    
    func updateProgressView() {
        whatPartCompletedLabel.text = "\((totalTasks - activeTasksCount)) თასქი შესრულებული"
        changeableReminderLabel.text = changeableReminderDict[totalTasks - activeTasksCount] ?? "მოსაფიქრებელია"
        percentLabel.text = "\(Int(Double(totalTasks - activeTasksCount) / Double(totalTasks) * 100))%"
        progressView.progress = (Float(Double(totalTasks - activeTasksCount) / Double(totalTasks)))
    }
}

#Preview {
    ProgressView()
}
