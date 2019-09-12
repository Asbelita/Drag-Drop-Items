
import UIKit

enum statusDrag {
    case initial
    case add
    case adding
    case dragdrop
    case tasks
    case deletetask
}

class DragDropVC: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var closeListButton: UIButton!
    @IBOutlet weak var collectionContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var taskPopUP: UIView!
    
    @IBOutlet weak var photoImage: UIImageView!
    var imageView : UIImageView?
    var currentStatus : statusDrag = .initial
    
    var toolArray = [PinTask]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadTools()
    }
    
    func setup(){
        closeButton.setImage(UIImage(named: "ic_cancel"), for: .normal)
        deleteButton.setImage(UIImage(named: "ic_cancel"), for: .normal)
        doneButton.setImage(UIImage(named: "ic_done"), for: .normal)
        addTaskButton.setImage(UIImage(named: "ic_more"), for: .normal)
        closeListButton.setImage(UIImage(named: "ic_cancel"), for: .normal)
        configStatus(status: .initial)
    }
    
    func configStatus(status: statusDrag){
        currentStatus = status
        switch currentStatus {
        case .initial:
            closeButton.isEnabled = true
            closeButton.isHidden = false
            doneButton.isEnabled = true
            doneButton.isHidden = false
            addTaskButton.isEnabled = true
            addTaskButton.isHidden = false
            collectionView.isHidden = true
            collectionContainer.isHidden = true
            deleteButton.isHidden = true
            closeListButton.isHidden = true
            taskPopUP.isHidden = true
        case .add:
            closeListButton.isHidden = false
            closeListButton.isEnabled = true
            collectionView.isHidden = false
            collectionContainer.isHidden = false
            doneButton.isEnabled = false
            doneButton.alpha = 0.7
            doneButton.isHidden = false
            closeButton.isEnabled = false
            closeButton.alpha = 0.7
            closeButton.isHidden = false
            addTaskButton.isEnabled = false
            addTaskButton.isHidden = true
            deleteButton.isHidden = true
            taskPopUP.isHidden = true
        case .adding:
            closeButton.isEnabled = false
            closeButton.alpha = 0.7
            closeButton.isHidden = false
            addTaskButton.isEnabled = false
            addTaskButton.alpha = 0.7
            addTaskButton.isHidden = false
            doneButton.isEnabled = false
            doneButton.alpha = 0.7
            doneButton.isHidden = false
            collectionView.isHidden = true
            collectionContainer.isHidden = true
            closeListButton.isHidden = true
            deleteButton.isHidden = true
            taskPopUP.isHidden = false
        case .dragdrop :
            closeButton.isEnabled = false
            closeButton.alpha = 0.7
            closeButton.isHidden = false
            addTaskButton.isEnabled = false
            addTaskButton.alpha = 0.7
            addTaskButton.isHidden = false
            doneButton.isEnabled = false
            doneButton.alpha = 0.7
            doneButton.isHidden = false
            collectionView.isHidden = true
            collectionContainer.isHidden = true
            closeListButton.isHidden = true
            deleteButton.isHidden = true
            taskPopUP.isHidden = true
        case .tasks:
            closeButton.isEnabled = true
            closeButton.isHidden = false
            closeButton.alpha = 1
            addTaskButton.isEnabled = true
            addTaskButton.isHidden = false
            addTaskButton.alpha = 1
            doneButton.isEnabled = true
            doneButton.isHidden = false
            doneButton.alpha = 1
            collectionView.isHidden = true
            collectionContainer.isHidden = true
            closeListButton.isHidden = true
            deleteButton.isHidden = true
            taskPopUP.isHidden = true
        case .deletetask:
            closeButton.isEnabled = false
            closeButton.alpha = 0.7
            closeButton.isHidden = false
            addTaskButton.isEnabled = false
            addTaskButton.alpha = 0.7
            addTaskButton.isHidden = false
            doneButton.isEnabled = false
            doneButton.alpha = 0.7
            doneButton.isHidden = false
            collectionView.isHidden = true
            collectionContainer.isHidden = true
            closeListButton.isHidden = true
            deleteButton.isHidden = true
            taskPopUP.isHidden = true
        }
    }
    @IBAction func onCloseButton(_ sender: Any) {
        //dismiss VC
    }
    
    @IBAction func onDeleteTaskButton(_ sender: Any) {
        self.configStatus(status: .deletetask)
    }
    
    @IBAction func onDoneButton(_ sender: Any) {
        //SAVE AND DISMISS VC
    }
    
    @IBAction func onAddTaskButton(_ sender: Any) {
        self.configStatus(status: .add)
    }
    
    @IBAction func onCloseListButton(_ sender: Any) {
        self.configStatus(status: .tasks)
    }
    
    func loadTools(){
        for index in 1..<10 {
            let name = "tool_" +  String(index)
            let task = PinTask(id: index, task: name)
            toolArray += [task]
        }
    }
}
extension DragDropVC {
    @objc func draggedView(_ sender: UIPanGestureRecognizer){
        let translation = sender.translation(in: self.photoImage)
        if let myView = sender.view {
            myView.center = CGPoint(x: myView.center.x + translation.x, y: myView.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.photoImage)
        self.configStatus(status: .tasks)
    }
}

extension DragDropVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toolArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TaskCollectionCell", for: indexPath as IndexPath) as! TaskCollectionCell
        cell.setUp(name: toolArray[indexPath.row].task!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100.0, height: 100.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        configStatus(status: .dragdrop)
        imageView = UIImageView(image: UIImage(named: toolArray[indexPath.row].task!))
        self.photoImage.addSubview(imageView!)
        imageView!.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let centerPoint = self.view.center
        imageView!.center = centerPoint
        imageView!.isUserInteractionEnabled = true
        let  panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.draggedView(_:)))
        imageView!.addGestureRecognizer(panGesture)
    }
}


