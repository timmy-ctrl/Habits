import UIKit

final class HabitFrequencyView: UIView {
    
    private var habitFrequencyViewModel: HabitFrequencyModel
    private let habitFrequencyCollectionView: HabitFrequencyCollectionView
    
    private var lineView: UIView = {
        let lineView = UIView()
        lineView.layer.backgroundColor = UIColor.lightYellowColor.cgColor
        return lineView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Habit Frequency"
        label.middleFont()
        label.textColor = UIColor.lilacColor
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom >"
        label.middleFont()
        label.textColor = UIColor.lightOrangeColor
        return label
    }()
    
    private var habitFrequencyStackView: UIStackView = {
        let reminderStackView = UIStackView()
        return reminderStackView
    }()
    
    init(frame: CGRect, viewModel: HabitFrequencyModel) {
        self.habitFrequencyViewModel = viewModel
        self.habitFrequencyCollectionView = HabitFrequencyCollectionView()
        super.init(frame: frame)
        setupDelegatesCollectionView()
        configureHabitFrequencyView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDelegatesCollectionView() {
        habitFrequencyCollectionView.delegate = self
        habitFrequencyCollectionView.dataSource = self
    }
    
    private func configureHabitFrequencyView() {
        configureHabitFrequencyStackView()
        configureHabitFrequencyCollectionView()
        configureAppearanceHabitFrequencyView()
        configureLineView()
    }
}

//MARK: - Setup UI
extension HabitFrequencyView {
    private func configureLineView() {
        self.addSubviews(lineView)
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
    private func configureHabitFrequencyStackView() {
        habitFrequencyStackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        habitFrequencyStackView.axis = .horizontal
        habitFrequencyStackView.spacing = 16
        habitFrequencyStackView.addSubviews(titleLabel, descriptionLabel)
        self.addSubviews(habitFrequencyStackView)
        NSLayoutConstraint.activate([
            habitFrequencyStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            habitFrequencyStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            habitFrequencyStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
    }
    
    private func configureHabitFrequencyCollectionView() {
        self.addSubviews(habitFrequencyCollectionView)
        NSLayoutConstraint.activate([
            habitFrequencyCollectionView.topAnchor.constraint(equalTo: habitFrequencyStackView.bottomAnchor, constant: 20),
            habitFrequencyCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            habitFrequencyCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            habitFrequencyCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
    
    private func configureAppearanceHabitFrequencyView() {
        self.backgroundColor = UIColor.whiteColor
        self.layer.cornerRadius = 16
    }
}

//MARK: - UICollectionViewDataSource
extension HabitFrequencyView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        habitFrequencyViewModel.numberOfDays
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = habitFrequencyCollectionView.dequeueReusableCell(withReuseIdentifier: HabitFrequencyCell.identify, for: indexPath) as? HabitFrequencyCell else {
            fatalError()
        }
        let day = habitFrequencyViewModel.day(for: indexPath.row)
        let image = habitFrequencyViewModel.image(for: indexPath.row)
        cell.configureText(day: day)
        cell.configureImage(image: image)
        let isLastCell = indexPath.item == collectionView.numberOfItems(inSection: indexPath.section) - 1
        cell.configureLine(isLastCell: isLastCell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing: CGFloat = 2 * 2 + 17 * 2
        let itemWidth = (collectionView.bounds.width - totalSpacing) / 7
        return CGSize(width: itemWidth, height: itemWidth * 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
}
