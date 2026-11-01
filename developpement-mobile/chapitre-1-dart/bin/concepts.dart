// ============================================================================
// Complementary Concepts from Chapter 1 Slides (OOP, Getters/Setters, Null Safety)
// Perfect for showing Madame Slama complete mastery of the lecture.
// ============================================================================

/// 1. INHERITANCE (L'Héritage) & ARROW FUNCTIONS (Slide 9 & 10)
/// Base Class
class Personne {
  String nom;
  int age;

  Personne(this.nom, this.age);

  // Arrow syntax `=>` replaces `{ return ...; }` for one-liner functions
  void sePresenter() => print("Je suis $nom, j'ai $age ans.");
}

/// Derived Class
/// 🧠 FEYNMAN EXPLANATION — INHERITANCE:
/// Etudiant is a specialized Personne. 'super(n, a)' passes the name and age
/// upstairs to the parent class (Personne) constructor.
class Etudiant extends Personne {
  String filiere;

  Etudiant(String n, int a, this.filiere) : super(n, a);
}

/// 2. ENCAPSULATION: PRIVATE ATTRIBUTES & GETTERS/SETTERS (Slide 11)
/// 🧠 FEYNMAN EXPLANATION — ENCAPSULATION:
/// An ATM doesn't let anyone touch the cash vault directly; you use the keypad.
/// In Dart, prefixing a name with an underscore '_' makes it private to its file.
/// Getters and Setters are the keypad protecting that variable.
class ProduitSecurise {
  String _nom = '';

  // Getter: Read access
  String get nom => _nom;

  // Setter: Guarded write access (business validation)
  set nom(String value) {
    if (value.length > 2) {
      _nom = value;
    } else {
      print("Erreur: Le nom doit avoir plus de 2 caractères !");
    }
  }
}

/// 3. ADVANCED FUNCTIONS: NAMED & OPTIONAL PARAMETERS (Slide 12)
/// Curly braces { } make parameters named.
/// 'String?' means it can be null.
/// 'int age = 18' is a default value if the caller doesn't provide one.
void afficherUtilisateur({String? nom, int age = 18}) {
  print("Nom : ${nom ?? 'Inconnu'}, Âge : $age");
}

void main() {
  print("=== 1. Test Inheritance ===");
  var etudiant = Etudiant("Fedi", 21, "E-Business");
  etudiant.sePresenter();

  print("\n=== 2. Test Getters & Setters ===");
  var p = ProduitSecurise();
  p.nom = "PC"; // Rejected by validation (< 3 chars)
  p.nom = "Écran"; // Accepted
  print("Nom validé : ${p.nom}");

  print("\n=== 3. Test Named Parameters & Null Safety ===");
  afficherUtilisateur(nom: "Ritej"); // Uses default age = 18
  afficherUtilisateur(age: 22); // Uses null fallback for nom

  print("\n=== 4. Null Safety Cheat Sheet (Slides 12-13) ===");
  String? nullableName = null;

  // Safe navigation (?.) : doesn't crash if nullableName is null, prints null
  print("Longueur sécurisée : ${nullableName?.length}");

  // Null assertion operator (!) : Forces Dart to treat it as non-null.
  // DANGER: If it IS null, it throws an uncaught error at runtime!
  // Slide 13 Quiz: print(nom!.length) causes the crash!
}