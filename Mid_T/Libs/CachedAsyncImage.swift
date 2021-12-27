//
//  CachedAsyncImage.swift
//  Mid_T
//
//  Created by Pavle Mijatovic on 27.12.21..
//

import SwiftUI

public struct CachedAsyncImage<Content>: View where Content: View {
        
    public var body: some View {
        content(phase)
            .animation(transaction.animation, value: 0)
            .task(id: url) {
                await load(url: url)
            }
    }
    
    // MARK: - Inits
    init(url: URL?, urlCache: URLCache = .shared,  scale: CGFloat = 1) where Content == Image {
        self.init(url: url, urlCache: urlCache, scale: scale) { phase in
            phase.image ?? Image(uiImage: .init())
        }
    }
        
    init<I, P>(url: URL?, urlCache: URLCache = .shared,  scale: CGFloat = 1, @ViewBuilder content: @escaping (Image) -> I, @ViewBuilder placeholder: @escaping () -> P) where Content == _ConditionalContent<I, P>, I : View, P : View {
        self.init(url: url, urlCache: urlCache, scale: scale) { phase in
            if let image = phase.image {
                content(image)
            } else {
                placeholder()
            }
        }
    }
    
    init(url: URL?, urlCache: URLCache = .shared, scale: CGFloat = 1, transaction: Transaction = Transaction(), @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = urlCache
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        self.url = url
        self.urlSession =  URLSession(configuration: configuration)
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    // MARK: - Helper
    private func load(url: URL?) async {
        do {
            guard let url = url else { return }
            let request = URLRequest(url: url)
            let (data, _) = try await urlSession.data(for: request)

            if let uiImage = UIImage(data: data) {
                let image = Image(uiImage: uiImage)
                phase = .success(image)
            } else {
                throw AsyncImage<Content>.LoadingError()
            }
        } catch {
            phase = .failure(error)
        }
    }
    
    // MARK: - Properties
    @State private var phase: AsyncImagePhase = .empty

    private let url: URL?
    private let urlSession: URLSession
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
}

private extension AsyncImage {
    struct LoadingError: Error { }
}
