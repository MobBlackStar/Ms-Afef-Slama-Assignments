// ============================================================================
// Module : Développement Mobile — 3e année E-Business
// Enseignante : Mme Afef SLAMA
// Binôme : Fedi & Ritej
// Chapitre 1 : Mini-projet guidé - Gestion de Produits (DartPad demo)
// ============================================================================

/// 🧠 FEYNMAN EXPLANATION — WHAT IS A CLASS?
/// Think of a Class like a "Cookie Cutter" and an Object as the "Cookie".
/// The cookie cutter dictates the shape: every cookie made with it has a name,
/// a price, and availability. But each cookie can have different toppings!
class Produit {
  // 1. Attributes (Properties)
  // Madame Slama emphasizes explicit typing here (String, double, bool)
  // rather than using 'var', because explicit types prevent accidental bugs in teams.
  String nom;
  double prix;
  bool disponible;

  // 2. Syntactic Sugar Constructor
  // TRICK: Instead of writing:
  // Produit(String nom, double prix, bool disponible) { this.nom = nom; ... }
  // Dart allows 'this.nom' right in the parameter list. It assigns incoming
  // arguments directly to fields before the constructor body even runs!
  Produit(this.nom, this.prix, this.disponible);
}

void main() {
  // 3. Typed Collections: List<Produit>
  // 🧠 FEYNMAN EXPLANATION — GENERICS <Produit>:
  // Think of a list like an egg carton. If you label it List<Produit>, Dart
  // will refuse to let you put an apple, an int, or a string in it. Only 'Produit' items!
  List<Produit> produits = [
    Produit('Ordinateur portable', 1700.00, true),
    Produit('Téléphone portable', 850.50, false),
    Produit('Clavier', 49.99, true),
    Produit('Souris', 25.00, true),
    Produit('Imprimante', 350.00, false),
  ];

  // 4. Classical For Loop: iterating using index
  // We go from 0 to length - 1
  for (int i = 0; i < produits.length; i++) {
    Produit p = produits[i];

    // 5. Condition: Filter only in-stock products
    // 🧠 FEYNMAN EXPLANATION:
    // 'p.disponible' is already a boolean (true/false).
    // You don't need 'if (p.disponible == true)'. Keep it clean and elegant.
    if (p.disponible) {
      // 6. String Interpolation & Number Formatting
      // TRICK 1: ${...} allows running expressions inside strings.
      // TRICK 2: .toStringAsFixed(2) forces 2 decimal places (e.g. 1700.00 dinars)
      print(
        'Produit disponible : ${p.nom} - Prix : ${p.prix.toStringAsFixed(2)} dinars',
      );
    }
  }
}