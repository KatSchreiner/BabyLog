//
//  ProfileService.swift
//  BabyLog
//
//  Created by Екатерина Шрайнер on 13.04.2026.
//
import CoreData

protocol BabyStorageProtocol {
    func saveProfile(name: String) async -> Result<Void, StorageError>
    func hasProfile() -> Bool
}

final class ProfileStore: BabyStorageProtocol {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.context = context
    }

    func saveProfile(name: String) async -> Result<Void, StorageError> {
        await context.perform {
            if self.hasProfile() {
                return .failure(.profileAlreadyExists)
            }

            let babyProfile = BabyProfile(context: self.context)
            babyProfile.idProfile = UUID()
            babyProfile.babyName = name

            do {
                try self.context.save()
                return .success(())
            } catch {
                print("❌ CoreData Error: \\(error)")
                return .failure(.saveFailed)
            }
        }
    }
    
    func hasProfile() -> Bool {
        let fetchRequest: NSFetchRequest<BabyProfile> = BabyProfile.fetchRequest()
        fetchRequest.fetchLimit = 1
        return (try? context.count(for: fetchRequest)) ?? 0 > 0
    }
}

enum StorageError: Error, LocalizedError {
    case profileAlreadyExists
    case saveFailed
    
    var errorDescription: String? {
        switch self {
        case .profileAlreadyExists:
            return "Профиль уже создан"
        case .saveFailed:
            return "Не удалось сохранить профиль"
        }
    }
}
