import { FastifyRequest, FastifyReply } from "fastify";
import {  UserRepository } from "../../infrastructure/userRepository";
import { registerUserUseCase } from "../../core/usecases/registerUserUseCase";
import { RegisterUserRequest } from "../../core/entities/interfaces/registerUserRequest";
import { GetAllUsers } from "../../core/usecases/getAllUsersUseCase";
import { IUserRepository } from "../../core/repositories/IUserRepository";

export class UserController {
  private userRepository: IUserRepository;

  constructor() {
    this.userRepository = new UserRepository();
  }
  async register(
    request: FastifyRequest,
    reply: FastifyReply
  ) {
    const { name, email, senha, role } = request.body as RegisterUserRequest;
    
    const userUseCase = new registerUserUseCase(this.userRepository);

    const user = await userUseCase.execute({ name, email, senha, role });

    return reply.status(201).send(user);
  }

  async getAllUsers(request: FastifyRequest, reply: FastifyReply) {
    try {
      const userUseCase = new GetAllUsers(this.userRepository);
      const users = await userUseCase.execute();

      return reply.status(200).send(users);
    } catch (error: any) {
      return reply.status(500).send({ error: error.message });
    }
  }
}