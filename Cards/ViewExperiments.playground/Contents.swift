//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    //выполняет операции по подготовке сцены к отображению
    override func loadView() {
        setupView()
    }
    // подготавливает представления, входящие в состав сцены
    private func setupView() {
        self.view = getRootView()
        let redView = getRedView()
        let greenView = getGreenView()
        let whiteView = getWhiteView()
        let pinkView = getPinkView()
        
        // поворот красного представления
        redView.transform = CGAffineTransform(rotationAngle: .pi/3)
        
        self.view.addSubview(pinkView)
        
        set(view: greenView, toCenterOfView: redView)
        // позиционируем белое представление с помощью свойства center
        whiteView.center = greenView.center
        
        self.view.addSubview(redView)
        redView.addSubview(greenView)
        redView.addSubview(whiteView)
    }
    
    //возвращает корневое представление сцены
    private func getRootView() -> UIView {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }
    
    //создание красного представления
    private func getRedView() -> UIView {
        let viewFrame = CGRect(x: 70, y: 70, width: 250, height: 250)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .red
        view.clipsToBounds = true
        return view
    }
    
    //создание зеленого представления
    private func getGreenView() -> UIView {
        let viewFrame = CGRect(x: 10, y: 10, width: 180, height: 180)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .systemGreen
        return view
    }
    
    //создание белого представления
    private func getWhiteView() -> UIView {
        let viewFrame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .white
        return view
    }
    //создание розового представления
    private func getPinkView() -> UIView {
        let viewFrame = CGRect(x: 50, y: 350, width: 100, height: 100)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .systemPink
        
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor.blue.cgColor
        view.layer.cornerRadius = 10
        view.layer.shadowOpacity = 0.95
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowRadius = 20
        view.layer.shadowOffset = CGSize(width: -5, height: -10)
        
        //создание слоя и добавление его к корневому слою розового представления
        let layer = CALayer()
        //изменение фонового цвета
        layer.backgroundColor = UIColor.black.cgColor
        //изменение размеров и положения
        layer.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        //изменение радиуса скругления углов
        layer.cornerRadius = 10
        //добавление в иерархию слоев
        view.layer.addSublayer(layer)
        
        return view
    }
    
     private func set(view moveView: UIView, toCenterOfView baseView: UIView) {
        /*
         //размеры вложенного представления
         let moveViewWidth = moveView.frame.width
         let moveViewHeight = moveView.frame.height
         
         //размеры родительского представления
         let baseViewWidth = baseView.bounds.width
         let baseViewHeight = baseView.bounds.height
         
         //вычисление и изменение координат
         let newXCoordinate = (baseViewWidth - moveViewWidth) / 2
         let newYCoordinate = (baseViewHeight - moveViewHeight) / 2
         
         moveView.frame.origin = CGPoint(x: newXCoordinate, y: newYCoordinate)
         */
         moveView.center = CGPoint(x: baseView.bounds.midX, y: baseView.bounds.midY)
    }
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
