// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:aceh_food/dto/books.dart';
// import 'package:aceh_food/services/db_helper.dart';

// class BooksScreen extends StatefulWidget {
//   const BooksScreen({Key? key}) : super(key: key);

//   @override
//   _BooksScreenState createState() => _BooksScreenState();
// }

// class _BooksScreenState extends State<BooksScreen> {
//   final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
//   late Future<List<Books>>? books;
//   late String _title;
//   bool isUpdate = false;
//   int? bookIdForUpdate;
//   late DBHelper dbHelper;
//   final _bookTitleController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     dbHelper = DBHelper();
//     refreshBookLists();
//   }

//   @override
//   void dispose() {
//     _bookTitleController.dispose();
//     super.dispose();
//   }

//   void cancelTextEditing() {
//     _bookTitleController.text = '';
//     setState(() {
//       isUpdate = false;
//       bookIdForUpdate = null;
//     });
//     closeKeyboard();
//   }

//   void closeKeyboard() {
//     FocusManager.instance.primaryFocus?.unfocus();
//   }

//   Future<void> refreshBookLists() async {
//     await dbHelper.initDatabase();
//     setState(() {
//       books = dbHelper.getBooks();
//       isUpdate = false;
//     });
//   }

//   void createOrUpdateBooks() {
//     _formStateKey.currentState?.save();
//     if (!isUpdate) {
//       dbHelper.add(Books(null, _title));
//     } else {
//       dbHelper.update(Books(bookIdForUpdate, _title));
//     }
//     _bookTitleController.text = '';
//     refreshBookLists();
//   }

//   void editFormBook(BuildContext context, Books book) {
//     setState(() {
//       isUpdate = true;
//       bookIdForUpdate = book.id;
//     });
//     _bookTitleController.text = book.title;
//   }

//   void deleteBook(BuildContext context, int bookID) {
//     dbHelper.delete(bookID);
//     refreshBookLists();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var textFormField = TextFormField(
//       onSaved: (value) {
//         _title = value!;
//       },
//       autofocus: false,
//       controller: _bookTitleController,
//       decoration: InputDecoration(
//         focusedBorder: UnderlineInputBorder(
//           borderSide: BorderSide(
//             color: !isUpdate ? Colors.purple : Colors.blue,
//             width: 2,
//             style: BorderStyle.solid,
//           ),
//         ),
//         labelText: !isUpdate ? 'Add Book Title' : 'Edit Book Title',
//         icon: Icon(
//           Icons.book,
//           color: !isUpdate ? Colors.purple : Colors.blue,
//         ),
//         labelStyle: TextStyle(
//           color: !isUpdate ? Colors.purple : Colors.blue,
//         ),
//       ),
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(!isUpdate ? 'Add Book' : 'Edit Book'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Form(
//               key: _formStateKey,
//               child: textFormField,
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     createOrUpdateBooks();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: !isUpdate ? Colors.purple : Colors.blue,
//                     foregroundColor: Colors.white,
//                   ),
//                   child: Text(!isUpdate ? 'Save' : 'Update'),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     cancelTextEditing();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     foregroundColor: Colors.white,
//                   ),
//                   child: Text('Cancel'),
//                 ),
//               ],
//             ),
//             Divider(),
//             Expanded(
//               child: FutureBuilder<List<Books>>(
//                 future: books,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (snapshot.hasData) {
//                     return generateList(snapshot.data!);
//                   } else {
//                     return Center(child: Text('No Data'));
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget generateList(List<Books> books) {
//     return ListView.builder(
//       itemCount: books.length,
//       itemBuilder: (context, index) => Slidable(
//         key: ValueKey(index),
//         endActionPane: () {}(), // Add actionPane here
//         actions: [
//           IconSlideAction(
//             caption: 'Edit',
//             color: Colors.blue,
//             icon: Icons.edit,
//             onTap: () => editFormBook(context, books[index]),
//           ),
//         ],
//         secondaryActions: [
//           IconSlideAction(
//             caption: 'Delete',
//             color: Colors.red,
//             icon: Icons.delete,
//             onTap: () => deleteBook(context, books[index].id!),
//           ),
//         ],
//         child: ListTile(
//           title: Text(books[index].title),
//         ),
//       ),
//     );
//   }
// }