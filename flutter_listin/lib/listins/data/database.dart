import "package:drift/drift.dart";

part "database.g.dart";

class ListinTable extends Table{
  IntColumn get id => integer().named('id').autoIncrement()();
  TextColumn get name => text().named('name').withLength(min:4,max:30)();
  TextColumn get obs => text().named('obs')();
  DateTimeColumn get dateCreate => dateTime().named('dateCreate')();
  DateTimeColumn get dateUpdate => dateTime().named('dateUpdate')();
}

@DriftDatabase(tables:[ListinTable])
class AppDatabase extends _$AppDatabase{
  AppDatabase(super.e);//sobreposições obrigatórias

  @override //sobreposições obrigatórias

   // considere aqui como se fosse um registro que ficasse no histórico, auditável,
   //int get schemaVersion => throw UnimplementedError();
   // devido a ser o primeir commit e colocado 1
   int get schemaVersion => 1;

}