import UIKit

final class AlarmView: UIView {
    
    private let timeManager: TimeManager
    private let times: [TimeModel]
    
    private var reminderCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AlarmViewCell.self, forCellWithReuseIdentifier: AlarmViewCell.identify)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private var reminderStuckView: UIStackView = {
        let reminderStuckView = UIStackView()
        return reminderStuckView
    }()
    
    private let addReminderButton: UIButton = {
        let addReminderButton = UIButton()
        addReminderButton.setTitle("Add Reminder", for: .normal)
        addReminderButton.backgroundColor = UIColor.orangeColor
        addReminderButton.setTitleColor(UIColor.lilacColor, for: .normal)
        addReminderButton.layer.cornerRadius = 10
        return addReminderButton
    }()
    
    private let offAlarmButton: UIButton = {
        let offAlarmButton = UIButton()
        offAlarmButton.setImage(AssetImages.alarmoff.image, for: .normal)
        offAlarmButton.layer.borderWidth = 1
        offAlarmButton.layer.borderColor = UIColor.lightGrayColor.cgColor
        offAlarmButton.layer.cornerRadius = 10
        return offAlarmButton
    }()
    
    override init(frame: CGRect) {
        self.timeManager = TimeManager()
        self.times = timeManager.generateTimes()
        super.init(frame: frame)
        congigureAlarmView()
    }
    
    private func congigureAlarmView() {
        configureReminderCollectionView()
        configureReminderStuckView()
        setupDelegatesCollectionView()
        congigureBackgroundColor()
    }
    
    private func setupDelegatesCollectionView() {
        reminderCollectionView.delegate = self
        reminderCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup UI
extension AlarmView {
    private func configureReminderCollectionView() {
        self.addSubviews(reminderCollectionView)
        NSLayoutConstraint.activate([
            reminderCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            reminderCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            reminderCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            reminderCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80),
        ])
    }
    private func congigureBackgroundColor() {
        self.backgroundColor = UIColor.whiteColor
    }
    private func configureReminderStuckView() {
        reminderStuckView = UIStackView(arrangedSubviews: [addReminderButton,
                                                           offAlarmButton])
        reminderStuckView.distribution = .fillProportionally
        reminderStuckView.spacing = 12
        reminderStuckView.axis = .horizontal
        self.addSubviews(reminderStuckView)
        NSLayoutConstraint.activate([
            reminderStuckView.topAnchor.constraint(equalTo: reminderCollectionView.bottomAnchor, constant: 2),
            reminderStuckView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            reminderStuckView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            reminderStuckView.heightAnchor.constraint(equalToConstant: 50),
        ])
        NSLayoutConstraint.activate([
            offAlarmButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension AlarmView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        times.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = reminderCollectionView.dequeueReusableCell(withReuseIdentifier: AlarmViewCell.identify, for: indexPath) as? AlarmViewCell else {
            fatalError()
        }
        let timeModel = times[indexPath.row]
        cell.configure(label: timeModel.timeString)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing: CGFloat = 10 * 2 + 5 * 2 
        let itemWidth = (collectionView.bounds.width - totalSpacing) / 3
        return CGSize(width: itemWidth, height: itemWidth * 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 5
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 5
       }
}
