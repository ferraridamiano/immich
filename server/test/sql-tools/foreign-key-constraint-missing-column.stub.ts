import { Column, ConstraintType, DatabaseSchema, ForeignKeyConstraint, PrimaryColumn, Table } from 'src/sql-tools';

@Table()
export class Table1 {
  @PrimaryColumn({ type: 'uuid' })
  id!: string;
}

@Table()
@ForeignKeyConstraint({ columns: ['parentId2'], referenceTable: () => Table1 })
export class Table2 {
  @Column({ type: 'uuid' })
  parentId!: string;
}

export const description = 'should warn against missing column in foreign key constraint';
export const schema: DatabaseSchema = {
  databaseName: 'postgres',
  schemaName: 'public',
  functions: [],
  enums: [],
  extensions: [],
  parameters: [],
  overrides: [],
  tables: [
    {
      name: 'table1',
      columns: [
        {
          name: 'id',
          tableName: 'table1',
          type: 'uuid',
          nullable: false,
          isArray: false,
          primary: true,
          synchronize: true,
        },
      ],
      indexes: [],
      triggers: [],
      constraints: [
        {
          type: ConstraintType.PRIMARY_KEY,
          name: 'PK_b249cc64cf63b8a22557cdc8537',
          tableName: 'table1',
          columnNames: ['id'],
          synchronize: true,
        },
      ],
      synchronize: true,
    },
    {
      name: 'table2',
      columns: [
        {
          name: 'parentId',
          tableName: 'table2',
          type: 'uuid',
          nullable: false,
          isArray: false,
          primary: false,
          synchronize: true,
        },
      ],
      indexes: [],
      triggers: [],
      constraints: [],
      synchronize: true,
    },
  ],
  warnings: ['[@ForeignKeyConstraint.columns] Unable to find column (Table2.parentId2)'],
};
