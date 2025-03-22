import { UserRepository } from "../../infrastructure/userRepository";
import { AppError } from "../../shared/errors/AppError";
import { RegisterUserRequest } from "../entities/interfaces/registerUserRequest";

export class registerUserUseCase {
  constructor(private userRepository: UserRepository) {}

  async execute(user: RegisterUserRequest) {
    const userAlreadyExists = await this.userRepository.getByEmail(user.email);
    
    if (userAlreadyExists) {
      throw new AppError("Email já cadastrado.");
    }

    return await this.userRepository.create(user);
  }
}