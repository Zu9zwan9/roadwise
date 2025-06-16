class Validators {
  // Email validation
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
  
  // Password validation
  static bool isValidPassword(String password) {
    // At least 8 characters, 1 uppercase, 1 lowercase, 1 number
    return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d@$!%*?&]{8,}$')
        .hasMatch(password);
  }
  
  // Name validation
  static bool isValidName(String name) {
    return name.trim().length >= 2 && RegExp(r'^[a-zA-Z\s]+$').hasMatch(name);
  }
  
  // Username validation
  static bool isValidUsername(String username) {
    return username.length >= 3 && 
           RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username);
  }
  
  // Phone number validation
  static bool isValidPhoneNumber(String phone) {
    return RegExp(r'^\+?[\d\s\-\(\)]{10,}$').hasMatch(phone);
  }
  
  // Age validation
  static bool isValidAge(int age) {
    return age >= 13 && age <= 120;
  }
  
  // Required field validation
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }
  
  // Minimum length validation
  static bool hasMinLength(String value, int minLength) {
    return value.length >= minLength;
  }
  
  // Maximum length validation
  static bool hasMaxLength(String value, int maxLength) {
    return value.length <= maxLength;
  }
  
  // Numeric validation
  static bool isNumeric(String value) {
    return double.tryParse(value) != null;
  }
  
  // URL validation
  static bool isValidUrl(String url) {
    return Uri.tryParse(url)?.hasAbsolutePath ?? false;
  }
  
  // Date validation
  static bool isValidDate(String date) {
    try {
      DateTime.parse(date);
      return true;
    } catch (e) {
      return false;
    }
  }
  
  // Credit card validation (basic Luhn algorithm)
  static bool isValidCreditCard(String cardNumber) {
    cardNumber = cardNumber.replaceAll(RegExp(r'\s+'), '');
    
    if (cardNumber.length < 13 || cardNumber.length > 19) {
      return false;
    }
    
    int sum = 0;
    bool alternate = false;
    
    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cardNumber[i]);
      
      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit = (digit % 10) + 1;
        }
      }
      
      sum += digit;
      alternate = !alternate;
    }
    
    return sum % 10 == 0;
  }
  
  // Password strength calculation
  static PasswordStrength getPasswordStrength(String password) {
    int score = 0;
    
    if (password.length >= 8) score++;
    if (password.length >= 12) score++;
    if (RegExp(r'[a-z]').hasMatch(password)) score++;
    if (RegExp(r'[A-Z]').hasMatch(password)) score++;
    if (RegExp(r'\d').hasMatch(password)) score++;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) score++;
    
    if (score <= 2) return PasswordStrength.weak;
    if (score <= 4) return PasswordStrength.medium;
    return PasswordStrength.strong;
  }
}

enum PasswordStrength {
  weak,
  medium,
  strong,
}

// Validation error messages
class ValidationMessages {
  static const String emailRequired = 'Email is required';
  static const String emailInvalid = 'Please enter a valid email address';
  static const String passwordRequired = 'Password is required';
  static const String passwordTooShort = 'Password must be at least 8 characters';
  static const String passwordTooWeak = 'Password must contain uppercase, lowercase, and number';
  static const String nameRequired = 'Name is required';
  static const String nameInvalid = 'Please enter a valid name';
  static const String usernameRequired = 'Username is required';
  static const String usernameInvalid = 'Username must be at least 3 characters and contain only letters, numbers, and underscores';
  static const String phoneRequired = 'Phone number is required';
  static const String phoneInvalid = 'Please enter a valid phone number';
  static const String ageRequired = 'Age is required';
  static const String ageInvalid = 'Age must be between 13 and 120';
  static const String fieldRequired = 'This field is required';
  static const String urlInvalid = 'Please enter a valid URL';
  static const String dateInvalid = 'Please enter a valid date';
  static const String creditCardInvalid = 'Please enter a valid credit card number';
}

