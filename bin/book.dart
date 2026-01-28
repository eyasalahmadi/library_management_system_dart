import 'dart:io';

class Book {
  
String? title ; 
String? author ;
int? releaseYear ;

Book (this.title,this.author,this.releaseYear){
}

static welcomePage(){
  const String menu = 
  ('''

hello to my library, what do you want?
1 - show availble books
2 - add new book to library
3 - edit the details of an existing book
4 - delete book from library
0 - exit from system
please choose serve of list

''');
print(menu);
}

static showLibrary(List<Book> allBooks) {
  if (allBooks.isEmpty) {
    const String empty= "Library is empty";
    print(empty);
  }
  for (var i = 0; i < allBooks.length; i++) {
    print(allBooks[i]);
  }
}

static addBookToLibrary(List<Book> newbook){
  String? titleOfNewBook;
  while (true) {
    try { 
      const String question = "what is the name of the book?" ;
      print(question);
  titleOfNewBook = stdin.readLineSync();
  if (titleOfNewBook == null || titleOfNewBook.isEmpty) {
    const String error = "title of the book wrong";
  throw Exception(error);
  }
  break;
    } catch (e) {
      print(e);
    }
    
  }
  
  String? authorOfNewBook;
  while (true) {
    try { 
    const String question1 = "What is the name of the book's author?";
  print(question1);
  authorOfNewBook = stdin.readLineSync();
  if (authorOfNewBook == null || authorOfNewBook.isEmpty) {
    const String error1 = "author of the book wrong";
    throw Exception(error1);
  }
  if (authorOfNewBook.contains(RegExp(r'[0-9]'))) {
      const String errorNum = "Author name can not contain numbers";
      throw Exception(errorNum);
    }
  break;
    } catch (e) {
      print(e);
    }
    
  }
int? yearOfNewBook;
while (true) {
    try { 
      const String question2 = "What year was the book released?";
  print(question2);
  final String? input = stdin.readLineSync();
  yearOfNewBook = int.parse(input!);
  break;
    } catch (e) {
      const String error2 = 'Wrong input Please enter a number only for the year';
      print(error2);
    }
}
Book myNewBook = Book(titleOfNewBook, authorOfNewBook, yearOfNewBook);
newbook.add(myNewBook); 
const String success = "Book added";
print(success);
}

static editBookInLibrary(List<Book> editbook){

  if (editbook.isEmpty) {
    const String empty = "Library is empty" ;
    print(empty);
   return; 
  }

  while (true) {
  try { 
  
  for (var i = 0; i < editbook.length; i++) {
    print("${i + 1} \t ${editbook[i]}");
  }
const String choose = " Select the book number you want to edit ";
  print(choose);
 final String? input = stdin.readLineSync();
 final numOfBook = int.parse(input!);

  if (numOfBook < 1 || numOfBook > editbook.length) {
    const String wrongNum = "ًWrong number";
        print(wrongNum);
        continue;
      }
    const String editChoose = '''

What do you want to edit ?
1- Title
2- Author
3- ReleaseYear

   ''';
  print(editChoose);
   final int choiceEdit = int.parse(stdin.readLineSync()!);

  switch (choiceEdit) {
    case 1:

    while (true) {
    print("Enter the new title for: ${editbook[numOfBook - 1].title}"); 
  final String? newTitle = stdin.readLineSync();
    if (newTitle != null && newTitle.isNotEmpty) {
    editbook[numOfBook-1].title = newTitle ; 
    const String updatedTitle = "Title updated"; 
    print(updatedTitle); 
        break; 
       } 
       else { 
        const String error3 = "Title cannot be empty try again";
      print(error3);
    }
  }
      break;
      case 2:

  case 2:
 while (true) {
print("Enter the new author for: ${editbook[numOfBook - 1].author}");
    final String? newAuthor = stdin.readLineSync();

  if (newAuthor == null || newAuthor.isEmpty) {
    const String error4 = "Author can not be empty try again";
     print(error4);
    continue; 
    }

    if (newAuthor.contains(RegExp(r'[0-9]'))) {
      const String errorNum = "Author name can not contain numbers";
      print(errorNum);
      continue; 
    }

    editbook[numOfBook - 1].author = newAuthor;
    const String updatedAuthor = "Author updated";
    print(updatedAuthor);
    break;
  }
  break;
  case 3:
  while (true) {
    try {
      const String enterYear = "Enter the new year";
      print(enterYear); 
  final String? inputYear = stdin.readLineSync();
  final int newYear = int.parse(inputYear!);
    editbook[numOfBook-1].releaseYear = newYear ; 
    const String updatedYear =  "Year updated";
    print(updatedYear); 
        break; 
       
    } catch (e) {
      const String error5 = 'Wrong input Please enter a number only for the year';
      print(error5);
    }
  }
  break;
  default: 
  const String error6 = "Wrong choice pick only 1, 2, or 3";
      print(error6);
      continue;
  }
  
  break;
  } 
  catch (e) {
    const String error7 = "Wrong input Please enter a number only for the book";
  print(error7);
  }
  }
}

  static deleteBookInLibrary (List<Book> deleteBook) {
if (deleteBook.isEmpty) {
  const String empty = "Library is empty";
    print(empty);
   return; 
  }
  while (true) {
  try { 
  for (var i = 0; i < deleteBook.length; i++) {
    print("${i + 1} \t ${deleteBook[i]}");
  }
  const String deleteChoice = " Select the book number you want to delete ";
  print(deleteChoice);
final String? input = stdin.readLineSync();
 final numOfBook = int.parse(input!);
  if (numOfBook < 1 || numOfBook > deleteBook.length) {
    const String error8 = "ًWrong number";
        print(error8);
        continue;
      }
      deleteBook.removeAt(numOfBook - 1);
      const String success = "Book deleted";
      print(success);
      break;
  } catch (e) {
    const String error9 = "Wrong input Please enter a number only for the book";
  print(error9);
  }
  }
  }
  @override
String toString(){
  return 'Title: $title, Author: $author, Year: $releaseYear';
}
}