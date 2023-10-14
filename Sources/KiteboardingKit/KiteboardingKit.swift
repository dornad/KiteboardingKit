// The Swift Programming Language
// https://docs.swift.org/swift-book

struct KiteSize {
    let ideal: Double
    let minimum: Double
    let maximum: Double
}

struct BoardSize: Equatable {
    let length: Double
    let width: Double
    let area: Double
}

struct BoardOptions {
    let beginner: BoardSize
    let lightWind: BoardSize
    let normalWind: BoardSize
    let hardWind: BoardSize
}

enum KiteType {
    case learner
    case bow
}

struct WindSpeed {
    let ideal: Int?
    let minimum: Int
    let maximum: Int
}

struct CalculatorResult {
    let speed: WindSpeed
    let kiteSize: KiteSize
    let boardOptions: BoardOptions
}

struct TrainerResult {
    let speed: WindSpeed
    let board: BoardSize
}

typealias KiteboarderWeigth = Int

protocol KiteboardingCalculatorType {
    func calculate(weight: KiteboarderWeigth) -> CalculatorResult
    func calculateTrainer() -> TrainerResult
}

struct KiteboardingCalculator: KiteboardingCalculatorType {
    
    func calculateTrainer() -> TrainerResult {
        .init(speed: .init(ideal: 0, minimum: 0, maximum: 0),
              board: .init(length: 0, width: 0, area: 0))
    }
    
    func calculate(weight: KiteboarderWeigth) -> CalculatorResult {
        return .init(speed: .init(ideal: 0,
                                  minimum: 0,
                                  maximum: 0),
                     kiteSize: .init(ideal: 0.0, 
                                     minimum: 0.0,
                                     maximum: 0.0),
                     boardOptions: .init(beginner: .init(length: 0, width: 0, area: 0),
                                         lightWind: .init(length: 0, width: 0, area: 0),
                                         normalWind: .init(length: 0, width: 0, area: 0),
                                         hardWind: .init(length: 0, width: 0, area: 0)))
    }
}
