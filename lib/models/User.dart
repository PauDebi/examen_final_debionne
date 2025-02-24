import 'dart:convert';

class User {
    int id;
    String nom;
    String descripcio;
    String foto;
    String asignaturaPreferida;
    String notaPromedio;

    User({
        required this.id,
        required this.nom,
        required this.descripcio,
        required this.foto,
        required this.asignaturaPreferida,
        required this.notaPromedio,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        nom: json["nom"],
        descripcio: json["descripcio"],
        foto: json["foto"],
        asignaturaPreferida: json["asignatura_preferida"],
        notaPromedio: json["nota_promedio"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "descripcio": descripcio,
        "foto": foto,
        "asignatura_preferida": asignaturaPreferida,
        "nota_promedio": notaPromedio,
    };
}
