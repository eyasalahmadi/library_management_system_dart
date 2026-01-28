import 'dart:io';

import 'book.dart';
void main() {
List<Book> library = [
Book('The Road', 'Cormac McCarthy', 2006),
Book('1984', 'George Orwell', 1949),
Book('The Alchemist', 'Paulo Coelho', 1988),
];
while (true) {
  try {
      Book.welcomePage();
      String? numberOp = stdin.readLineSync();
      if (numberOp == null || numberOp.isEmpty) {
        const String error10 = "wrong, try again";
        throw Exception(error10);
      }
      switch (numberOp) {
    case '1':
        Book.showLibrary(library);
        break;
    case '2':
        Book.addBookToLibrary(library);
        break;
    case '3':
    Book.editBookInLibrary(library);
        break;
    case '4':
    Book.deleteBookInLibrary(library);
        break;
    case '0':
    const String chao = "GoodBye";
    print(chao);
        return;
    default:
    const String error11 = "wrong choice, please pick the correct choice";
    print(error11);
}
  } catch (e) {
    print(e);
  }
}

  
}





