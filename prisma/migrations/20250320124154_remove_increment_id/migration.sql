/*
  Warnings:

  - The primary key for the `Escala` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Membro` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Ministerio` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Perfil` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `_MembroToMinisterio` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "Escala" DROP CONSTRAINT "Escala_membroId_fkey";

-- DropForeignKey
ALTER TABLE "Perfil" DROP CONSTRAINT "Perfil_membroId_fkey";

-- DropForeignKey
ALTER TABLE "_MembroToMinisterio" DROP CONSTRAINT "_MembroToMinisterio_A_fkey";

-- DropForeignKey
ALTER TABLE "_MembroToMinisterio" DROP CONSTRAINT "_MembroToMinisterio_B_fkey";

-- AlterTable
ALTER TABLE "Escala" DROP CONSTRAINT "Escala_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "membroId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Escala_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Escala_id_seq";

-- AlterTable
ALTER TABLE "Membro" DROP CONSTRAINT "Membro_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Membro_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Membro_id_seq";

-- AlterTable
ALTER TABLE "Ministerio" DROP CONSTRAINT "Ministerio_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Ministerio_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Ministerio_id_seq";

-- AlterTable
ALTER TABLE "Perfil" DROP CONSTRAINT "Perfil_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "membroId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Perfil_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Perfil_id_seq";

-- AlterTable
ALTER TABLE "_MembroToMinisterio" DROP CONSTRAINT "_MembroToMinisterio_AB_pkey",
ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT,
ADD CONSTRAINT "_MembroToMinisterio_AB_pkey" PRIMARY KEY ("A", "B");

-- AddForeignKey
ALTER TABLE "Perfil" ADD CONSTRAINT "Perfil_membroId_fkey" FOREIGN KEY ("membroId") REFERENCES "Membro"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Escala" ADD CONSTRAINT "Escala_membroId_fkey" FOREIGN KEY ("membroId") REFERENCES "Membro"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MembroToMinisterio" ADD CONSTRAINT "_MembroToMinisterio_A_fkey" FOREIGN KEY ("A") REFERENCES "Membro"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MembroToMinisterio" ADD CONSTRAINT "_MembroToMinisterio_B_fkey" FOREIGN KEY ("B") REFERENCES "Ministerio"("id") ON DELETE CASCADE ON UPDATE CASCADE;
