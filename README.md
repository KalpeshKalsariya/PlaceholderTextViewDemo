# 📝 PlaceholderTextView

Replicate the placeholder functionality for a UITextView

PlaceholderTextView is a customizable UITextView subclass in Swift that adds built-in placeholder support, UI styling, and padding—just like UITextField. It can be easily configured via Interface Builder using @IBInspectable properties.

# ✨ Features
✅ Placeholder text (like UITextField)

✅ Customizable placeholder color

✅ TextView border color, width, and corner radius

✅ Padding support (top, left, bottom, right)

✅ Scroll indicator enabled by default

✅ Cursor tint color customization

✅ Font customization: set font family and size

✅ Fully @IBDesignable and @IBInspectable for live preview in Interface Builder

# 🛠️ How It Works
This class extends UITextView and adds a hidden UILabel that mimics placeholder functionality. When the text is empty, the placeholder label is visible; once typing begins, the label hides automatically.

It uses NotificationCenter to observe changes in the text and updates the placeholder accordingly.

🔧 Inspectable Properties
You can customize these properties directly in Interface Builder or via code:


Property	Type	Description
placeholder	String	Placeholder text shown when empty
placeholderColor	UIColor	Color of the placeholder label
borderColor	UIColor	Border color of the TextView
borderWidth	CGFloat	Border width
cornerRadius	CGFloat	Corner radius for rounded edges
cursorColor	UIColor	Color of the cursor inside the TextView
paddingTop	CGFloat	Top padding for text and placeholder
paddingLeft	CGFloat	Left padding for text and placeholder
paddingBottom	CGFloat	Bottom padding for text and placeholder
paddingRight	CGFloat	Right padding for text and placeholder
fontFamily	String	Font name to be applied
fontSize	CGFloat	Size of the font
textColor	UIColor	Main text color for user-entered content

# 📦 Usage
From Code
let textView = PlaceholderTextView()
textView.placeholder = "Enter your message..."
textView.placeholderColor = .lightGray
textView.borderColor = .gray
textView.borderWidth = 1
textView.cornerRadius = 10
textView.paddingTop = 12
textView.fontFamily = "AvenirNext-Regular"
textView.fontSize = 16
textView.textColor = .black


# From Interface Builder
Drag a UITextView into your storyboard or XIB.

Set its class to PlaceholderTextView.

Configure placeholder, padding, font, and styling using the Attributes Inspector.

# 🧼 Cleanup
The class removes its observer from NotificationCenter on deinit to avoid memory leaks.

# 📸 Screenshot
![Simulator Screenshot - iPhone 16 Pro - 2025-04-19 at 17 19 30](https://github.com/user-attachments/assets/5f8a299a-c77b-437f-8a2a-61fc6aa2104c)
![Simulator Screenshot - iPhone 16 Pro - 2025-04-19 at 17 19 23](https://github.com/user-attachments/assets/969a76e3-029f-4c54-9cb9-d31144410ac3)



# 🧠 Author
Kalpesh, 2025
Feel free to contribute, fork, or suggest improvements!
