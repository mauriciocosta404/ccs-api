/*
  Warnings:

  - You are about to drop the column `nome` on the `Ministerio` table. All the data in the column will be lost.
  - You are about to drop the column `nome` on the `User` table. All the data in the column will be lost.
  - Added the required column `name` to the `Ministerio` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Ministerio" DROP COLUMN "nome",
ADD COLUMN     "name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Perfil" ADD COLUMN     "address" TEXT,
ADD COLUMN     "facebook" TEXT,
ADD COLUMN     "instagram" TEXT,
ADD COLUMN     "phone" TEXT,
ADD COLUMN     "whatsapp" TEXT;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "nome",
ADD COLUMN     "name" TEXT NOT NULL;
