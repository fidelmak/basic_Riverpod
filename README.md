# Learn Basic Riverpod for State Management

A new Flutter project.

## Getting Started


# 🌊 Basic Riverpod for State Management in Flutter

Riverpod is a powerful and modern state management solution for Flutter.
It’s **type-safe**, **testable**, and avoids many limitations of the old `Provider` package.

---

## 🧩 1. Installation

Add Riverpod to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_riverpod: ^2.5.0
````

Then, import it:

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
```

---

## 🏗️ 2. Wrap Your App with `ProviderScope`

Every Riverpod app needs a `ProviderScope` at the root — it stores all providers’ states.

```dart
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
```

---

## 🔹 3. Understanding Providers

Providers are how you **declare and share state** across your app.

---

### 🧮 Example 1: `Provider` (Read-only value)

Used for constants or computed values.

```dart
final nameProvider = Provider<String>((ref) => "Paul Fidelis");

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Text('Hello, $name');
  }
}
```

🟢 `ref.watch()` listens to the provider
🔹 Use when the value **does not change**

---

### 🔄 Example 2: `StateProvider` (Simple mutable state)

Used for simple values like counters, booleans, etc.

```dart
final counterProvider = StateProvider<int>((ref) => 0);

class CounterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Text('Count: $count', style: TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
```

🟢 `ref.watch()` — listens to state
🟡 `ref.read()` — reads or modifies state without listening

---

### ⚙️ Example 3: `StateNotifierProvider` (Complex state logic)

Used when you need **custom logic** (e.g., API, business rules, lists).

```dart
// 1️⃣ Create a Notifier class
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() => state++;
  void reset() => state = 0;
}

// 2️⃣ Create Provider
final counterNotifierProvider =
    StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

// 3️⃣ Use in Widget
class CounterNotifierScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterNotifierProvider);
    final notifier = ref.read(counterNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text('Counter Notifier')),
      body: Center(child: Text('Count: $count', style: TextStyle(fontSize: 24))),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: notifier.increment, child: Icon(Icons.add)),
          SizedBox(height: 10),
          FloatingActionButton(onPressed: notifier.reset, child: Icon(Icons.refresh)),
        ],
      ),
    );
  }
}
```

💡 `StateNotifierProvider` = **clean separation of UI and logic**

---

### 🌍 Example 4: `FutureProvider` (Async data from API)

Used for loading async data (e.g., from network or database).

```dart
final userProvider = FutureProvider<String>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return "User: Paul";
});

class UserScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);

    return userAsync.when(
      data: (user) => Center(child: Text(user)),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
```

---

### 🔁 Example 5: `StreamProvider` (Realtime data)

Used for Firebase streams, sockets, etc.

```dart
final timeProvider = StreamProvider<DateTime>((ref) async* {
  while (true) {
    await Future.delayed(Duration(seconds: 1));
    yield DateTime.now();
  }
});

class ClockScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeAsync = ref.watch(timeProvider);

    return timeAsync.when(
      data: (time) => Center(child: Text(time.toString())),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(child: Text('Error: $e')),
    );
  }
}
```

---

## 🧠 6. When to Use Each Provider

| Type                    | Use Case                 | Example         |
| ----------------------- | ------------------------ | --------------- |
| `Provider`              | Read-only value          | Theme, Config   |
| `StateProvider`         | Simple counter or toggle | Switch, counter |
| `StateNotifierProvider` | Complex state + logic    | Todos, Auth     |
| `FutureProvider`        | Async one-time fetch     | API call        |
| `StreamProvider`        | Realtime updates         | Firebase, Clock |

---

## 🧾 7. Tips

✅ Use `ConsumerWidget` for simplicity
✅ Use `ref.watch()` inside build methods
✅ Use `ref.read()` in callbacks or event handlers
✅ Keep logic in `StateNotifier`, not the UI

---

## 🎯 Example Folder Structure

```
lib/
 ┣ main.dart
 ┣ providers/
 ┃ ┗ counter_provider.dart
 ┣ screens/
 ┃ ┗ counter_screen.dart
 ┗ widgets/
```

---

## 🧩 Bonus: Refresher Summary

| Concept         | Description                  |
| --------------- | ---------------------------- |
| `ProviderScope` | Root container for providers |
| `WidgetRef`     | Used to access providers     |
| `ref.watch()`   | Listen and rebuild on change |
| `ref.read()`    | Read without listening       |
| `ref.refresh()` | Force reload a provider      |

---

**Riverpod = Simple + Scalable + Testable**
You can start small (`StateProvider`) and grow to advanced (`StateNotifierProvider`, async providers) easily.

---

✍️ **Next Step Ideas**

* Try replacing your `setState()` with `StateProvider`
* Create a todo list with `StateNotifierProvider`
* Fetch API data using `FutureProvider`

