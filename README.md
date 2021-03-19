# RESTClient

single commit as the task was done with no repo, pure code sent as zip

## What's used

- SwiftUI
- SwftUI lifecycle
- MVVM
- Dependency Injection (Resolver)
- Store
- URLSession
- Async image loading
- Cocoapods (Resolver)

### What it does

It's a simple CRUD app fetching and displaying a list of products from an API. It's all done in SwiftUI app lifecycle with builtin Combine support for basic reactive programming implementation. I used the Resolver pod for dependency injection of my Store instance - class managing all data being later processed by viewModels and displayed by SwiftUI Views.
