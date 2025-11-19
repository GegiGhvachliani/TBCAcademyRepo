
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var divisor: UITextField!
    @IBOutlet weak var divider: UITextField!
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var divisorSwitcherDescription: UILabel!
    @IBOutlet weak var darkModeLabel: UILabel!
    
    
    @IBOutlet weak var darkModeSwitcher: UISwitch!
    @IBOutlet weak var remainderDivisionSwitcher: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        darkModeSwitcherOff()
    }

    @IBAction func calculate(_ sender: Any) {
        warningLabel.text = ""
        if let divisor = Double(divisor.text!), let divider = Double(divider.text!) {
            if !dividedBy0() {
                if remainderDivisionSwitcher.isOn {
                    var p = divisor / divider
                    result.text = String(rounded(&p))
                } else {
                    result.text = String(Int(divisor / divider))
                }
            } else {
                warningLabel.text = "0-ზე გაყოფა არ შეიძლება"
            }
        } else {
            warningLabel.text = "შეიუვანეთ რიცხვითი მნიშვნელობა"
        }
    }
    
    private func dividedBy0() -> Bool {
         Int(divider.text!) == 0
    }
    private func rounded(_ value: inout Double) -> Double {
        value = Double(Int(value * 100_000_000)) / 100_000_000
        return value
    }
    private func darkModeSwitcherOff() {
        darkModeSwitcher.isOn = false
    }
    @IBAction func switchDLmode(_ sender: Any) {
        if darkModeSwitcher.isOn {
            view.backgroundColor = .black
            result.backgroundColor = .darkGray
            divisor.backgroundColor = .lightGray
            divider.backgroundColor = .lightGray
            divisorSwitcherDescription.textColor = .white
            darkModeLabel.textColor = .white
        } else {
            view.backgroundColor = .white
            result.backgroundColor = .systemGray5
            divisor.backgroundColor = .white
            divider.backgroundColor = .white
            divisorSwitcherDescription.textColor = .black
            darkModeLabel.textColor = .black
        }
    }
}



