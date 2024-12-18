import UIKit

final class NewHabitView: UIView {
    
    private let billboardViewNewHabitView: BillboardViewNewHabitView
    private let switchView: SwitchView
    public let habitFrequencyView: HabitFrequencyView
    public let reminderView: ReminderPresentView
    
    private let habitFrequencyViewModel: HabitFrequencyModel
    
    public let backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(AssetImages.backarray.image, for: .normal)
        backButton.backgroundColor = UIColor.beigeColor
        backButton.layer.cornerRadius = 22
        return backButton
    }()
    
    private lazy var habitEntryStackView: UIStackView = {
        habitEntryStackView = UIStackView(arrangedSubviews: [habitNameTextField,
                                                             addHabbitButton])
        habitEntryStackView.distribution = .fillProportionally
        habitEntryStackView.spacing = 12
        habitEntryStackView.axis = .horizontal
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
        addHabbitButton.backgroundColor = UIColor.orangeColor
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
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGrayColor]
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
    
    init(frame: CGRect, habitFrequencyViewModel: HabitFrequencyModel) {
        self.habitFrequencyViewModel = habitFrequencyViewModel
        self.billboardViewNewHabitView = BillboardViewNewHabitView()
        self.switchView = SwitchView()
        self.habitFrequencyView = HabitFrequencyView(frame: .zero, viewModel: habitFrequencyViewModel)
        self.reminderView = ReminderPresentView()
        super.init(frame: frame)
        startShadowPulseAnumation()
        configureNewHabitView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureNewHabitView() {
        congifureBackgroundImage()
        configureAddHabbitButton()
        configureBillboardViewNewHabitView()
        configureHabitEntryStackView()
        confugureViewsStuckView()
        configureHabitPlusButton()
        configureBackButton()
        configureBackgroundColor()
    }
}

//MARK: - Setup UI
extension NewHabitView {
    private func congifureBackgroundImage() {
        self.addSubviews(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
    private func configureBackgroundColor() {
        self.backgroundColor = UIColor.lightBeigeColor
    }
    private func configureHabitEntryStackView() {
       
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
        viewsStuckView = UIStackView(arrangedSubviews: [habitFrequencyView,
                                                        reminderView,
                                                        switchView,
                                                       ])
        viewsStuckView.distribution = .fill
        viewsStuckView.spacing = 10
        viewsStuckView.axis = .vertical
        self.addSubviews(viewsStuckView)
        NSLayoutConstraint.activate([
            viewsStuckView.topAnchor.constraint(equalTo: habitEntryStackView.bottomAnchor, constant: 15),
            viewsStuckView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            viewsStuckView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
        ])
        NSLayoutConstraint.activate([
            habitFrequencyView.heightAnchor.constraint(equalToConstant: 135)
        ])
        NSLayoutConstraint.activate([
            reminderView.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            switchView.heightAnchor.constraint(equalToConstant: 50)
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
    private func configureBackButton() {
        self.addSubviews(backButton)
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

//MARK: - Animation Button
extension NewHabitView {
    private func startShadowPulseAnumation() {
        completedHabbitButton.layer.shadowColor = UIColor.orangeColor.cgColor
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
