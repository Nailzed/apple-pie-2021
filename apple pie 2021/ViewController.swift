//
//  ViewController.swift
//  apple pie 2021
//
//  Created by Сергей Земсков on 08.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    //MARK: - Properties
    
    var currentGame: Game!
    let incorrectMovesAllowed = 7
    var listOfWords = [
        "Австралия",
        "Австрия",
        "Азербайджан",
        "Албания",
        "Англия",
        "Андорра",
        "Аргентина",
        "Армения",
        "Афганистан",
        "Белоруссия",
        "Бельгия",
        "Болгария",
        "Боливия",
        "Босния и Герцеговина",
        "Бразилия",
        "Бруней",
        "Буркина-Фасо",
        "Великобритания",
        "Венгрия",
        "Венесуэла",
        "Вьетнам",
        "Гаити",
        "Гана",
        "Гватемала",
        "Гвинея",
        "Германия",
        "Гибралтар",
        "Гондурас",
        "Гонконг",
        "Греция",
        "Грузия",
        "Дания",
        "Египет",
        "Зимбабве",
        "Израиль",
        "Индия",
        "Индонезия",
        "Иордания",
        "Ирак",
        "Иран",
        "Ирландия",
        "Исландия",
        "Испания",
        "Италия",
        "Йемен",
        "Кабо-Верде",
        "Казахстан",
        "Камбоджа",
        "Камерун",
        "Канада",
        "Катар",
        "Кения",
        "Киргизия",
        "Китай",
        "Колумбия",
        "Корея",
        "Коста-Рика",
        "Куба",
        "Кувейт",
        "Лаос",
        "Латвия",
        "Либерия",
        "Ливан",
        "Ливия",
        "Литва",
        "Лихтенштейн",
        "Люксембург",
        "Маврикий",
        "Мавритания",
        "Мадагаскар",
        "Малайзия",
        "Мали",
        "Мальдивы",
        "Мальта",
        "Марокко",
        "Мексика",
        "Мозамбик",
        "Молдавия",
        "Монако",
        "Монголия",
        "Намибия",
        "Непал",
        "Нигерия",
        "Нидерланды",
        "Никарагуа",
        "Новая Зеландия",
        "Норвегия",
        "ОАЭ",
        "Оман",
        "Пакистан",
        "Панама",
        "Папуа — Новая Гвинея",
        "Парагвай",
        "Перу",
        "Польша",
        "Португалия",
        "Пуэрто-Рико",
        "Кипр",
        "Россия",
        "Руанда",
        "Румыния",
        "Сальвадор",
        "Самоа",
        "Саудовская Аравия",
        "Северная Ирландия",
        "Северная Македония",
    ]
    var totalWins = 0
    var totalLosses = 0
    
    //MARK: - Methods
    func newRound () {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(words: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
    
    func updateUI(){
        let movesRemaining = currentGame.incorrectMovesRemaining
        let image = "Tree\(movesRemaining < 8 ? movesRemaining : 7)"
        treeImageView.image = UIImage(named: image)
        scoreLabel.text = "Выигрыши:\(totalWins), Проигрыши:\(totalLosses)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    
    
    //MARK: - IB Actions
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
    
}

