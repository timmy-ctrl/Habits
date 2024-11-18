import UIKit

final class ReminderTextView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Reminder"
        label.middleFont()
        label.textColor = UIColor.customColor
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "10:00AM >"
        label.middleFont()
        label.textColor = UIColor.lightOrangeColor
        return label
    }()
    
    private var reminderStuckView: UIStackView = {
        let reminderStuckView = UIStackView()
        return reminderStuckView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureReminderStuckView()
        configureReminderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup UI
extension ReminderTextView {
    private func configureReminderStuckView() {
        reminderStuckView = UIStackView(arrangedSubviews: [titleLabel,
                                                           timeLabel])
        reminderStuckView.axis = .horizontal
        reminderStuckView.spacing = 16
        reminderStuckView.addSubviews(titleLabel, timeLabel)
        self.addSubviews(reminderStuckView)
        NSLayoutConstraint.activate([
            reminderStuckView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            reminderStuckView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            reminderStuckView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    private func configureReminderView() {
        self.backgroundColor = UIColor.whiteColor
        self.layer.cornerRadius = 16
    }
}
