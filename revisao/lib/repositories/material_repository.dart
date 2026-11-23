import '../models/material_evento.dart';
import '../services/database_service.dart';

class MaterialRepository {
  final DatabaseService service;
  MaterialRepository(this.service);
  Future<List<MaterialEvento>> listar() async {
    final db=await service.database;
    final rows=await db.query('materiais',orderBy:'nome COLLATE NOCASE');
    return rows.map((r)=>MaterialEvento.fromMap(r)).toList();
  }
  Future<bool> existeNome(String nome,{int? ignorarId}) async {
    final db=await service.database;
    final rows=await db.query('materiais',columns:['id'],where: ignorarId==null ? 'nome_normalizado = ?' : 'nome_normalizado = ? AND id != ?',whereArgs: ignorarId==null ? [nome.trim().toLowerCase()] : [nome.trim().toLowerCase(),ignorarId],limit:1);
    return rows.isNotEmpty;
  }
  Future<void> inserir(MaterialEvento material) async {final db=await service.database;await db.insert('materiais',material.toMap());}
  Future<void> atualizar(MaterialEvento material) async {if(material.id==null)throw ArgumentError('ID obrigatório para atualizar.');final db=await service.database;await db.update('materiais',material.toMap()..remove('id'),where:'id = ?',whereArgs:[material.id]);}
  Future<void> excluir(int id) async {final db=await service.database;await db.delete('materiais',where:'id = ?',whereArgs:[id]);}
}
