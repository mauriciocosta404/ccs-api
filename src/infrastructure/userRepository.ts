import { PrismaClient, UserRole } from "@prisma/client";
import { randomUUID } from "crypto";
import {  RegisterUserRequest } from "../core/entities/interfaces/registerUserRequest";
import { User } from "../core/entities/model/User";
import { IUserRepository } from "../core/repositories/IUserRepository";
import { AppError } from "../shared/errors/AppError";

const prisma = new PrismaClient();

export class UserRepository  implements IUserRepository{
  async getByEmail(email: string): Promise<User | null> {
    const user = await prisma.user.findUnique({ where: { 
        email 
      } 
    });

   return user; 
  }
  async getById(id: string): Promise<User | null> {
    const user = await prisma.user.findUnique({ where: { id } });
    
    if (!user) {
      throw new AppError("Usuário não encontrado");
    }

    return user; 
  }
  async create(user: RegisterUserRequest) : Promise<void>{
    try {
      const id = randomUUID();
      
      await prisma.user.create({
        data: {
          id,
          name: user.name,
          email: user.email,
          senha: user.senha,
          role: user.role || UserRole.MEMBRO_NAO_BAPTIZADO,
        },
      });
    } catch (error: any)  {
      throw new AppError("Erro ao cadastrar usuário: " + error.message, 500);
    }
  }

  async getAllUsers(): Promise<User[]> {
    try {
      const users = await prisma.user.findMany();
      return users.map((user: User) =>
        new User(
          user.id,
          user.name,
          user.email,
          user.senha,
          user.role,
          user.createdAt,
          user.updatedAt
        )
      );
    } catch (error: any) {
      throw new AppError("Erro ao listar usuários: " + error.message, 500);
    }
  }
  /*
  async getByEmail(email: string) {
  }

  async getById(id: string) {
    return await prisma.user.findUnique({ where: { id } });
  }*/
}