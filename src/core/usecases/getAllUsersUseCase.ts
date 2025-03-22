import { User } from "../entities/model/User";
import { IUserRepository } from "../repositories/IUserRepository";

export class GetAllUsers {
  constructor(private userRepository: IUserRepository) {}

  async execute(): Promise<User[]> {
    return await this.userRepository.getAllUsers();
  }
}