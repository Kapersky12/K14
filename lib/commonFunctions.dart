// mettre la première lettre en magiscule
String capitalize(String s) {
  return s[0].toUpperCase() + s.substring(1);
}

// decides homme ou femme
String menOrWomen(gender) {
  String imageURL = "";
  if (gender == "male") {
    imageURL = "images/man.png";
  } else {
    imageURL = "images/women.png";
  }
  return imageURL;
}
