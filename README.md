# Amazon IVS Chat Messaging SPM

A Swift Package Manager compatible package for AWS Interactive Video Service (IVS) Chat Messaging SDK that provides native iOS chat functionality.

## Features

### 💬 Chat Messaging
- **Real-time messaging** - Instant chat for live streams
- **Native iOS implementation** - Optimized for iOS performance
- **XCFramework support** - Universal binary for all iOS architectures
- **Swift Package Manager** - Easy integration with SPM
- **AWS IVS integration** - Seamless connection with IVS streams

### 🔧 Framework Features
- **Universal binary** - Supports all iOS device architectures
- **Modular design** - Clean separation of chat functionality
- **Thread-safe operations** - Reliable concurrent message handling
- **Memory efficient** - Optimized resource usage

## Installation

### Swift Package Manager

Add this to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/ileonix/AmazonIVSChatMessaging-SPM.git", from: "1.0.1")
]
```

### Xcode Integration

1. Open your Xcode project
2. Go to **File > Add Package Dependencies**
3. Enter the repository URL: `https://github.com/ileonix/AmazonIVSChatMessaging-SPM.git`
4. Select version `1.0.1` or later

### Backend API Setup

This framework works with the AWS IVS Real-time Serverless Demo API for chat token management:

1. **Deploy the serverless backend:**
```bash
git clone https://github.com/ileonix/custom-aws-ivs-real-time-serverless-demo.git
cd custom-aws-ivs-real-time-serverless-demo
# Follow deployment instructions in the repository
```

2. **Configure API endpoints in your iOS app:**
```swift
let apiBaseURL = "https://your-api-gateway-url.amazonaws.com"
```

## Usage

### Import Framework

```swift
import AmazonIVSChatMessaging
```

### Initialize Chat Client

```swift
// Create chat configuration
let config = ChatConfiguration()

// Initialize chat client
let chatClient = ChatClient(configuration: config)
```

### Connect to Chat Room

```swift
// Connect to chat room
chatClient.connect(token: "your-chat-token") { result in
    switch result {
    case .success:
        print("Connected to chat")
    case .failure(let error):
        print("Connection failed: \(error)")
    }
}
```

### Send Messages

```swift
// Send a message
chatClient.sendMessage("Hello, world!") { result in
    switch result {
    case .success(let message):
        print("Message sent: \(message.content)")
    case .failure(let error):
        print("Failed to send: \(error)")
    }
}
```

### Receive Messages

```swift
// Listen for incoming messages
chatClient.onMessageReceived = { message in
    print("New message: \(message.content) from \(message.sender)")
}
```

## Platform Support

| Platform | Chat Messaging | XCFramework |
|----------|----------------|-------------|
| iOS      | ✅             | ✅          |
| macOS    | ❌             | ❌          |

## Requirements

- **iOS**: iOS 12.0+
- **Xcode**: 12.0+
- **Swift**: 5.3+

## Backend API

- [`custom-aws-ivs-real-time-serverless-demo`](https://github.com/ileonix/custom-aws-ivs-real-time-serverless-demo) - Required serverless API for chat token generation and management

### API Endpoints for Chat Messaging

| Endpoint | Method | Purpose | Request Body | Response |
|----------|--------|---------|--------------|----------|
| `/chat/token` | POST | Generate chat room token | `{"userId": "string", "roomId": "string", "capabilities": []}` | `{"token": "string", "sessionExpirationTime": "string"}` |
| `/chat/room/create` | POST | Create chat room | `{"name": "string", "maximumMessageRatePerSecond": 10}` | `{"arn": "string", "id": "string", "name": "string"}` |
| `/chat/room/list` | GET | List chat rooms | - | `{"rooms": [{"arn": "string", "name": "string"}]}` |
| `/chat/room/delete` | DELETE | Delete chat room | `{"identifier": "string"}` | `{"success": true}` |
| `/chat/message/delete` | DELETE | Delete message | `{"roomId": "string", "messageId": "string"}` | `{"success": true}` |
| `/chat/user/disconnect` | POST | Disconnect user | `{"roomId": "string", "userId": "string", "reason": "string"}` | `{"success": true}` |

## Related Packages

- [`flutter_ivs`](../flutter_ivs) - Flutter plugin for AWS IVS video streaming
- [`flutter_ivs_chat`](../flutter_ivs_chat) - Flutter plugin that uses this framework

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
