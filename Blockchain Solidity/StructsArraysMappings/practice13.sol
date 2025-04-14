// 5. Library System
// 🔧 Covers:
// Structs, Mappings, Arrays

// 📝 Problem:
// Simulate a book lending system:
// addBook(string title)
// borrowBook(uint bookId)
// returnBook(uint bookId)
// getMyBooks() → shows borrowed books
// Use:
// Struct for Book (title, isBorrowed, borrower)
// Mapping uint => Book
// Track user's borrowed books in mapping(address => uint[])


// -------------------------------------------------------------------- //
// What the problem is:
// We are building a Library System where users can:
// 1. Add Books – add a book to the system (with just a title).
// 2. Borrow a Book – a user can borrow a book using its bookId.
// 3. Return a Book – the same user can return the borrowed book.
// 4. Get My Books – user can view the books they have borrowed.
// -------------------------------------------------------------------- //


// SPDX-License-Identifier: MIT
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LibrarySystem {
    struct Book {
        string title;
        bool isBorrowed;
        address borrower;
    }

    uint public nextBookId = 0;

    // Mapping from book ID to Book
    mapping(uint => Book) public books;

    // Mapping from user to list of book IDs they borrowed
    mapping(address => uint[]) public userBooks;

    // Add a book to the library
    function addBook(string memory _title) public {
        books[nextBookId] = Book(_title, false, address(0));
        nextBookId++;
    }

    // Borrow a book by ID
    function borrowBook(uint _bookId) public {
        Book storage b = books[_bookId];
        require(!b.isBorrowed, "Book already borrowed");
        b.isBorrowed = true;
        b.borrower = msg.sender;
        userBooks[msg.sender].push(_bookId);
    }

    // Return a book by ID
    function returnBook(uint _bookId) public {
        Book storage b = books[_bookId];
        require(b.isBorrowed, "Book not borrowed");
        require(b.borrower == msg.sender, "You didn't borrow this book");

        b.isBorrowed = false;
        b.borrower = address(0);
        // (Optional) You can remove book ID from user's array, or leave it.
    }

    // Get all book IDs borrowed by user
    function getMyBooks() public view returns (uint[] memory) {
        return userBooks[msg.sender];
    }
}
