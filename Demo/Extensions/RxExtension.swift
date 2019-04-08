import RxSwift

extension ConcurrentDispatchQueueScheduler {
    
    static var background: ConcurrentDispatchQueueScheduler {
        let queue = DispatchQueue(label: "com.demo.concurrent.queue", qos: .default, attributes: .concurrent)
        return ConcurrentDispatchQueueScheduler(queue: queue)
    }
}
