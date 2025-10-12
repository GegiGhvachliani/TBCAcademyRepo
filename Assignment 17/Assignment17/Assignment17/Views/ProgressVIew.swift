
import UIKit

class ProgressView: UIView {
    private var oneYearTaksLabel: UILabel = UILabel()
    private var whatPartCompletedLabel: UILabel = UILabel()
    private var changableReminderLabel: UILabel = UILabel()
    private var percentLabel: UILabel = UILabel()
    
    private var progressView: UIProgressView = UIProgressView()
 
    var activeTasksCount: Int = 3 {
        didSet {
            updateProgress()
        }
    }
    var changableRemainderDict: [Int:String] = [ 0 : "ცუდად გაქვს საქმე",
                                                 1 : "მთავარია დაიწყე, გააგრძელე!",
                                                 2 : "ძალიან ბევრი გაქვს სამუშაო",
                                                 3 : "ბევრი გაქვს სამუშაო",
                                                 4 : "მიზანს უახლოვდები!",
                                                 5 : "ძალიან ცოტა დაგრჩა",
                                                 6 : "შენი წლის გეგმა შეასრულე. გილოცავ!"
    ]
    
    init() {
        super.init(frame: .zero)
        
        setupUI()
        
    }
    
    
    func updateProgress() {
        let completed = 6 - activeTasksCount
        let total = 6
        let progress = Float(completed) / Float(total)
        
        //Labels
        whatPartCompletedLabel.text = "\(completed)/6 თასქი შესრულებული"
        percentLabel.text = "\(Int(progress * 100))%"
        changableReminderLabel.text = changableRemainderDict[activeTasksCount] ?? "მოსაფიქრებელია"
        
        //Progress
        progressView.progress = progress    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupConstraints()
        setupOneYearTaksLabel()
        setupOneYearTaksLabel()
        setupWhatPartCompleted()
        setupChangableReminder()
        setupPercent()
        setupProgressView()

        updateProgress()
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
        
        whatPartCompletedLabel.text = "\(6 - activeTasksCount)/6 თასქი შესრულებული"
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
        addSubview(changableReminderLabel)
        changableReminderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        changableReminderLabel.text = changableRemainderDict[activeTasksCount] ?? "მოსაფიქრებელია"
        changableReminderLabel.font = UIFont.systemFont(ofSize: 16, weight: .thin)
        changableReminderLabel.textAlignment = .left
        changableReminderLabel.textColor = .darkGray
        
        NSLayoutConstraint.activate([
            changableReminderLabel.topAnchor.constraint(equalTo: whatPartCompletedLabel.bottomAnchor, constant: 10),
            changableReminderLabel.leadingAnchor.constraint(equalTo: whatPartCompletedLabel.leadingAnchor),
            changableReminderLabel.widthAnchor.constraint(equalToConstant: 160),
            changableReminderLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupPercent() {
        addSubview(percentLabel)
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        percentLabel.text = "\(Int((Double(6 - activeTasksCount) / 6) * 100))%"
        percentLabel.textColor = .label
        percentLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        NSLayoutConstraint.activate([
            percentLabel.topAnchor.constraint(equalTo: whatPartCompletedLabel.bottomAnchor, constant: 0),
            percentLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
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
        progressView.progress = Float(completed / total)
        progressView.trackTintColor = UIColor.progress.withAlphaComponent(0.3)
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: changableReminderLabel.bottomAnchor, constant: 4),
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
    
}

#Preview {
    ProgressView()
}
