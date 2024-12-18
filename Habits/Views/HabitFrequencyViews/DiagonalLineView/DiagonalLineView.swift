import UIKit

final class DiagonalLineView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // Устанавливаем цвет линии
        context.setStrokeColor(UIColor.lightYellowColor.cgColor) // Цвет линии
        context.setLineWidth(2) // Толщина линии

        // Рисуем вертикальную линию посередине
        let xPosition = rect.width / 2 // Положение линии по оси X (центр)
        context.move(to: CGPoint(x: xPosition, y: 0)) // Начало линии (верх)
        context.addLine(to: CGPoint(x: xPosition, y: rect.height)) // Конец линии (низ)

        context.strokePath() // Рисуем линию
    }
}
