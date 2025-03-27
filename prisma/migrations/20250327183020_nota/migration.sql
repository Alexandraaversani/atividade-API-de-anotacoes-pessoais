/*
  Warnings:

  - You are about to drop the column `criadaEm` on the `tasks` table. All the data in the column will be lost.

*/
-- CreateTable
CREATE TABLE "notas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "titulo" TEXT NOT NULL,
    "conteudo" TEXT NOT NULL,
    "favorito" BOOLEAN NOT NULL DEFAULT false,
    "cor" TEXT,
    "criadaEM" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizadaEM" DATETIME NOT NULL
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_tasks" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "descricao" TEXT NOT NULL,
    "concluida" BOOLEAN NOT NULL DEFAULT false,
    "criadaEM" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_tasks" ("concluida", "descricao", "id") SELECT "concluida", "descricao", "id" FROM "tasks";
DROP TABLE "tasks";
ALTER TABLE "new_tasks" RENAME TO "tasks";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
