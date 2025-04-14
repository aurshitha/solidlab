// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// array of structs
contract Library {
    struct Book {
        string title;
        string author;
    }

    Book[] public books;

    // add the books in library
    function addBook(string memory _title, string memory _author) {
        books.push(Book(_title, _author)); // Add a new book to the list
        // Book("The Great Wall", "Marthis Cure");
        // 1. Create a new Book struct with title and author.
        // 2.Push that book into the books array.
    }

    function getBook(uint index) public view returns(string memory, string memory) {
        Book memory b = books[index]; // Get the book at index and store it in a temporary variable
        return (b.title, b.author); // Return the book’s title and author
    }
}


// Why memory?
// memory means it’s temporary storage (used only during function execution).
// You’re not saving it on the blockchain again — just reading and using it for a moment.