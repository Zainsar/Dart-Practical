import 'dart:io';

void main() {
  List<String> names = ["Zain", "Sarfraz", "Tayyaba", "Talha", "Ali", "Waqar"];

  while (true) {
    print("1. Add new task");
    print("2. View all tasks");
    print("3. Update task");
    print("4. Delete task");
    print("5. Exit");
    print("Choose an option:");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addTask(names);
        break;
      case '2':
        viewnames(names);
        break;
      case '3':
        updateTask(names);
        break;
      case '4':
        deleteTask(names);
        break;
      case '5':
        print('Exiting...');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void addTask(List<String> names) {
  stdout.write('Enter task: ');

  String? name = stdin.readLineSync();

  if (name != null && names.isNotEmpty) {
    names.add(name);

    print('Task added: $name');
  } else {
    print('Task cannot be empty.');
  }
}

void viewnames(List<String> names) {
  if (names.isEmpty) {
    print('No names available.');
  } else {
    print('Names');

    for (int i = 0; i < names.length; i++) {
      print('${i + 1}. ${names[i]}');
    }
  }
}

void updateTask(List<String> names) {
  viewnames(names);

  stdout.write('Enter task number to update: ');

  String? input = stdin.readLineSync();

  int? takeindex = int.tryParse(input ?? '');

  if (takeindex != null && takeindex > 0 && takeindex <= names.length) {
    stdout.write('Enter new task: ');

    String? newTask = stdin.readLineSync();

    if (newTask != null && newTask.isNotEmpty) {
      names[takeindex - 1] = newTask;

      print('Task updated to: $newTask');
    } else {
      print('Task cannot be empty.');
    }
  } else {
    print('Invalid task number.');
  }
}

void deleteTask(List<String> names) {
  viewnames(names);

  stdout.write('Enter task number to delete: ');

  String? inputtaking = stdin.readLineSync();

  int? index = int.tryParse(inputtaking ?? '');

  if (index != null && index > 0 && index <= names.length) {
    String removedTask = names.removeAt(index - 1);

    print('Task deleted: $removedTask');
  } else {
    print('Invalid task number.');
  }
}
