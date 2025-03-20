import { MembroRepository } from "../../infrastructure/MembroRepository";
import { CadastrarMembroRequest } from "../entities/interfaces/CadastrarMembroRequest";

export class CadastrarMembro {
  constructor(private membroRepository: MembroRepository) {}

  async execute(membro: CadastrarMembroRequest) {
    return await this.membroRepository.cadastrar(membro);
  }
}