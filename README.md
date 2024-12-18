# Flutter Book Reminder

**Book Favorite and Reminder Application**

---

## GIF Demo

<img src="https://github.com/Himera19/flutter_book_reminder/blob/master/app_preview.gif" height="450">
 
## Features

- **Book Favoriting**: Users can add their desired books to their favorites.
- **Book Filtering**: Users can search and find books easily.
- **Daily Reminders**: Users can set daily reminders for their books.
- **Local Storage**: Books fetched from the API are stored locally with Hive, allowing access without the need for an internet connection.
- **Favorite Books**: Books added to favorites are accessible offline and stored completely locally.
- **Theme Options**: The app offers two themes: dark and light.
- **Language Support**: The app supports both English and Turkish languages.
- **Unit Testing**: The app includes tests for the API query system to ensure reliability.

## Key Dependencies

- **Hive**: Stores book data and user preferences locally.
- **Provider**: Maintains app integrity and manages state.
- **Flutter Local Notification**: Provides notifications for reminders.
- **Flutter Localizations**: Supports both English and Turkish languages.
- **HTTP**: Sends API requests and processes the returned results.
- **Mockito**: Used for testing API queries.

---

## Usage

1. **API Access**: The app initially fetches book information from an API.
2. **Local Storage**: Fetched books are saved to Hive boxes, allowing offline access.
3. **Book Details**: Basic information of the selected book is displayed, and the user can add the book to their favorites.
4. **Favorites**: Users can view their favorite books locally.
5. **Reminders**: Daily reminders can be set, and they are saved locally.
6. **Theme and Language Selection**: Users can choose their preferred theme and language.
7. **Filtering**: Users can search for the book they are looking for.

---

## License

This project is licensed under the MIT License.
