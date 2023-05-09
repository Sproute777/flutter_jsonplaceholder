// don't import moor_web.dart or moor_flutter/moor_flutter.dart in shared code
import 'package:drift/drift.dart';
import '../database_client.dart';
import 'tables/tables.dart';
import 'connect/connection.dart' as impl;

part 'database_client.g.dart';

@DriftDatabase(
  tables: [User, Address, Company, Todos, Albums, Posts, Photos, Comments],
  daos: const [UsersDao, TodosDao],
  // include: {'query.drift'}
  // queries: {
  //   '_resetCategory':
  //       'UPDATE todoEntries SET category = NULL WHERE category = ?',
  // },
)
class DatabaseClient extends _$DatabaseClient {
  DatabaseClient() : super(impl.connect());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.drop(user);
        await m.drop(address);
        await m.drop(todos);
        await m.drop(photos);
        await m.drop(albums);
        await m.drop(comments);
        await m.drop(posts);
        await m.drop(company);
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // await m.drop(todos);
      },
      beforeOpen: (details) async {
        if (details.wasCreated) {
          // Make sure that foreign keys are enabled
          await customStatement('PRAGMA foreign_keys = ON');

          // create default categories and entries

          // await into(todos).insert(TodosCompanion(
          //     title: const Value('A first todo entry'),
          //     description: Value('this is a dicription'),
          //     isCompleted: Value(false)));

          // await into(todos).insert(
          //   TodosCompanion(
          //       title: const Value('second todo'),
          //       description: Value('other description'),
          //       isCompleted: Value(false)),
          // );
        }
      },

      // beforeOpen: (details) async {
      //   if (details.wasCreated) {
      //     // await customStatement('PRAGMA foreign_keys = ON');

      //     final workId = await into(categories)
      //         .insert(const CategoriesCompanion(description: Value('Work')));
      //     // create default categories and entries

      //     await batch(
      //       (b) {
      //         b.insert(
      //             todoEntries,
      //             TodoEntriesCompanion.insert(
      //               content: 'безымянный туду',
      //               targetDate: Value(DateTime.now()),
      //             ));

      //         b.insert(
      //           todoEntries,
      //           TodoEntriesCompanion.insert(
      //             content: 'туду из группы work',
      //             category: Value(workId),
      //             targetDate: Value(
      //               DateTime.now().add(const Duration(days: 4)),
      //             ),
      //           ),
      //         );
      //       },

      //     );
      //   }
      // }
    );
  }
} /*-----------------------------------------------------------------------------*/
