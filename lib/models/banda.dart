
class Banda {

  String id;
  String nombre;
  int votos;

  Banda({
    this.id,
    this.nombre,
    this.votos
  });


  factory Banda.fromMap(Map<String,dynamic>obj) => Banda(
    id: obj['id'],
    nombre: obj['nombre'],
    votos: obj['votos']
  );
}