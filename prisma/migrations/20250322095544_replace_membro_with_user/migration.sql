/*
  Warnings:

  - You are about to drop the column `dirigente` on the `Escala` table. All the data in the column will be lost.
  - You are about to drop the column `membroId` on the `Escala` table. All the data in the column will be lost.
  - You are about to drop the column `pregador` on the `Escala` table. All the data in the column will be lost.
  - You are about to drop the column `membroId` on the `Perfil` table. All the data in the column will be lost.
  - You are about to drop the `Membro` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_MembroToMinisterio` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[userId]` on the table `Perfil` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `dirigenteId` to the `Escala` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pregadorId` to the `Escala` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `Perfil` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('MEMBRO_BAPTIZADO', 'MEMBRO_NAO_BAPTIZADO', 'LIDER', 'ADMIN');

-- DropForeignKey
ALTER TABLE "Escala" DROP CONSTRAINT "Escala_membroId_fkey";

-- DropForeignKey
ALTER TABLE "Perfil" DROP CONSTRAINT "Perfil_membroId_fkey";

-- DropForeignKey
ALTER TABLE "_MembroToMinisterio" DROP CONSTRAINT "_MembroToMinisterio_A_fkey";

-- DropForeignKey
ALTER TABLE "_MembroToMinisterio" DROP CONSTRAINT "_MembroToMinisterio_B_fkey";

-- DropIndex
DROP INDEX "Perfil_membroId_key";

-- AlterTable
ALTER TABLE "Escala" DROP COLUMN "dirigente",
DROP COLUMN "membroId",
DROP COLUMN "pregador",
ADD COLUMN     "dirigenteId" TEXT NOT NULL,
ADD COLUMN     "pregadorId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Perfil" DROP COLUMN "membroId",
ADD COLUMN     "userId" TEXT NOT NULL;

-- DropTable
DROP TABLE "Membro";

-- DropTable
DROP TABLE "_MembroToMinisterio";

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "role" "UserRole" NOT NULL DEFAULT 'MEMBRO_NAO_BAPTIZADO',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_MinisterioToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_MinisterioToUser_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "_MinisterioToUser_B_index" ON "_MinisterioToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "Perfil_userId_key" ON "Perfil"("userId");

-- AddForeignKey
ALTER TABLE "Perfil" ADD CONSTRAINT "Perfil_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Escala" ADD CONSTRAINT "Escala_pregadorId_fkey" FOREIGN KEY ("pregadorId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Escala" ADD CONSTRAINT "Escala_dirigenteId_fkey" FOREIGN KEY ("dirigenteId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MinisterioToUser" ADD CONSTRAINT "_MinisterioToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Ministerio"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MinisterioToUser" ADD CONSTRAINT "_MinisterioToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
