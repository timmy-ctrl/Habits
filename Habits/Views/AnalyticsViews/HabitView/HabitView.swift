import UIKit

final class HabitView: UIView {
        
    private lazy var repeatStackView: UIStackView = {
        repeatStackView = UIStackView(arrangedSubviews: [repeatImageView,
                                                         repeatReminderTitleLabel])
        repeatStackView.distribution = .fillProportionally
        repeatStackView.spacing = 10
        repeatStackView.axis = .horizontal
        return repeatStackView
    }()
    
    private lazy var reminderStackView: UIStackView = {
        reminderStackView = UIStackView(arrangedSubviews: [bellImageView,
                                                           reminderTitleLabel])
        reminderStackView.distribution = .fillProportionally
        reminderStackView.spacing = 10
        reminderStackView.axis = .horizontal
        return reminderStackView
    }()
    
    private let habitImageView: UIImageView = {
        let habitImage = UIImageView()
        habitImage.image = AssetImages.habit.image
        return habitImage
    }()
    
    private let bellImageView: UIImageView = {
        let bellImageView = UIImageView()
        bellImageView.image = AssetImages.bell.image
        return bellImageView
    }()
    
    private let repeatImageView: UIImageView = {
        let habitImage = UIImageView()
        habitImage.image = AssetImages.repeatImage.image
        return habitImage
    }()
    
    private let titleHabitLabel: UILabel = {
        let titleHabit = UILabel()
        titleHabit.text = "Read a Book"
        titleHabit.textColor = UIColor.lilacColor
        titleHabit.middleFont()
        return titleHabit
    }()
    
    private let reminderTitleLabel: UILabel = {
        let reminderTitle = UILabel()
        reminderTitle.text = "Repeat everyday"
        reminderTitle.textColor = UIColor.lightGrayColor
        reminderTitle.smallFont()
        return reminderTitle
    }()
    
    private let repeatReminderTitleLabel: UILabel = {
        let repeatReminderTitle = UILabel()
        repeatReminderTitle.text = "Reminders: 5:00am"
        repeatReminderTitle.textColor = UIColor.lightGrayColor
        repeatReminderTitle.smallFont()
        return repeatReminderTitle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        congifureHabitView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup UI
extension HabitView {
    private func congifureHabitView() {
        self.layer.cornerRadius = 16
        configureBackgroundColor()
        configureHabitImage()
        configureTitleHabitLabel()
        configureReminderStackView()
        configureRepeatStackView()
    }
    
    private func configureBackgroundColor() {
        backgroundColor = UIColor.whiteColor
    }
    private func configureHabitImage() {
        self.addSubviews(habitImageView)
        NSLayoutConstraint.activate([
            habitImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            habitImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            habitImageView.widthAnchor.constraint(equalToConstant: 100),
            habitImageView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    private func configureTitleHabitLabel() {
        self.addSubviews(titleHabitLabel)
        NSLayoutConstraint.activate([
            titleHabitLabel.leadingAnchor.constraint(equalTo: habitImageView.trailingAnchor, constant: 10),
            titleHabitLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
        ])
    }
    private func configureReminderStackView() {
        self.addSubviews(reminderStackView)
        NSLayoutConstraint.activate([
            reminderStackView.topAnchor.constraint(equalTo: titleHabitLabel.bottomAnchor, constant: 10),
            reminderStackView.leadingAnchor.constraint(equalTo: habitImageView.trailingAnchor, constant: 10),
        ])
    }
    private func configureRepeatStackView() {
        self.addSubviews(repeatStackView)
        NSLayoutConstraint.activate([
            repeatStackView.topAnchor.constraint(equalTo: reminderStackView.bottomAnchor, constant: 6),
            repeatStackView.leadingAnchor.constraint(equalTo: habitImageView.trailingAnchor, constant: 10),
        ])
    }
}
