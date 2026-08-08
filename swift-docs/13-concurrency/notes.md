# Concurrency

- **Asynchronous code** - Code that can be suspended and resumed later
  - Allows code to continue to make progress on short-term operations like updating the UI while continuing to work on long-running operations like fetching data over a network
- **Parallel code** - Different pieces of code that can run simultaneously
- <mark>Concurrency - A combination of parallel and async code</mark>
- **Data race** - When multiple pieces of code try to access some piece of shared mutable state

## Defining and Calling Async Functions

- Write the `async` keyword in the declaration after its parameters and before the return arrow
  - Tells the compiler that the operation can suspend its execution while waiting for the work to return
  - If a function is async and throws an error, `async` goes before `throws`
  - Example:

    ```swift
    func listPhotos(inGallery name: String) async -> [String] {
      // definition
    }

    func downloadPhoto(named photo: String) async -> Data {
      // definition
    }
    ```

- When calling an async method, write the `await` keyword in front of the call
  - Execution is suspended until that method completes

## Asynchronous Sequences

- `**for-await-in**` loop - iterates over async data over time
- Pauses at each iteration until the sequence reaches the next element
- Used when the values in a sequence arrive over time or require async to generate
- For custom types, make sure they conform to the `AsyncSequence` protocol
- Example:

  ```swift
  let handle = FileHandle.standardInput
  for try await line in handle.bytes.lines {
    print(line)
  }
  ```

  ## Tasks
