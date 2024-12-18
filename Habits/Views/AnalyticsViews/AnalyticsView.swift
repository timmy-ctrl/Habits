import UIKit

final class AnalyticsView: UIView {
    
    private let habitView: HabitView
    private let habitFrequencyCollectionView: CalendarViewCollectionView
    
    public let backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(AssetImages.backarray.image, for: .normal)
        backButton.backgroundColor = UIColor.beigeColor
        backButton.layer.cornerRadius = 22
        return backButton
    }()
    
    override init(frame: CGRect) {
        self.habitView = HabitView()
        self.habitFrequencyCollectionView = CalendarViewCollectionView()
        super.init(frame: frame)
        configureAnalyticsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup UI
extension AnalyticsView {
    private func configureAnalyticsView() {
        congifureBackgroundColor()
        configureBackButton()
        configureHabitView()
        configureCalendarView()
    }
    private func congifureBackgroundColor() {
        self.backgroundColor = UIColor.lightBeigeColor
    }
    private func configureBackButton() {
        self.addSubviews(backButton)
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    private func configureHabitView() {
        self.addSubviews(habitView)
        NSLayoutConstraint.activate([
            habitView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25),
            habitView.heightAnchor.constraint(equalToConstant: 100),
            habitView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            habitView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    private func configureCalendarView() {
        self.addSubviews(habitFrequencyCollectionView)
        NSLayoutConstraint.activate([
            habitFrequencyCollectionView.topAnchor.constraint(equalTo: habitView.bottomAnchor, constant: 20),
            habitFrequencyCollectionView.heightAnchor.constraint(equalToConstant: 300),
            habitFrequencyCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            habitFrequencyCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
}
