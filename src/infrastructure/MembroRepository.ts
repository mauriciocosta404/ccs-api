import { PrismaClient } from "@prisma/client";
import { randomUUID } from "crypto";
import { CadastrarMembroRequest } from "../core/entities/interfaces/CadastrarMembroRequest";

const prisma = new PrismaClient();

export class MembroRepository {
  async cadastrar(membro: CadastrarMembroRequest) {
    const id = randomUUID();
    
    return await prisma.membro.create({
      data: {
        id,
        nome: membro.nome,
        email: membro.email,
        senha: membro.senha,
      },
    });
  }

  async buscarPorId(id: string) {
    return await prisma.membro.findUnique({ where: { id } });
  }
}