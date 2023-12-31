//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
        // создаем кривые на сцене
        createBezier(on: view)
    }
    
    private func createBezier(on view: UIView) {
        // создаем графический контекст (слой)
        // на нем будут рисоваться кривые
        let shapeLayer = CAShapeLayer()
        //добавляем слой в качестве дочернего к корневому слою корневого представления
        view.layer.addSublayer(shapeLayer)
        //изменение цвета линий
        shapeLayer.strokeColor = UIColor.gray.cgColor
        // изменение толщины линий
        shapeLayer.lineWidth = 5
        // определение фонового цвета
        shapeLayer.fillColor = UIColor.green.cgColor
        
        //если не должно быть фонового цвета:
//     1.   shapeLayer.fillColor = nil
        // или
//     2.   shapeLayer.fillColor = UIColor.clear.cgColor
        
        //закругление крайних точек
        shapeLayer.lineCap = .round
        
        //прерывистая линия
        shapeLayer.lineDashPattern = [3, 6]
        
        //указывает внутреннее смещение начала и конца линии
//        shapeLayer.strokeStart = 0.3
        
        //стиль оформления соединительных точек
        shapeLayer.lineJoin = .bevel
        
        //создание фигуры треугольник
        shapeLayer.path = getPath().cgPath
        
        //создание фигуры прямоугольник
        shapeLayer.path = getRect().cgPath
        
        //создание фигуры дуга
        shapeLayer.path = getArc().cgPath
        
        //создание фигуры круг
        shapeLayer.path = getCircle().cgPath
        
        //создание фигуры овал
        shapeLayer.path = getOval().cgPath
        
        //создание фигуры кривая
        shapeLayer.path = getCurve().cgPath
        
        //создание фигуры поварская шапка
        shapeLayer.path = getChefsHat().cgPath
    }
    
    private func getPath() -> UIBezierPath {
        // создается значение типа UIBezierPath, которое будет описывать путь фигуры
        let path = UIBezierPath()
        //устанавливается указатель
        path.move(to: CGPoint(x: 50, y: 50))
        //рисуется линия от указателя до внесенного параметра
        path.addLine(to: CGPoint(x: 150, y: 50))
        //вторая линия
        path.addLine(to: CGPoint(x: 150, y: 150))
        
        //создание второго треугольника
        path.move(to: CGPoint(x: 50, y: 70))
        path.addLine(to: CGPoint(x: 150, y: 170))
        path.addLine(to: CGPoint(x: 50, y: 170))
        
        //замыкает крайние точки (создается гипотенуза)
        path.close()
        
        return path
    }
    
    private func getRect() -> UIBezierPath {
        let rect = CGRect(x: 10, y: 10, width: 200, height: 100)
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.bottomRight, .bottomLeft],
                                cornerRadii: CGSize(width: 30, height: 0))
        
        return path
    }
    
    private func getArc() -> UIBezierPath {
        let centerPoint = CGPoint(x: 200, y: 200)
        let path = UIBezierPath(arcCenter: centerPoint,
                                radius: 150,
                                startAngle: .pi/5,
                                endAngle: .pi,
                                clockwise: true)
        return path
    }
    
    private func getCircle() -> UIBezierPath {
        let centerPoint = CGPoint(x: 200, y: 200)
        let path = UIBezierPath(arcCenter: centerPoint,
                                radius: 150,
                                startAngle: 0,
                                endAngle: .pi*2,
                                clockwise: true)
        return path
    }
    
    private func getOval() -> UIBezierPath {
        let rect = CGRect(x: 50, y: 50, width: 200, height: 100)
        let path = UIBezierPath(ovalIn: rect)
        return path
    }
    
    private func getCurve() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 10))
        path.addCurve(to: CGPoint(x: 200, y: 200),
                      controlPoint1: CGPoint(x: 200, y: 20),
                      controlPoint2: CGPoint(x: 20, y: 200))
        return path
    }
    
    private func getChefsHat() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 100, y: 100))
        path.addArc(withCenter: CGPoint(x: 150, y: 100),
                    radius: 50,
                    startAngle: .pi, endAngle: 0, clockwise: true)
        path.addLine(to: CGPoint(x: 220, y: 100))
        path.addArc(withCenter: CGPoint(x: 220, y: 150),
                    radius: 50,
                    startAngle: .pi*3/2, endAngle: .pi/2, clockwise: true)
        path.addLine(to: CGPoint(x: 200, y: 200))
        path.addLine(to: CGPoint(x: 200, y: 260))
        path.addLine(to: CGPoint(x: 100, y: 260))
        path.addLine(to: CGPoint(x: 100, y: 200))
        path.addLine(to: CGPoint(x: 80, y: 200))
        path.addArc(withCenter: CGPoint(x: 80, y: 150),
                    radius: 50,
                    startAngle: .pi/2, endAngle: .pi*3/2, clockwise: true)
        path.close()
        return path
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
