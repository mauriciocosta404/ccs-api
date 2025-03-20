import { FastifyRequest, FastifyReply } from "fastify";
import { MembroRepository } from "../../infrastructure/MembroRepository";
import { CadastrarMembro } from "../../core/usecases/CadastrarMembro";
import { CadastrarMembroRequest } from "../../core/entities/interfaces/CadastrarMembroRequest";

export class MembroController {
  async cadastrar(
    request: FastifyRequest,
    reply: FastifyReply
  ) {
    const { nome, email, senha } = request.body as CadastrarMembroRequest;
    
    const membroReporitory = new MembroRepository()
    const useCase = new CadastrarMembro(membroReporitory);

    const membro = await useCase.execute({ nome, email, senha });

    return reply.status(201).send(membro);
  }
}