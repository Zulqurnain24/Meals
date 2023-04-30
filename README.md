# Meals # 
This is a demonstration of 'The Composable Architecture' also known TCA. 

# Explaination # 
TCA is a functional and composable architecture for building SwiftUI applications. It consists of several core concepts, including state, actions, reducers, and effects.

## Here is a diagram that shows how these concepts relate to each other: ##


<img width="399" alt="Screenshot 2023-04-30 at 9 25 22 PM" src="https://user-images.githubusercontent.com/6280238/235374724-ea9b5c87-67db-4756-a7e6-e1a6493b4537.png">


In TCA, the application state is a single source of truth that can be accessed by any view in the application. When the user interacts with the application, they trigger actions, which are then processed by the reducer.

The reducer is a pure function that takes the current state and an action as input, and returns a new state as output. It updates the state based on the action, and returns the updated state to the application.

In addition to the reducer, TCA also has an effects system that can be used to handle asynchronous operations. Effects are a way to represent side effects in a pure and testable way. They can be used to perform tasks such as making network requests or interacting with the file system.

## Here is a diagram that shows how effects work in TCA: ##


<img width="378" alt="Screenshot 2023-04-30 at 9 25 40 PM" src="https://user-images.githubusercontent.com/6280238/235374716-c99e3f21-3026-40a9-990d-f3a5efc27d39.png">


When an effect is triggered, it is processed by a closure that can return a publisher. The publisher represents the result of the effect, such as a network response.

The publisher can then be used to update the application state through another action, or to trigger another effect. This allows for a chain of effects that can be composed and tested independently of the view layer.

Overall, TCA provides a powerful and composable architecture for building SwiftUI applications. By separating concerns and using pure functions, TCA can make it easier to reason about and test the application's behavior.

## SPM used: ##
https://github.com/pointfreeco/swift-composable-architecture
