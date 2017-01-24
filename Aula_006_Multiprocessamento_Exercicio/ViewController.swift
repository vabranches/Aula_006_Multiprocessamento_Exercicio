
import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }

    //MARK: Actions
    @IBAction func iniciar(_ sender: UIButton) {
        
        if label1.text=="10" && label2.text=="10" && label3.text=="10" && label4.text=="10" {
            label1.text = ""
            label2.text = ""
            label3.text = ""
            label4.text = ""
        }
        
        DispatchQueue.global().async {
            if (self.label1.text?.isEmpty)! {
                self.executar(botao: self.label1)
            } else if (self.label2.text?.isEmpty)!{
                self.executar(botao: self.label2)
            } else if (self.label3.text?.isEmpty)!{
                self.executar(botao: self.label3)
            } else if (self.label4.text?.isEmpty)!{
                self.executar(botao: self.label4)
            }
        }
        

    }
    
    //MARK: Metodos Personalizados
    func executar(botao : UILabel){
        for cont in 1...10{
            DispatchQueue.main.async(execute: {
                botao.text = "\(cont)"
                botao.backgroundColor = self.corAleatoria()
            })
            Thread.sleep(forTimeInterval: 1.0)
        }
    }
    
    func numAleatorio () -> CGFloat{
        let num = CGFloat(arc4random_uniform(255))/256
        return num
    }
    
    func corAleatoria() -> UIColor{
        let cor = UIColor(red: numAleatorio(), green: numAleatorio(), blue: numAleatorio(), alpha: 1.0)
        return cor
    }

}

