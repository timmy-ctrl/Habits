import UIKit

final class NewHabitView: UIView {
    
    private let billboardViewNewHabitView = BillboardViewNewHabitView()
    private let switchView = SwitchView()
    private let habitTrackerView = HabitTrackerView()
    public let reminderView = ReminderTextView()
    
    private var habitEntryStackView: UIStackView = {
        let habitEntryStackView = UIStackView()
        return habitEntryStackView
    }()
    
    private var viewsStuckView: UIStackView = {
        let viewsStuckView = UIStackView()
        return viewsStuckView
    }()
    
    private let habitPlusButton: UIButton = {
        let habitPlusButton = UIButton()
        habitPlusButton.setImage(AssetImages.addhabitplus.image, for: .normal)
        return habitPlusButton
    }()
    
    public let completedHabbitButton: UIButton = {
        let addHabbitButton = UIButton()
        addHabbitButton.setImage(AssetImages.completed.image, for: .normal)
        addHabbitButton.backgroundColor = UIColor.backgroundOrangeButton
        addHabbitButton.layer.cornerRadius = 25
        return addHabbitButton
    }()
    
    private let addHabbitButton: UIButton = {
        let addHabbitButton = UIButton()
        addHabbitButton.setImage(AssetImages.addhabit.image, for: .normal)
        addHabbitButton.backgroundColor = UIColor.whiteColor
        addHabbitButton.layer.cornerRadius = 12
        return addHabbitButton
    }()
    
    private let habitNameTextField: UITextField = {
        let habitNameTextField = UITextField()
        habitNameTextField.layer.cornerRadius = 20
        habitNameTextField.attributedPlaceholder = NSAttributedString(
                string: "Enter habit name",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.textFieldColor]
            )
        habitNameTextField.backgroundColor = UIColor.whiteColor
        habitNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        habitNameTextField.leftViewMode = .always
        return habitNameTextField
    }()
    
    private let backgroundImageView: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = AssetImages.homePageBackground.image
        return backgroundImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        startShadowPulseAnumation()
        congifureBackgroundImage()
        configureAddHabbitButton()
        configureBillboardViewNewHabitView()
        configureHabitEntryStackView()
        confugureViewsStuckView()
        configureHabitPlusButton()
        habitTrackerview()
        configureBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup UI
extension NewHabitView {
    
    private func habitTrackerview() {
        habitTrackerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubviews(habitTrackerView)
        NSLayoutConstraint.activate([
            habitTrackerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            habitTrackerView.heightAnchor.constraint(equalToConstant: 180),
            habitTrackerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            habitTrackerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
        ])
        
        habitTrackerView.updateCircles(frequencies: [2,1,1,2,1,2,2])
    }
    private func congifureBackgroundImage() {
        self.addSubviews(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
    private func configureBackgroundColor() {
        self.backgroundColor = UIColor.backgroundColorVC
    }
    
    private func configureHabitEntryStackView() {
        habitEntryStackView = UIStackView(arrangedSubviews: [habitNameTextField,
                                                             addHabbitButton])
        habitEntryStackView.distribution = .fillProportionally
        habitEntryStackView.spacing = 12
        habitEntryStackView.axis = .horizontal
        self.addSubviews(habitEntryStackView)
        NSLayoutConstraint.activate([
            habitEntryStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            habitEntryStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            habitEntryStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            habitEntryStackView.heightAnchor.constraint(equalToConstant: 50),
        ])
        NSLayoutConstraint.activate([
            addHabbitButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func confugureViewsStuckView() {
        viewsStuckView = UIStackView(arrangedSubviews: [reminderView,
                                                        switchView])
        viewsStuckView.distribution = .fillEqually
        viewsStuckView.spacing = 15
        viewsStuckView.axis = .vertical
        self.addSubviews(viewsStuckView)
        NSLayoutConstraint.activate([
            viewsStuckView.topAnchor.constraint(equalTo: habitEntryStackView.bottomAnchor, constant: 15),
            viewsStuckView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            viewsStuckView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            viewsStuckView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    private func configureBillboardViewNewHabitView() {
        self.addSubviews(billboardViewNewHabitView)
        NSLayoutConstraint.activate([
            billboardViewNewHabitView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            billboardViewNewHabitView.heightAnchor.constraint(equalToConstant: 180),
            billboardViewNewHabitView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            billboardViewNewHabitView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }

    private func configureAddHabbitButton() {
        self.addSubviews(completedHabbitButton)
        NSLayoutConstraint.activate([
            completedHabbitButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            completedHabbitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            completedHabbitButton.widthAnchor.constraint(equalToConstant: 60),
            completedHabbitButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    private func configureHabitPlusButton() {
        self.addSubviews(habitPlusButton)
        NSLayoutConstraint.activate([
            habitPlusButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            habitPlusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
}

//MARK: - Animation Button
extension NewHabitView {
    private func startShadowPulseAnumation() {
        completedHabbitButton.layer.shadowColor = UIColor.backgroundOrangeButton.cgColor
        completedHabbitButton.layer.shadowOffset = .zero
        completedHabbitButton.layer.shadowOpacity = 0.7
        
        let animation = CABasicAnimation(keyPath: "shadowComplete")
        animation.fromValue = 20
        animation.toValue = 30
        animation.duration = 1.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        completedHabbitButton.layer.add(animation, forKey: "shadowComplete")
    }
}
